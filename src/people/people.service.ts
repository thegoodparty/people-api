import { PrismaService } from 'src/prisma/prisma.service'
import { Prisma } from '@prisma/client'
import { DownloadPeopleDTO, ListPeopleDTO, StatsDTO } from './people.schema'
import {
  DEMOGRAPHIC_FILTER_FIELDS,
  DemographicFilter,
  FieldFilterOps,
  FilterFieldType,
} from './people.filters'
import { BadRequestException, Injectable } from '@nestjs/common'
import {
  AllowedFilter,
  AnyElectionYearKey,
  GeneralYearKey,
  OtherElectionYearKey,
  PerformanceFieldKey,
  PresidentialPrimaryYearKey,
  PrimaryYearKey,
  YearSelectKey,
} from './people.types'
import { FastifyReply } from 'fastify'
import { format } from '@fast-csv/format'
import type { RowMap } from '@fast-csv/format'
import {
  computePercent,
  mergeTopNWithOther,
  normalizeChildrenPresence,
  normalizeEducationBucket,
  normalizeHomeowner,
  normalizeIncomeBucket,
} from 'src/shared/util/stats'

@Injectable()
export class PeopleService {
  constructor(private readonly prisma: PrismaService) {}

  private static readonly MAX_FIELDS = 15
  private static readonly API_FIELD_MAX_CHARS = 100
  private static readonly API_FIELD_MAX_VALUES = 50
  private static readonly DEFAULT_AGE_RANGES: [number, number][] = [
    [18, 25],
    [26, 35],
    [36, 50],
    [51, 200],
  ]
  private static readonly DEFAULT_INCOME_RANGES: [number, number][] = [
    [0, 24999],
    [25000, 50000],
    [50001, 75000],
    [75001, 100000],
    [100001, 150000],
    [150001, 1000000000],
  ]
  private validateDistrictType(districtType?: string): void {
    if (!districtType) return
    const isValidField = Object.values(Prisma.VoterScalarFieldEnum).includes(
      districtType as Prisma.VoterScalarFieldEnum,
    )
    if (!isValidField) {
      throw new BadRequestException(
        `Unsupported districtType: ${districtType as string}`,
      )
    }
  }

  private getPerformanceField(electionYear: number): PerformanceFieldKey {
    const isEvenYear = electionYear % 2 === 0
    return isEvenYear
      ? 'VotingPerformanceEvenYearGeneral'
      : 'VotingPerformanceMinorElection'
  }

  async findPeople(dto: ListPeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      electionYear,
      resultsPerPage,
      page,
      filters = [],
      full = true,
      filter = {},
    } = dto
    const model = this.prisma.voter

    // Validate districtType against Prisma enum if provided
    this.validateDistrictType(districtType)

    const performanceField = this.getPerformanceField(electionYear)

