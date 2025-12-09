import { Injectable, BadRequestException } from '@nestjs/common'
import { Prisma, USState, $Enums } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import {
  DEMOGRAPHIC_FILTER_FIELDS,
  DemographicFilter,
  FieldFilterOps,
  FilterFieldType,
} from '../people.filters'
import {
  computePercent,
  mergeTopNWithOther,
  normalizeChildrenPresence,
  normalizeEducationBucket,
  normalizeBusinessOwner,
  normalizeHomeowner,
  normalizeIncomeBucket,
} from 'src/shared/util/stats'
import type {
  AllowedFilter,
  BucketsResult,
  BucketsWithRaw,
  NumericRange,
  NumericBucketsByField,
  PrismaVoterScalarIntKeys,
  PrismaVoterScalarStringKeys,
  StatsCategoryMap,
  PerformanceFieldKey,
} from '../people.types'
import { DistrictService } from 'src/district/services/district.service'

@Injectable()
export class StatsService extends createPrismaBase(MODELS.Voter) {
  constructor(private readonly districtService: DistrictService) {
    super()
  }
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

  private getPerformanceField(electionYear: number): PerformanceFieldKey {
    const isEvenYear = electionYear % 2 === 0
    return isEvenYear
      ? 'VotingPerformanceEvenYearGeneral'
      : 'VotingPerformanceMinorElection'
  }

  async getStats(dto: {
    state: string
    districtType?: string
    districtName?: string
    electionYear: number
    filters?: AllowedFilter[]
    filter?: Record<string, unknown>
    categories?: string[]
    numericBuckets?: Record<string, NumericRange[]>
    topN?: number
  }): Promise<{
    meta: {
      state: string
      districtType?: string
      districtName?: string
      electionYear: number
      totalConstituents: number
    }
    categories: StatsCategoryMap
  }> {
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

    const performanceField = this.getPerformanceField(electionYear)

    const resolvedDistrictId =
      state && districtType && districtName
        ? (
            await this.districtService.findFirst({
              where: {
                type: districtType,
                name: districtName,
                state: state as $Enums.DistrictUSState,
              },
              select: { id: true },
            })
          )?.id
        : undefined

    const where = this.buildWhere({
      state,
      districtId: resolvedDistrictId,
      filters,
      performanceField,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const totalConstituents = await this.model.count({ where })

    const categorySet = new Set<string>(categories)
    const BLOCKED_STATS_CATEGORIES = new Set<string>([
      'voterTelephonesCellPhoneFormatted',
      'voterTelephonesLandlineFormatted',
      'votingPerformanceEvenYearGeneral',
      'votingPerformanceMinorElection',
    ])
    type NamedTask = () => Promise<[string, BucketsResult | BucketsWithRaw]>
    const tasks: NamedTask[] = []

    const pushTask = (
      name: string,
      fn: () => Promise<BucketsResult | BucketsWithRaw>,
    ) => {
      tasks.push(() =>
        fn().then(
          (result) =>
            [name, result] as [string, BucketsResult | BucketsWithRaw],
        ),
      )
    }

    const wants = (name: string) =>
      categorySet.has(name) && !BLOCKED_STATS_CATEGORIES.has(name)

    if (wants('age')) {
      const numericMap = numericBuckets as NumericBucketsByField
      const ageRanges =
        numericMap.ageInt ||
        numericMap.Age_Int ||
        StatsService.DEFAULT_AGE_RANGES
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
      const hasIncomeIntColumn = await this.voterIncomeIntColumnExists()
      if (hasIncomeIntColumn) {
        const incomeRanges =
          (numericBuckets as Record<string, [number, number][]>)[
            'estimatedIncomeAmountInt'
          ] ||
          (numericBuckets as Record<string, [number, number][]>)[
            'Estimated_Income_Amount_Int'
          ]
        if (incomeRanges?.length) {
          pushTask('income', () =>
            this.computeNumericBuckets(
              where,
              'Estimated_Income_Amount_Int',
              totalConstituents,
              incomeRanges,
            ),
          )
        } else {
          const defaultIncomeRanges = StatsService.DEFAULT_INCOME_RANGES
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
    if (wants('businessOwner'))
      pushTask('businessOwner', () =>
        this.computeMappedStringBuckets(
          where,
          'Business_Owner',
          totalConstituents,
          (v) => normalizeBusinessOwner(v),
          { forceYesNoUnknown: true, includeRawDistribution: true },
        ),
      )

    // Support all DEMOGRAPHIC_FILTER_FIELDS as requestable facets
    for (const [apiField, meta] of Object.entries(DEMOGRAPHIC_FILTER_FIELDS)) {
      if (!wants(apiField)) continue
      // Special-case numeric demographics like ageInt: compute numeric buckets
      if (apiField === 'ageInt') {
        const numericMap = numericBuckets as NumericBucketsByField
        const ageRanges =
          numericMap.ageInt ||
          numericMap.Age_Int ||
          StatsService.DEFAULT_AGE_RANGES
        pushTask(apiField, () =>
          this.computeNumericBuckets(
            where,
            'Age_Int',
            totalConstituents,
            ageRanges,
          ),
        )
        continue
      }

      const prismaField = meta.prismaField as PrismaVoterScalarStringKeys
      if (meta.type === 'boolean') {
        pushTask(apiField, () =>
          this.computeBooleanBuckets(where, prismaField, totalConstituents),
        )
      } else {
        pushTask(apiField, () =>
          this.computeStringFieldTopN(
            where,
            prismaField,
            totalConstituents,
            topN,
          ),
        )
      }
    }

    // Limit concurrency to reduce Prisma connection pool pressure
    const concurrency = 4
    const results: Array<[string, BucketsResult | BucketsWithRaw]> = []
    for (let i = 0; i < tasks.length; i += concurrency) {
      const batch = tasks.slice(i, i + concurrency)
      const batchResults = await Promise.all(batch.map((run) => run()))
      results.push(...batchResults)
    }
    const categoriesOut: StatsCategoryMap = {}
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
    field: PrismaVoterScalarIntKeys,
    total: number,
    ranges: NumericRange[],
  ): Promise<BucketsResult> {
    const tasks = ranges.map(([min, max]) =>
      this.model.count({
        where: {
          ...baseWhere,
          [field]: { gte: min, lte: max },
        } as Prisma.VoterWhereInput,
      }),
    )
    const unknownTask = this.model.count({
      where: {
        ...baseWhere,
        [field]: null as never,
      } as Prisma.VoterWhereInput,
    })

    const promises = [...tasks, unknownTask]

    this.logger.log(
      { count: promises.length },
      'Issuing queries to compute numeric buckets',
    )
    const counts = await Promise.all(promises)

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
    field: Extract<keyof Prisma.VoterWhereInput, string>,
    total: number,
  ): Promise<BucketsResult> {
    const [trueCount, falseCount, nullCount] = await Promise.all([
      this.model.count({
        where: { ...baseWhere, [field]: true } as Prisma.VoterWhereInput,
      }),
      this.model.count({
        where: { ...baseWhere, [field]: false } as Prisma.VoterWhereInput,
      }),
      this.model.count({
        where: {
          ...baseWhere,
          [field]: null as never,
        } as Prisma.VoterWhereInput,
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

  private async computeMappedStringBuckets(
    baseWhere: Prisma.VoterWhereInput,
    field: PrismaVoterScalarStringKeys,
    total: number,
    mapToBucket: (value: string | null | undefined) => string,
    options?: { includeRawDistribution?: boolean; forceYesNoUnknown?: boolean },
  ): Promise<BucketsResult | BucketsWithRaw> {
    const rows = await this.model.groupBy({
      by: [field as Prisma.VoterScalarFieldEnum],
      where: (() => {
        const notNull: Prisma.VoterWhereInput = {
          [field]: null as never,
        } as Prisma.VoterWhereInput
        return { ...baseWhere, NOT: notNull }
      })(),
      _count: { _all: true },
    })

    type GroupRow<K extends string> = Record<K, string | null> & {
      _count: { _all: number }
    }
    const counts = new Map<string, number>()
    const raw: { label: string; count: number }[] = []
    for (const r of rows as Array<GroupRow<typeof field>>) {
      const rawValue = r[field]
      const label = mapToBucket(rawValue)
      counts.set(label, (counts.get(label) || 0) + r._count._all)
      if (options?.includeRawDistribution) {
        raw.push({ label: String(rawValue ?? ''), count: r._count._all })
      }
    }

    // Unknown: null or empty string
    const [nullCount, emptyCount] = await Promise.all([
      this.model.count({
        where: {
          ...baseWhere,
          [field]: null as never,
        } as Prisma.VoterWhereInput,
      }),
      this.model.count({
        where: { ...baseWhere, [field]: '' } as Prisma.VoterWhereInput,
      }),
    ])
    const unknownCount = nullCount + emptyCount

    const buckets: { label: string; count: number; percent: number }[] = []
    let mergedUnknown = false
    for (const [label, count] of counts.entries()) {
      const adjustedCount = label === 'Unknown' ? count + unknownCount : count
      if (label === 'Unknown') mergedUnknown = true
      buckets.push({
        label,
        count: adjustedCount,
        percent: computePercent(adjustedCount, total),
      })
    }

    if (options?.forceYesNoUnknown) {
      const yes = counts.get('Yes') || 0
      const no = counts.get('No') || 0
      const remapped = [
        { label: 'Yes', count: yes, percent: computePercent(yes, total) },
        { label: 'No', count: no, percent: computePercent(no, total) },
        {
          label: 'Unknown',
          count: unknownCount,
          percent: computePercent(unknownCount, total),
        },
      ]
      const result: any = { buckets: remapped }
      if (options?.includeRawDistribution) result.rawModelBreakdown = raw
      return result
    }

    // Add Unknown bucket only if it wasn't already merged
    if (!mergedUnknown && unknownCount > 0) {
      buckets.push({
        label: 'Unknown',
        count: unknownCount,
        percent: computePercent(unknownCount, total),
      })
    }

    const result: any = { buckets }
    if (options?.includeRawDistribution) result.rawModelBreakdown = raw
    return result
  }

  private async computeStringFieldTopN(
    baseWhere: Prisma.VoterWhereInput,
    field: PrismaVoterScalarStringKeys,
    total: number,
    topN: number,
  ): Promise<BucketsResult> {
    const rows = await this.model.groupBy({
      by: [field as Prisma.VoterScalarFieldEnum],
      where: (() => {
        const notNull: Prisma.VoterWhereInput = {
          [field]: null as never,
        } as Prisma.VoterWhereInput
        return { ...baseWhere, NOT: notNull }
      })(),
      _count: { _all: true },
    })

    type GroupRow<K extends string> = Record<K, string | null> & {
      _count: { _all: number }
    }
    const items = (rows as Array<GroupRow<typeof field>>)
      .map((r) => ({
        label: String(r[field] ?? ''),
        count: r._count._all,
      }))
      .filter((r) => r.label !== '')

    const [nullCount, emptyCount] = await Promise.all([
      this.model.count({
        where: {
          ...baseWhere,
          [field]: null as never,
        } as Prisma.VoterWhereInput,
      }),
      this.model.count({
        where: { ...baseWhere, [field]: '' } as Prisma.VoterWhereInput,
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

  private buildWhere(options: {
    state: string
    districtId?: string | undefined
    filters: AllowedFilter[]
    performanceField: PerformanceFieldKey
    demographicFilter: DemographicFilter
    electionYear: number
  }): Prisma.VoterWhereInput {
    const {
      state,
      districtId,
      filters,
      performanceField,
      demographicFilter,
      electionYear,
    } = options
    const where: Prisma.VoterWhereInput = { State: state as USState }

    if (districtId) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ DistrictLinks: { some: { districtId, state: state as USState } } })
      where.AND = andClauses
    }

    // genders
    const genderValues: string[] = []
    const includeNullGender = filters.includes('genderUnknown')
    if (filters.includes('genderMale')) genderValues.push('M')
    if (filters.includes('genderFemale')) genderValues.push('F')
    if (filters.includes('genderUnknown')) genderValues.push('')

    if (genderValues.length || includeNullGender) {
      const genderConditions: Prisma.VoterWhereInput[] = []
      if (genderValues.length) {
        genderConditions.push({ Gender: { in: genderValues } })
      }
      if (includeNullGender) {
        genderConditions.push({ Gender: null })
      }
      if (genderConditions.length === 1) {
        Object.assign(where, genderConditions[0])
      } else {
        const andClauses: Prisma.VoterWhereInput[] = []
        if (where.AND) {
          andClauses.push(
            ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
          )
        }
        andClauses.push({ OR: genderConditions })
        where.AND = andClauses
      }
    }

    // parties (see PeopleService for detailed explanation)
    const wantsDemocratic = filters.includes('partyDemocrat')
    const wantsRepublican = filters.includes('partyRepublican')
    const wantsIndependentOrOther = filters.includes('partyIndependent')
    const wantsUnknown = filters.includes('partyUnknown')

    if (
      wantsDemocratic ||
      wantsRepublican ||
      wantsIndependentOrOther ||
      wantsUnknown
    ) {
      const partyOrClauses: Prisma.VoterWhereInput[] = []
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
      if (wantsUnknown) {
        partyOrClauses.push({
          OR: [{ Parties_Description: null }, { Parties_Description: '' }],
        })
      }
      const selectsAll =
        wantsDemocratic &&
        wantsRepublican &&
        wantsIndependentOrOther &&
        wantsUnknown
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
      ['age18_25', 'age25_35', 'age35_50', 'age50Plus', 'ageUnknown'].includes(
        f,
      ),
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
      if (filters.includes('ageUnknown')) ageOr.push({ Age_Int: null as never })
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
      } as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceLikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Above Average', 'Average'] },
      } as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceUnreliableVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Below Average'] },
      } as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceUnlikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Low'] },
      } as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceFirstTimeVoters')) {
      // Match gp-api: treat no voting performance as first-time
      turnoutOr.push({
        OR: [
          {
            [performanceField]: { in: ['0%', 'Not Eligible', ''] },
          } as Prisma.VoterWhereInput,
          { [performanceField]: null as never } as Prisma.VoterWhereInput,
        ],
      })
    }
    if (filters.includes('audienceUnknown')) {
      // Unknown audience means null voting performance
      turnoutOr.push({
        [performanceField]: null as never,
      } as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceRequest')) {
      // no-op by design
    }
    if (filters.includes('incomeUnknown')) {
      // This is handled through demographic filters in contacts service
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

  private validateDemographicFilter(filter: DemographicFilter): string[] {
    const fieldNames = Object.keys(filter)
    if (fieldNames.length > StatsService.MAX_FIELDS) {
      throw new BadRequestException(
        `Too many fields in filter. Max allowed is ${StatsService.MAX_FIELDS}`,
      )
    }
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

      if (
        apiField === 'votingPerformanceEvenYearGeneral' ||
        apiField === 'votingPerformanceMinorElection'
      ) {
        const isEvenYear = electionYear % 2 === 0
        if (apiField === 'votingPerformanceEvenYearGeneral' && !isEvenYear) {
          continue
        }
        if (apiField === 'votingPerformanceMinorElection' && isEvenYear) {
          continue
        }
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
      if (value.length > StatsService.API_FIELD_MAX_CHARS) {
        throw new BadRequestException(
          `Value for ${apiField} exceeds ${StatsService.API_FIELD_MAX_CHARS} characters`,
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
    if (values.length > StatsService.API_FIELD_MAX_VALUES) {
      throw new BadRequestException(
        `Too many values for ${apiField}. Max allowed is ${StatsService.API_FIELD_MAX_VALUES}`,
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
      const perValueClauses: Prisma.VoterWhereInput[] = []
      for (const v of values) {
        if (typeof v !== 'string') {
          throw new BadRequestException(
            `Field ${apiField} only accepts string values`,
          )
        }
        if (v.length > StatsService.API_FIELD_MAX_CHARS) {
          throw new BadRequestException(
            `Value for ${apiField} exceeds ${StatsService.API_FIELD_MAX_CHARS} characters`,
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

  private async voterIncomeIntColumnExists(): Promise<boolean> {
    const rows = await this.client.$queryRaw<Array<{ exists: number }>>`
      SELECT 1 as exists
      FROM information_schema.columns
      WHERE table_schema = current_schema()
        AND table_name = ${'Voter'}
        AND column_name = ${'Estimated_Income_Amount_Int'}
      LIMIT 1
    `
    return rows.length > 0
  }
}