    const where = this.buildWhere({
      state,
      districtType: districtType as keyof Prisma.VoterWhereInput | undefined,
      districtName,
      filters,
      performanceField,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select = this.buildVoterSelect(
      full,
      electionYear,
      filter as DemographicFilter,
    )

    const [totalResults, people] = await Promise.all([
      model.count({ where }),
      model.findMany({ where, take, skip, select }),
    ])

    const totalPages = Math.max(1, Math.ceil(totalResults / resultsPerPage))
    const currentPage = Math.min(Math.max(1, page), totalPages)

    return {
      pagination: {
        totalResults,
        currentPage,
        pageSize: resultsPerPage,
        totalPages,
        hasNextPage: currentPage < totalPages,
        hasPreviousPage: currentPage > 1,
      },
      people,
    }
  }

  async streamPeopleCsv(dto: DownloadPeopleDTO, res: FastifyReply) {
    const {
      state,
      electionYear = new Date().getFullYear(),
      full = true,
      filter = {},
      filters = [],
    } = dto

    const districtType = (dto.districtType ?? dto.electionLocation) as
      | keyof Prisma.VoterWhereInput
      | undefined
    const districtName = dto.districtName ?? dto.electionType

    // Validate districtType against Prisma enum if provided
    this.validateDistrictType(districtType as string | undefined)

    const performanceField = this.getPerformanceField(electionYear)

    const where = this.buildWhere({
      state,
      districtType,
      districtName,
      filters,
      performanceField,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const select = this.buildVoterSelect(
      full,
      electionYear,
      filter as DemographicFilter,
    )
    const selectedColumns = Object.keys(select)
    const headers = [...selectedColumns, 'electionLocation', 'electionType']

    type ExportRow = RowMap<string | number | null | undefined>
    const csvStream = format<ExportRow, ExportRow>({ headers })
    csvStream.pipe(res.raw)

    const model = this.prisma.voter
    const pageSize = 5000
    let cursor: string | undefined
    let aborted = false

    const onClose = () => {
      aborted = true
    }
    res.raw.on('close', onClose)

    try {
      // pagination loop
      for (;;) {
        if (aborted) break

        const page = await model.findMany({
          where,
          select,
          orderBy: { LALVOTERID: 'asc' },
          take: pageSize,
          ...(cursor
            ? { skip: 1, cursor: { LALVOTERID: cursor as string } }
            : {}),
        })

        if (!page.length) break

        type PrismaRow = Record<string, string | number | null | undefined>
        for (const person of page as unknown as PrismaRow[]) {
          if (aborted) break
          const row: ExportRow = {}
          for (const key of selectedColumns) {
            row[key] = person[key]
          }
          row.electionLocation = districtType ?? ''
          row.electionType = districtName ?? ''

          const canContinue = csvStream.write(row)
          if (!canContinue) {
            await new Promise<void>((resolve) =>
              csvStream.once('drain', resolve),
            )
          }
        }

        cursor = (page[page.length - 1] as unknown as { LALVOTERID: string })
          .LALVOTERID

        if (page.length < pageSize) break
      }
    } finally {
      res.raw.off('close', onClose)
      csvStream.end()
    }
  }

  async getStats(dto: StatsDTO) {
    const {
      state,
      districtType,
      districtName,
      electionYear,
      filters = [],
      filter = {},
      categories = [],
      numericBuckets = {},
      topN = 10,
    } = dto

    // Validate districtType against Prisma enum if provided
    this.validateDistrictType(districtType as string | undefined)

    const performanceField = this.getPerformanceField(electionYear)

    const where = this.buildWhere({
      state,
      districtType: districtType as keyof Prisma.VoterWhereInput | undefined,
      districtName,
      filters,
      performanceField,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const totalConstituents = await this.prisma.voter.count({ where })

    const categorySet = new Set<string>(categories)

    const tasks: Array<Promise<[string, unknown]>> = []

    const pushTask = (name: string, fn: () => Promise<unknown>) => {
      tasks.push(
        fn().then((result) => [name, result]) as Promise<[string, unknown]>,
      )
    }

    const wants = (name: string) => categorySet.has(name)

    if (wants('age')) {
      const ageRanges =
        (numericBuckets as Record<string, [number, number][]>).ageInt ||
        (numericBuckets as Record<string, [number, number][]>).Age_Int ||
        PeopleService.DEFAULT_AGE_RANGES
      pushTask('age', () =>
        this.computeNumericBuckets(
          where,
          'Age_Int',
          totalConstituents,
          ageRanges,
        ),
      )
    }
    if (wants('homeowner'))
      pushTask('homeowner', () =>
        this.computeMappedStringBuckets(
          where,
          'Homeowner_Probability_Model',
          totalConstituents,
          (v) => normalizeHomeowner(v),
          { includeRawDistribution: true },
        ),
      )
    if (wants('income')) {
      const incomeRanges =
        (numericBuckets as Record<string, [number, number][]>)
          .estimatedIncomeAmountInt ||
        (numericBuckets as Record<string, [number, number][]>)
          .Estimated_Income_Amount_Int

      if (incomeRanges && incomeRanges.length) {
        pushTask('income', () =>
          this.computeNumericBuckets(
            where,
            'Estimated_Income_Amount_Int',
            totalConstituents,
            incomeRanges,
          ),
        )
      } else {
        // Prefer numeric defaults if available; otherwise fallback to string mapping
        const defaultIncomeRanges = PeopleService.DEFAULT_INCOME_RANGES
        pushTask('income', async () => {
          const numeric = await this.computeNumericBuckets(
            where,
            'Estimated_Income_Amount_Int',
            totalConstituents,
            defaultIncomeRanges,
          )
          const sumKnown = (
            numeric.buckets as Array<{ label: string; count: number }>
          )
            .filter((b) => b.label !== 'Unknown')
            .reduce((acc, b) => acc + b.count, 0)
          if (sumKnown > 0) return numeric
          return this.computeMappedStringBuckets(
            where,
            'Estimated_Income_Amount',
            totalConstituents,
            (v) => normalizeIncomeBucket(v),
          )
        })
      }
    }
    if (wants('education'))
      pushTask('education', () =>
        this.computeMappedStringBuckets(
          where,
          'Education_Of_Person',
          totalConstituents,
          (v) => normalizeEducationBucket(v),
        ),
      )
    if (wants('familyChildren'))
      pushTask('familyChildren', () =>
        this.computeMappedStringBuckets(
          where,
          'Presence_Of_Children',
          totalConstituents,
          (v) => normalizeChildrenPresence(v),
          { forceYesNoUnknown: true },
        ),
      )
    if (wants('familyMarital'))
      pushTask('familyMarital', () =>
        this.computeStringFieldTopN(
          where,
          'Marital_Status',
          totalConstituents,
          topN,
        ),
      )

    // Support all DEMOGRAPHIC_FILTER_FIELDS as requestable facets
    for (const [apiField, meta] of Object.entries(DEMOGRAPHIC_FILTER_FIELDS)) {
      if (!wants(apiField)) continue
      const prismaField = meta.prismaField as keyof Prisma.VoterWhereInput
      if (meta.type === 'boolean') {
        pushTask(apiField, () =>
          this.computeBooleanBuckets(
            where,
            prismaField as string,
            totalConstituents,
          ),
        )
      } else {
        pushTask(apiField, () =>
          this.computeStringFieldTopN(
            where,
            prismaField as string,
            totalConstituents,
            topN,
          ),
        )
      }
    }

    const results = await Promise.all(tasks)
    const categoriesOut: Record<string, unknown> = {}
    for (const [name, value] of results) categoriesOut[name] = value

    return {
      meta: {
        state,
        districtType,
        districtName,
        electionYear,
        totalConstituents,
      },
      categories: categoriesOut,
    }
  }

  private async computeNumericBuckets(
    baseWhere: Prisma.VoterWhereInput,
    field: string,
    total: number,
    ranges: [number, number][],
  ) {
    const tasks = ranges.map(([min, max]) =>
      this.prisma.voter.count({
        where: {
          ...baseWhere,
          [field]: { gte: min, lte: max } as any,
        } as any,
      }),
    )
    const unknownTask = this.prisma.voter.count({
      where: { ...baseWhere, [field]: null } as any,
    })
    const counts = await Promise.all([...tasks, unknownTask])

    const buckets = [
      ...ranges.map(([min, max], idx) => ({
        label: `${min}-${max}`,
        count: counts[idx],
        percent: computePercent(counts[idx], total),
      })),
      {
        label: 'Unknown',
        count: counts[counts.length - 1],
        percent: computePercent(counts[counts.length - 1], total),
      },
    ]
    return { buckets }
  }

  private async computeBooleanBuckets(
    baseWhere: Prisma.VoterWhereInput,
    field: string,
    total: number,
  ) {
    const [trueCount, falseCount, nullCount] = await Promise.all([
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: true } as any,
      }),
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: false } as any,
      }),
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: null } as any,
      }),
    ])
    const buckets = [
      {
        label: 'Yes',
        count: trueCount,
        percent: computePercent(trueCount, total),
      },
      {
        label: 'No',
        count: falseCount,
        percent: computePercent(falseCount, total),
      },
      {
        label: 'Unknown',
        count: nullCount,
        percent: computePercent(nullCount, total),
      },
    ]
    return { buckets }
  }

  private async computeMappedStringBuckets<Label extends string>(
    baseWhere: Prisma.VoterWhereInput,
    field: string,
    total: number,
    mapToBucket: (value: string | null | undefined) => Label,
    options?: { includeRawDistribution?: boolean; forceYesNoUnknown?: boolean },
  ) {
    const rows = await this.prisma.voter.groupBy({
      by: [field as any],
      where: { ...baseWhere, NOT: { [field]: null } as any },
      _count: { _all: true },
    })

    const counts = new Map<Label, number>()
    const raw: { label: string; count: number }[] = []
    for (const r of rows as Array<
      Record<string, unknown> & { _count: { _all: number } }
    >) {
      const rawValue = (r as any)[field] as string | null | undefined
      const label = mapToBucket(rawValue)
      counts.set(label, (counts.get(label) || 0) + r._count._all)
      if (options?.includeRawDistribution) {
        raw.push({ label: String(rawValue ?? ''), count: r._count._all })
      }
    }

    // Unknown: null or empty string
    const [nullCount, emptyCount] = await Promise.all([
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: null } as any,
      }),
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: '' } as any,
      }),
    ])
    const unknownCount = nullCount + emptyCount

    // If forcing Yes/No/Unknown, ensure all three keys are present
    const buckets: { label: string; count: number; percent: number }[] = []
    for (const [label, count] of counts.entries()) {
      buckets.push({
        label: String(label),
        count,
        percent: computePercent(count, total),
      })
    }

    if (options?.forceYesNoUnknown) {
      const ensure = (label: Label) => {
        if (!counts.has(label)) counts.set(label, 0)
      }
      // @ts-expect-error ensure typed labels exist when we know the domain
      ensure('Yes')
      // @ts-expect-error ensure typed labels exist when we know the domain
      ensure('No')
      // @ts-expect-error ensure typed labels exist when we know the domain
      ensure('Unknown')
      // Rebuild buckets in preferred order Yes/No/Unknown
      const ordered: Array<Label> = [
        'Yes',
        'No',
        'Unknown',
      ] as unknown as Array<Label>
      const remapped = ordered.map((lab) => {
        const c =
          lab === ('Unknown' as unknown as Label)
            ? unknownCount
            : counts.get(lab) || 0
        return {
          label: String(lab),
          count: c,
          percent: computePercent(c, total),
        }
      })
      const result: any = { buckets: remapped }
      if (options?.includeRawDistribution) result.rawModelBreakdown = raw
      return result
    }

    // Add Unknown bucket
    buckets.push({
      label: 'Unknown',
      count: unknownCount,
      percent: computePercent(unknownCount, total),
    })

    const result: any = { buckets }
    if (options?.includeRawDistribution) result.rawModelBreakdown = raw
    return result
  }

  private async computeStringFieldTopN(
    baseWhere: Prisma.VoterWhereInput,
    field: string,
    total: number,
    topN: number,
  ) {
    const rows = await this.prisma.voter.groupBy({
      by: [field as any],
      where: { ...baseWhere, NOT: { [field]: null } as any },
      _count: { _all: true },
    })

    const items = rows
      .map((r: any) => ({
        label: String(r[field] ?? ''),
        count: r._count._all,
      }))
      .filter((r) => r.label !== '')

    const [nullCount, emptyCount] = await Promise.all([
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: null } as any,
      }),
      this.prisma.voter.count({
        where: { ...baseWhere, [field]: '' } as any,
      }),
    ])
    const unknownCount = nullCount + emptyCount

    const { top, other } = mergeTopNWithOther(items, topN)
    const buckets = [
      ...top.map((r) => ({
        label: r.label,
        count: r.count,
        percent: computePercent(r.count, total),
      })),
      ...(other
        ? [
            {
              label: 'Other',
              count: other,
              percent: computePercent(other, total),
            },
          ]
        : []),
      {
        label: 'Unknown',
        count: unknownCount,
        percent: computePercent(unknownCount, total),
      },
    ]
    return { buckets }
  }

  private buildVoterSelect(
    full: boolean,
    electionYear: number,
    _demographicFilter: DemographicFilter,
  ): Prisma.VoterSelect {
    const isEvenYear = electionYear % 2 === 0
    if (full) {
      const select: Prisma.VoterSelect = {
        LALVOTERID: true,
        State: true,
        FirstName: true,
        MiddleName: true,
        LastName: true,
        NameSuffix: true,
        Residence_Addresses_AddressLine: true,
        Residence_Addresses_ExtraAddressLine: true,
        Residence_Addresses_City: true,
        Residence_Addresses_State: true,
        Residence_Addresses_Zip: true,
        Residence_Addresses_ZipPlus4: true,
        Mailing_Addresses_AddressLine: true,
        Mailing_Addresses_ExtraAddressLine: true,
        Mailing_Addresses_City: true,
        Mailing_Addresses_State: true,
        Mailing_Addresses_Zip: true,
        Mailing_Addresses_ZipPlus4: true,
        VoterTelephones_LandlineFormatted: true,
        VoterTelephones_CellPhoneFormatted: true,
        Age: true,
        Gender: true,
        Parties_Description: true,
        US_Congressional_District: true,
        State_Senate_District: true,
        State_House_District: true,
        County: true,
        City: true,
        Precinct: true,
      }

      if (isEvenYear) {
        ;(select as Record<YearSelectKey, boolean>)[
          `General_${electionYear}` as GeneralYearKey
        ] = true
        ;(select as Record<YearSelectKey, boolean>)[
          `Primary_${electionYear}` as PrimaryYearKey
        ] = true
        ;(select as Record<YearSelectKey, boolean>)[
          `OtherElection_${electionYear}` as OtherElectionYearKey
        ] = true
        if (electionYear % 4 === 0) {
          ;(select as Record<YearSelectKey, boolean>)[
            `PresidentialPrimary_${electionYear}` as PresidentialPrimaryYearKey
          ] = true
        }
      } else {
        ;(select as Record<YearSelectKey, boolean>)[
          `AnyElection_${electionYear}` as AnyElectionYearKey
        ] = true
      }

      this.addAllDemographicColumnsToSelect(select)

      return select
    }
    const minimal: Prisma.VoterSelect = {
      LALVOTERID: true,
      State: true,
      FirstName: true,
      LastName: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
    }

    this.addAllDemographicColumnsToSelect(minimal)

    return minimal
  }

  private addAllDemographicColumnsToSelect(select: Prisma.VoterSelect): void {
    for (const spec of Object.values(DEMOGRAPHIC_FILTER_FIELDS)) {
      ;(select as Record<string, boolean>)[spec.prismaField as string] = true
    }
  }

  private buildWhere(options: {
    state: string
    districtType?: keyof Prisma.VoterWhereInput | undefined
    districtName?: string | undefined
    filters: AllowedFilter[]
    performanceField: PerformanceFieldKey
    demographicFilter: DemographicFilter
    electionYear: number
  }): Prisma.VoterWhereInput {
    const {
      state,
      districtType,
      districtName,
      filters,
      performanceField,
      demographicFilter,
      electionYear,
    } = options
    const where: Prisma.VoterWhereInput = { State: state }

    if (districtType && districtName) {
      // This cast allows us to avoid making a code change every time a new district type is introduced
      ;(where as Record<string, unknown>)[districtType] = {
        equals: districtName,
      }
    }

    // genders
    const genderValues: string[] = []
    if (filters.includes('genderMale')) genderValues.push('M')
    if (filters.includes('genderFemale')) genderValues.push('F')
    if (filters.includes('genderUnknown')) genderValues.push('')
    if (genderValues.length) where.Gender = { in: genderValues }

    // const partyValues: string[] = []
    // if (filters.includes('partyDemocrat')) partyValues.push('Democratic')
    // if (filters.includes('partyRepublican')) partyValues.push('Republican')
    // if (filters.includes('partyIndependent'))
    //   partyValues.push('Non-Partisan', 'Other')
    // if (partyValues.length) where.Parties_Description = { in: partyValues }
    // parties
    const wantsDemocratic = filters.includes('partyDemocrat')
    const wantsRepublican = filters.includes('partyRepublican')
    const wantsIndependentOrOther = filters.includes('partyIndependent')

    if (wantsDemocratic || wantsRepublican || wantsIndependentOrOther) {
      // Build an OR of acceptable party conditions to correctly support
      // "independent" meaning everything that is NOT Democratic/Republican,
      // and combinations like Republican + Independent => exclude Democrats.
      const partyOrClauses: Prisma.VoterWhereInput[] = []

      // Explicit party inclusions (case-insensitive)
      if (wantsDemocratic) {
        partyOrClauses.push({
          Parties_Description: { equals: 'Democratic', mode: 'insensitive' },
        })
      }
      if (wantsRepublican) {
        partyOrClauses.push({
          Parties_Description: { equals: 'Republican', mode: 'insensitive' },
        })
      }

      // Independent means: anything non-null and non-empty except Democratic or Republican (case-insensitive)
      if (wantsIndependentOrOther) {
        partyOrClauses.push({
          AND: [
            {
              NOT: {
                Parties_Description: {
                  equals: 'Democratic',
                  mode: 'insensitive',
                },
              },
            },
            {
              NOT: {
                Parties_Description: {
                  equals: 'Republican',
                  mode: 'insensitive',
                },
              },
            },
            { Parties_Description: { not: '' } },
            { Parties_Description: { not: null } },
          ],
        })
      }

      // If all three were selected, this effectively means "everyone"; in that
      // case we can skip adding a filter altogether. Otherwise apply OR.
      const selectsAll =
        wantsDemocratic && wantsRepublican && wantsIndependentOrOther
      if (!selectsAll && partyOrClauses.length) {
        const andClauses: Prisma.VoterWhereInput[] = []
        if (where.AND) {
          andClauses.push(
            ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
          )
        }
        andClauses.push({ OR: partyOrClauses })
        where.AND = andClauses
      }
    }

    // age buckets on indexed integer column
    const usesAge = filters.some((f) =>
      ['age18_25', 'age25_35', 'age35_50', 'age50Plus'].includes(f),
    )
    if (usesAge) {
      type AgeClause = Prisma.VoterWhereInput & {
        Age_Int?: Prisma.IntNullableFilter
      }
      const ageOr: AgeClause[] = []
      if (filters.includes('age18_25'))
        ageOr.push({ Age_Int: { gte: 18, lte: 25 } })
      if (filters.includes('age25_35'))
        ageOr.push({ Age_Int: { gt: 25, lte: 35 } })
      if (filters.includes('age35_50'))
        ageOr.push({ Age_Int: { gt: 35, lte: 50 } })
      if (filters.includes('age50Plus')) ageOr.push({ Age_Int: { gt: 50 } })
      if (ageOr.length) {
        const andClauses: Prisma.VoterWhereInput[] = []
        if (where.AND) {
          andClauses.push(
            ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
          )
        }
        andClauses.push({ OR: ageOr })
        where.AND = andClauses
      }
    }

    // phones
    if (filters.includes('cellPhoneFormatted')) {
      where.VoterTelephones_CellPhoneFormatted = { not: null }
    }
    if (filters.includes('landlineFormatted')) {
      where.VoterTelephones_LandlineFormatted = { not: null }
    }

    // audience filters
    const turnoutOr: Prisma.VoterWhereInput[] = []
    if (filters.includes('audienceSuperVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['High'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceLikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Above Average', 'Average'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceUnreliableVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Below Average'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceUnlikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Low'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceFirstTimeVoters')) {
      // Match gp-api: treat no voting performance as first-time
      turnoutOr.push({
        OR: [
          {
            [performanceField]: { in: ['0%', 'Not Eligible', ''] },
          } as unknown as Prisma.VoterWhereInput,
          { [performanceField]: null } as unknown as Prisma.VoterWhereInput,
        ],
      })
    }
    if (filters.includes('audienceRequest')) {
      // no-op by design
    }
    if (turnoutOr.length) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ OR: turnoutOr })
      where.AND = andClauses
    }

    // demographic filter translation
    const demographicWhere = this.translateDemographicFilter(
      demographicFilter,
      electionYear,
    )
    if (Object.keys(demographicWhere).length) {
      Object.assign(where, demographicWhere)
    }

    return where
  }

  private processEqualityOperation(
    apiField: string,
    prismaField: string,
    type: FilterFieldType,
    value: unknown,
  ): Prisma.VoterWhereInput {
    if (type === 'boolean') {
      let coercedValue = value
      if (typeof value === 'string') {
        const s = value.toLowerCase()
        if (s === 'true') coercedValue = true
        else if (s === 'false') coercedValue = false
        else {
          throw new BadRequestException(`Field ${apiField} expects true/false`)
        }
      }
      if (typeof coercedValue !== 'boolean') {
        throw new BadRequestException(
          `Field ${apiField} expects a boolean for eq`,
        )
      }
      return { [prismaField]: coercedValue as boolean } as never
    } else {
      if (typeof value !== 'string') {
        throw new BadRequestException(
          `Field ${apiField} expects a string for eq`,
        )
      }
      if (value.length > PeopleService.API_FIELD_MAX_CHARS) {
        throw new BadRequestException(
          `Value for ${apiField} exceeds ${PeopleService.API_FIELD_MAX_CHARS} characters`,
        )
      }
      return {
        [prismaField]: { equals: value, mode: 'insensitive' },
      } as never
    }
  }

  private processInclusionOperation(
    apiField: string,
    prismaField: string,
    type: FilterFieldType,
    inValue: unknown[] | unknown,
  ): Prisma.VoterWhereInput | null {
    const values = Array.isArray(inValue) ? inValue : [inValue]
    if (!values.length) return null
    if (values.length > PeopleService.API_FIELD_MAX_VALUES) {
      throw new BadRequestException(
        `Too many values for ${apiField}. Max allowed is ${PeopleService.API_FIELD_MAX_VALUES}`,
      )
    }

    if (type === 'boolean') {
      const coerced: boolean[] = []
      for (const v of values) {
        if (typeof v === 'boolean') {
          coerced.push(v)
        } else if (typeof v === 'string') {
          const s = v.toLowerCase()
          if (s === 'true') coerced.push(true)
          else if (s === 'false') coerced.push(false)
          else
            throw new BadRequestException(
              `Field ${apiField} only accepts true/false`,
            )
        } else {
          throw new BadRequestException(
            `Field ${apiField} only accepts boolean values`,
          )
        }
      }
      return { [prismaField]: { in: coerced } } as never
    } else {
      // string case-insensitive IN -> OR of equals with mode insensitive
      const perValueClauses: Prisma.VoterWhereInput[] = []
      for (const v of values) {
        if (typeof v !== 'string') {
          throw new BadRequestException(
            `Field ${apiField} only accepts string values`,
          )
        }
        if (v.length > PeopleService.API_FIELD_MAX_CHARS) {
          throw new BadRequestException(
            `Value for ${apiField} exceeds ${PeopleService.API_FIELD_MAX_CHARS} characters`,
          )
        }
        perValueClauses.push({
          [prismaField]: { equals: v, mode: 'insensitive' },
        } as never)
      }
      if (perValueClauses.length === 1) {
        return perValueClauses[0]
      } else {
        return { OR: perValueClauses }
      }
    }
  }

  private processNullOperation(
    prismaField: string,
    isOperator: 'null' | 'not_null',
  ): Prisma.VoterWhereInput {
    if (isOperator === 'null') {
      return { [prismaField]: null } as never
    } else {
      return { NOT: { [prismaField]: null } } as never
    }
  }

  private combineFieldClauses(
    clauses: Prisma.VoterWhereInput[],
    andClauses: Prisma.VoterWhereInput[],
  ): void {
    // If we have multiple clauses for this field that must be ORed (e.g., IN + is:null)
    if (clauses.length === 1) {
      const single = clauses[0]
      if (single) andClauses.push(single)
    } else if (clauses.length > 1) {
      andClauses.push({ OR: clauses })
    }
  }

  private finalizeWhereClause(
    where: Prisma.VoterWhereInput,
    andClauses: Prisma.VoterWhereInput[],
  ): Prisma.VoterWhereInput {
    if (andClauses.length) {
      if (where.AND) {
        andClauses.unshift(
          ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
        )
      }
      where.AND = andClauses
    }
    return where
  }

  private validateDemographicFilter(filter: DemographicFilter): string[] {
    const fieldNames = Object.keys(filter)
    // enforce max fields
    if (fieldNames.length > PeopleService.MAX_FIELDS) {
      throw new BadRequestException(
        `Too many fields in filter. Max allowed is ${PeopleService.MAX_FIELDS}`,
      )
    }

    // validate field names
    for (const apiField of fieldNames) {
      const spec = DEMOGRAPHIC_FILTER_FIELDS[apiField]
      if (!spec) {
        throw new BadRequestException(`Unsupported filter field: ${apiField}`)
      }
    }

    return fieldNames
  }

  private translateDemographicFilter(
    filter: DemographicFilter,
    electionYear: number,
  ): Prisma.VoterWhereInput {
    const where: Prisma.VoterWhereInput = {}
    const andClauses: Prisma.VoterWhereInput[] = []

    const fieldNames = this.validateDemographicFilter(filter)
    if (!fieldNames.length) return where

    for (const apiField of fieldNames) {
      const spec = DEMOGRAPHIC_FILTER_FIELDS[apiField]
      const ops = filter[apiField] as FieldFilterOps
      const { type } = spec
      let { prismaField } = spec

      // Handle voting performance fields dynamically based on election year
      if (
        apiField === 'votingPerformanceEvenYearGeneral' ||
        apiField === 'votingPerformanceMinorElection'
      ) {
        const isEvenYear = electionYear % 2 === 0
        if (apiField === 'votingPerformanceEvenYearGeneral' && !isEvenYear) {
          continue // Skip this field for odd years
        }
        if (apiField === 'votingPerformanceMinorElection' && isEvenYear) {
          continue // Skip this field for even years
        }
        // Use the appropriate field based on election year
        prismaField = isEvenYear
          ? 'VotingPerformanceEvenYearGeneral'
          : 'VotingPerformanceMinorElection'
      }

      const clauses: Prisma.VoterWhereInput[] = []

      if (ops.eq !== undefined) {
        const eqClause = this.processEqualityOperation(
          apiField,
          prismaField,
          type,
          ops.eq,
        )
        clauses.push(eqClause)
      }

      if (ops.in !== undefined) {
        const inClause = this.processInclusionOperation(
          apiField,
          prismaField,
          type,
          ops.in,
        )
        if (inClause) {
          clauses.push(inClause)
        }
      }

      if (ops.is === 'null' || ops.is === 'not_null') {
        const nullClause = this.processNullOperation(prismaField, ops.is)
        clauses.push(nullClause)
      }

      this.combineFieldClauses(clauses, andClauses)
    }

    return this.finalizeWhereClause(where, andClauses)
  }
}
