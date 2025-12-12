import { $Enums, Prisma, USState } from '@prisma/client'
import {
  DownloadPeopleDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
  SearchPeopleDTO,
} from '../people.schema'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SampleService } from './sample.service'
import {
  DEMOGRAPHIC_FILTER_FIELDS,
  DemographicFilter,
  FieldFilterOps,
  FilterFieldType,
} from '../people.filters'
import { buildVoterSelect } from '../people.select'
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common'
import { AllowedFilter } from '../people.types'
import { FastifyReply } from 'fastify'
import { format } from '@fast-csv/format'
import type { RowMap } from '@fast-csv/format'
import { DistrictService } from 'src/district/services/district.service'

const filterToVoterStatusMap: Partial<Record<AllowedFilter, string>> = {
  audienceUnknown: 'Unknown',
  audienceFirstTimeVoters: 'First Time',
  audienceLikelyVoters: 'Likely',
  audienceUnlikelyVoters: 'Unlikely',
  audienceSuperVoters: 'Super',
}

export const DATABASE_SCHEMA = 'green'
const VOTER_TABLENAME = 'Voter'
const DISTRICTVOTER_TABLENAME = 'DistrictVoter'

@Injectable()
export class PeopleService extends createPrismaBase(MODELS.Voter) {
  constructor(
    private readonly sampleService: SampleService,
    private readonly districtService: DistrictService,
  ) {
    super()
  }
  private static readonly MAX_FIELDS = 15
  private static readonly API_FIELD_MAX_CHARS = 100
  private static readonly API_FIELD_MAX_VALUES = 50

  private normalizePhone(input: string): string | null {
    const digits = (input || '').replace(/\D/g, '')
    if (digits.length === 11 && digits.startsWith('1')) return digits.slice(1)
    if (digits.length === 10) return digits
    return null
  }

  private formatStoredPhoneFromDigits(digits: string): string {
    const area = digits.slice(0, 3)
    const prefix = digits.slice(3, 6)
    const line = digits.slice(6)
    return `(${area}) ${prefix}-${line}`
  }

  async searchVoters(dto: SearchPeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      phone,
      name,
      firstName,
      lastName,
      resultsPerPage,
      page,
    } = dto

    const where: Prisma.VoterWhereInput = {}

    if (state) where.State = state as USState
    const hasDistrictParams = Boolean(state && districtType && districtName)
    const resolvedDistrict = hasDistrictParams
      ? await this.districtService.findFirst({
          where: {
            type: districtType,
            name: districtName,
            state: state as $Enums.DistrictUSState,
          },
          select: { id: true },
        })
      : undefined
    if (hasDistrictParams && !resolvedDistrict?.id) {
      throw new NotFoundException(
        `District not found for state=${state} type=${districtType} name=${districtName}`,
      )
    }
    const districtId = resolvedDistrict?.id

    const tokens = (name || '').trim().split(/\s+/).filter(Boolean)
    const hasNameTokens = tokens.length > 0 || firstName || lastName

    if (phone) {
      const normalized = this.normalizePhone(phone)
      if (!normalized) {
        throw new BadRequestException(
          'Invalid phone number; expected 10 digits',
        )
      }
      const formatted = this.formatStoredPhoneFromDigits(normalized)
      where.OR = [
        { VoterTelephones_CellPhoneFormatted: formatted },
        { VoterTelephones_LandlineFormatted: formatted },
      ]
    } else if (hasNameTokens) {
      const explicitFirst = Boolean(firstName)
      const explicitLast = Boolean(lastName)
      const twoTokens = tokens.length > 1

      if ((explicitFirst && explicitLast) || twoTokens) {
        const fn = firstName ?? tokens[0]
        const ln = lastName ?? tokens[tokens.length - 1]
        where.AND = [
          { FirstName: { equals: fn, mode: Prisma.QueryMode.default } },
          { LastName: { equals: ln, mode: Prisma.QueryMode.default } },
        ]
      } else {
        const single = firstName ?? lastName ?? tokens[0]
        where.OR = [
          {
            FirstName: {
              equals: single as string,
              mode: Prisma.QueryMode.default,
            },
          },
          {
            LastName: {
              equals: single as string,
              mode: Prisma.QueryMode.default,
            },
          },
        ]
      }
    }

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select: Prisma.VoterSelect = {
      id: true,
      LALVOTERID: true,
      State: true,
      FirstName: true,
      MiddleName: true,
      LastName: true,
      NameSuffix: true,
      VoterTelephones_CellPhoneFormatted: true,
      VoterTelephones_LandlineFormatted: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
      Parties_Description: true,
    }

    if (districtId) {
      const whereClause = this.rawBuildWhere({
        state,
        districtId,
        search: { phone, firstName, lastName, tokens },
      })
      const voterTable = Prisma.raw(`"${DATABASE_SCHEMA}"."${VOTER_TABLENAME}"`)
      const dvTable = Prisma.raw(
        `"${DATABASE_SCHEMA}"."${DISTRICTVOTER_TABLENAME}"`,
      )
      const countRows = await this.client.$queryRaw<{ voter_count: bigint }[]>(
        Prisma.sql`SELECT COUNT(*)::bigint AS voter_count
          FROM ${voterTable} v
          JOIN ${dvTable} dv
            ON v."State" = dv."State" AND v."id" = dv."voter_id"
          ${whereClause}`,
      )
      const totalResults = Number(countRows[0]?.voter_count ?? 0n)
      const selectKeys = Object.keys(select)
      const selectFields = selectKeys.map((k) => Prisma.raw(`v."${k}"`))
      const results = await this.client.$queryRaw<
        Array<{
          [K in keyof typeof select]: string | number | boolean | null
        }>
      >(
        Prisma.sql`SELECT ${Prisma.join(selectFields, ', ')}
          FROM ${voterTable} v
          JOIN ${dvTable} dv
            ON v."State" = dv."State" AND v."id" = dv."voter_id"
          ${whereClause}
          ORDER BY v."id"
          LIMIT ${take} OFFSET ${skip}`,
      )
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
        people: results,
      }
    }

    // Statewide querying not supported currently
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
    const _model = this.model

    const resolvedDistrict = await this.districtService.findFirst({
      where: {
        type: districtType,
        name: districtName,
        state: state as $Enums.DistrictUSState,
      },
      select: { id: true },
    })
    if (!resolvedDistrict?.id) {
      throw new NotFoundException(
        `District not found for state=${state} type=${districtType} name=${districtName}`,
      )
    }
    const resolvedDistrictId = resolvedDistrict?.id

    const _where = this.buildWhere({
      state,
      districtId: resolvedDistrictId,
      filters,
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

    const totalResultsPromise = this.rawCountForDistrict({
      state,
      districtId: resolvedDistrictId as string,
      filters,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const voterFiltersSql = this.buildVoterFiltersSql(
      filters,
      electionYear,
      filter as DemographicFilter,
    )
    const whereClause = this.rawBuildWhere({
      state,
      districtId: resolvedDistrictId as string,
      voterFiltersSql,
    })
    const voterTable = Prisma.raw(`"${DATABASE_SCHEMA}"."${VOTER_TABLENAME}"`)
    const dvTable = Prisma.raw(
      `"${DATABASE_SCHEMA}"."${DISTRICTVOTER_TABLENAME}"`,
    )
    const selectKeys = Object.keys(select)
    const selectFields = selectKeys.map((k) => Prisma.raw(`v."${k}"`))
    const [totalResults, people] = await Promise.all([
      totalResultsPromise,
      this.client.$queryRaw<
        Array<{
          [K in keyof typeof select]: string | number | boolean | null
        }>
      >(
        Prisma.sql`SELECT ${Prisma.join(selectFields, ', ')}
          FROM ${voterTable} v
          JOIN ${dvTable} dv
            ON v."State" = dv."State" AND v."id" = dv."voter_id"
          ${whereClause}
          ORDER BY v."id"
          LIMIT ${take} OFFSET ${skip}`,
      ),
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

    const districtType = dto.districtType as keyof Prisma.VoterWhereInput
    const districtName = dto.districtName
    const resolvedDistrict = await this.districtService.findFirst({
      where: {
        type: districtType,
        name: districtName,
        state: state as $Enums.DistrictUSState,
      },
      select: { id: true },
    })
    if (!resolvedDistrict?.id) {
      throw new NotFoundException(
        `District not found for state=${state} type=${districtType} name=${districtName}`,
      )
    }
    const resolvedDistrictId = resolvedDistrict?.id

    const where = this.buildWhere({
      state,
      districtId: resolvedDistrictId,
      filters,
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

    const model = this.model
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

        type CsvValue = string | number | null | undefined
        for (const person of page) {
          if (aborted) break
          const row: ExportRow = {}
          for (const key of selectedColumns) {
            row[key] = person[key as keyof typeof person] as CsvValue
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

        cursor = (page[page.length - 1] as { LALVOTERID: string }).LALVOTERID

        if (page.length < pageSize) break
      }
    } finally {
      res.raw.off('close', onClose)
      csvStream.end()
    }
  }

  async samplePeople(dto: SamplePeopleDTO) {
    return this.sampleService.samplePeople(dto)
  }
  private rawBuildWhere(args: {
    state: string
    districtId: string
    search?: {
      phone?: string
      firstName?: string
      lastName?: string
      tokens?: string[]
    }
    voterFiltersSql?: Prisma.Sql | null
  }): Prisma.Sql {
    const { state, districtId, search, voterFiltersSql } = args
    const parts: Prisma.Sql[] = []
    parts.push(
      Prisma.sql`v."State" = CAST(${state}::text AS "public"."USState")`,
    )
    parts.push(
      Prisma.sql`dv."State" = CAST(${state}::text AS "public"."USState")`,
    )
    parts.push(Prisma.sql`dv."district_id" = ${districtId}::uuid`)
    parts.push(Prisma.sql`dv."voter_id" IS NOT NULL`)
    if (search) {
      if (search.phone) {
        const digits = (search.phone || '').replace(/\D/g, '')
        const normalized =
          digits.length === 11 && digits.startsWith('1')
            ? digits.slice(1)
            : digits.length === 10
              ? digits
              : null
        if (normalized) {
          const area = normalized.slice(0, 3)
          const prefix = normalized.slice(3, 6)
          const line = normalized.slice(6)
          const formatted = `(${area}) ${prefix}-${line}`
          parts.push(
            Prisma.sql`(v."VoterTelephones_CellPhoneFormatted" = ${formatted} OR v."VoterTelephones_LandlineFormatted" = ${formatted})`,
          )
        }
      } else {
        const tokens = (search.tokens || []).filter(Boolean)
        const explicitFirst = Boolean(search.firstName)
        const explicitLast = Boolean(search.lastName)
        const twoTokens = tokens.length > 1
        if ((explicitFirst && explicitLast) || twoTokens) {
          const fn = search.firstName ?? tokens[0]
          const ln = search.lastName ?? tokens[tokens.length - 1]
          parts.push(Prisma.sql`v."FirstName" = ${fn}`)
          parts.push(Prisma.sql`v."LastName" = ${ln}`)
        } else if (tokens.length > 0 || search.firstName || search.lastName) {
          const single = search.firstName ?? search.lastName ?? tokens[0]
          parts.push(
            Prisma.sql`(v."FirstName" = ${single} OR v."LastName" = ${single})`,
          )
        }
      }
    }
    if (voterFiltersSql) {
      parts.push(voterFiltersSql)
    }
    return parts.length
      ? Prisma.sql`WHERE ${Prisma.join(parts, ' AND ')}`
      : Prisma.empty
  }
  private buildVoterSelect(
    full: boolean,
    electionYear: number,
    demographicFilter: DemographicFilter,
  ): Prisma.VoterSelect {
    return buildVoterSelect(full, electionYear, demographicFilter)
  }

  private buildWhere(options: {
    state: string
    districtId?: string | undefined
    filters: AllowedFilter[]
    demographicFilter: DemographicFilter
    electionYear: number
  }): Prisma.VoterWhereInput {
    const { state, districtId, filters, demographicFilter, electionYear } =
      options
    const where: Prisma.VoterWhereInput = { State: state as USState }

    if (districtId) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({
        DistrictLinks: { some: { districtId, state: state as USState } },
      })
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

      // Unknown party means null or empty string
      if (wantsUnknown) {
        partyOrClauses.push({
          OR: [{ Parties_Description: null }, { Parties_Description: '' }],
        })
      }

      // If all four were selected, this effectively means "everyone"; in that
      // case we can skip adding a filter altogether. Otherwise apply OR.
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

    const voterStatusFilters = filters
      .map((filter) => filterToVoterStatusMap[filter] || '')
      .filter(Boolean)
    if (voterStatusFilters.length) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ Voter_Status: { in: voterStatusFilters } })
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

  private buildCaseInsensitiveEqualsSql(
    field: string,
    value: string,
  ): Prisma.Sql {
    return Prisma.sql`LOWER(${Prisma.raw(`"${field}"`)}) = LOWER(${value})`
  }

  private buildDemographicFilterSql(
    demographicFilter: DemographicFilter,
    electionYear: number,
  ): Prisma.Sql | null {
    const fieldNames = Object.keys(demographicFilter)
    if (!fieldNames.length) return null
    const andClauses: Prisma.Sql[] = []

    for (const apiField of fieldNames) {
      const spec = DEMOGRAPHIC_FILTER_FIELDS[apiField]
      if (!spec) continue
      const ops = demographicFilter[apiField] as FieldFilterOps
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

      const perFieldClauses: Prisma.Sql[] = []

      if (ops.eq !== undefined) {
        if (type === 'boolean') {
          perFieldClauses.push(
            Prisma.sql`${Prisma.raw(`"${prismaField}"`)} = ${Boolean(ops.eq)}`,
          )
        } else {
          perFieldClauses.push(
            this.buildCaseInsensitiveEqualsSql(prismaField, String(ops.eq)),
          )
        }
      }

      if (ops.in !== undefined) {
        const values = Array.isArray(ops.in) ? ops.in : [ops.in]
        if (type === 'boolean') {
          const coerced = values.map((v) =>
            typeof v === 'boolean' ? v : String(v).toLowerCase() === 'true',
          )
          perFieldClauses.push(
            Prisma.sql`${Prisma.raw(`"${prismaField}"`)} IN (${Prisma.join(
              coerced,
            )})`,
          )
        } else {
          const orClauses = values.map((v) =>
            this.buildCaseInsensitiveEqualsSql(prismaField, String(v)),
          )
          if (orClauses.length === 1) {
            perFieldClauses.push(orClauses[0])
          } else {
            perFieldClauses.push(
              Prisma.sql`(${Prisma.join(orClauses, ' OR ')})`,
            )
          }
        }
      }

      if (ops.is === 'null') {
        perFieldClauses.push(
          Prisma.sql`${Prisma.raw(`"${prismaField}"`)} IS NULL`,
        )
      } else if (ops.is === 'not_null') {
        perFieldClauses.push(
          Prisma.sql`${Prisma.raw(`"${prismaField}"`)} IS NOT NULL`,
        )
      }

      if (perFieldClauses.length === 1) {
        andClauses.push(perFieldClauses[0])
      } else if (perFieldClauses.length > 1) {
        andClauses.push(Prisma.sql`(${Prisma.join(perFieldClauses, ' OR ')})`)
      }
    }

    if (!andClauses.length) return null
    return Prisma.sql`${Prisma.join(andClauses, ' AND ')}`
  }

  private buildVoterFiltersSql(
    filters: AllowedFilter[],
    electionYear: number,
    demographicFilter: DemographicFilter,
  ): Prisma.Sql | null {
    const andClauses: Prisma.Sql[] = []

    const genderValues: string[] = []
    const includeNullGender = filters.includes('genderUnknown')
    if (filters.includes('genderMale')) genderValues.push('M')
    if (filters.includes('genderFemale')) genderValues.push('F')
    if (filters.includes('genderUnknown')) genderValues.push('')
    if (genderValues.length || includeNullGender) {
      const orClauses: Prisma.Sql[] = []
      if (genderValues.length) {
        orClauses.push(
          Prisma.sql`${Prisma.raw('"Gender"')} IN (${Prisma.join(
            genderValues,
          )})`,
        )
      }
      if (includeNullGender) {
        orClauses.push(Prisma.sql`${Prisma.raw('"Gender"')} IS NULL`)
      }
      andClauses.push(
        orClauses.length === 1
          ? orClauses[0]
          : Prisma.sql`(${Prisma.join(orClauses, ' OR ')})`,
      )
    }

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
      const partyOrClauses: Prisma.Sql[] = []
      if (wantsDemocratic) {
        partyOrClauses.push(
          this.buildCaseInsensitiveEqualsSql(
            'Parties_Description',
            'Democratic',
          ),
        )
      }
      if (wantsRepublican) {
        partyOrClauses.push(
          this.buildCaseInsensitiveEqualsSql(
            'Parties_Description',
            'Republican',
          ),
        )
      }
      if (wantsIndependentOrOther) {
        partyOrClauses.push(
          Prisma.sql`(${Prisma.raw('"Parties_Description"')} IS NOT NULL AND ${Prisma.raw(
            '"Parties_Description"',
          )} <> '' AND NOT (${this.buildCaseInsensitiveEqualsSql(
            'Parties_Description',
            'Democratic',
          )}) AND NOT (${this.buildCaseInsensitiveEqualsSql(
            'Parties_Description',
            'Republican',
          )}))`,
        )
      }
      if (wantsUnknown) {
        partyOrClauses.push(
          Prisma.sql`(${Prisma.raw('"Parties_Description"')} IS NULL OR ${Prisma.raw(
            '"Parties_Description"',
          )} = '')`,
        )
      }
      const selectsAll =
        wantsDemocratic &&
        wantsRepublican &&
        wantsIndependentOrOther &&
        wantsUnknown
      if (!selectsAll && partyOrClauses.length) {
        andClauses.push(
          partyOrClauses.length === 1
            ? partyOrClauses[0]
            : Prisma.sql`(${Prisma.join(partyOrClauses, ' OR ')})`,
        )
      }
    }

    const usesAge = filters.some((f) =>
      ['age18_25', 'age25_35', 'age35_50', 'age50Plus', 'ageUnknown'].includes(
        f,
      ),
    )
    if (usesAge) {
      const ageOr: Prisma.Sql[] = []
      if (filters.includes('age18_25')) {
        ageOr.push(
          Prisma.sql`(${Prisma.raw('"Age_Int"')} >= 18 AND ${Prisma.raw(
            '"Age_Int"',
          )} <= 25)`,
        )
      }
      if (filters.includes('age25_35')) {
        ageOr.push(
          Prisma.sql`(${Prisma.raw('"Age_Int"')} > 25 AND ${Prisma.raw(
            '"Age_Int"',
          )} <= 35)`,
        )
      }
      if (filters.includes('age35_50')) {
        ageOr.push(
          Prisma.sql`(${Prisma.raw('"Age_Int"')} > 35 AND ${Prisma.raw(
            '"Age_Int"',
          )} <= 50)`,
        )
      }
      if (filters.includes('age50Plus')) {
        ageOr.push(Prisma.sql`${Prisma.raw('"Age_Int"')} > 50`)
      }
      if (filters.includes('ageUnknown')) {
        ageOr.push(Prisma.sql`${Prisma.raw('"Age_Int"')} IS NULL`)
      }
      andClauses.push(
        ageOr.length === 1
          ? ageOr[0]
          : Prisma.sql`(${Prisma.join(ageOr, ' OR ')})`,
      )
    }

    if (filters.includes('cellPhoneFormatted')) {
      andClauses.push(
        Prisma.sql`${Prisma.raw('"VoterTelephones_CellPhoneFormatted"')} IS NOT NULL`,
      )
    }
    if (filters.includes('landlineFormatted')) {
      andClauses.push(
        Prisma.sql`${Prisma.raw('"VoterTelephones_LandlineFormatted"')} IS NOT NULL`,
      )
    }

    const voterStatusFilters = filters
      .map((f) => filterToVoterStatusMap[f] || '')
      .filter((v) => Boolean(v))
    if (voterStatusFilters.length) {
      andClauses.push(
        Prisma.sql`${Prisma.raw('"Voter_Status"')} IN (${Prisma.join(
          voterStatusFilters,
        )})`,
      )
    }

    const demographicSql = this.buildDemographicFilterSql(
      demographicFilter,
      electionYear,
    )
    if (demographicSql) {
      andClauses.push(demographicSql)
    }

    if (!andClauses.length) return null
    return Prisma.sql`${Prisma.join(andClauses, ' AND ')}`
  }

  private async rawCountForDistrict(args: {
    state: string
    districtId: string
    filters: AllowedFilter[]
    demographicFilter: DemographicFilter
    electionYear: number
  }): Promise<number> {
    const { state, districtId, filters, demographicFilter, electionYear } = args
    const voterFiltersSql = this.buildVoterFiltersSql(
      filters,
      electionYear,
      demographicFilter,
    )
    if (!voterFiltersSql) {
      const rows = await this.client.$queryRaw<{ voter_count: bigint }[]>(
        Prisma.sql`SELECT COUNT(*)::bigint AS voter_count
          FROM "green"."DistrictVoter" dv
          WHERE dv."State" = CAST(${state}::text AS "public"."USState")
            AND dv."district_id" = ${districtId}::uuid`,
      )
      const count = rows[0]?.voter_count ?? 0n
      return Number(count)
    }
    const rows = await this.client.$queryRaw<{ voter_count: bigint }[]>(
      Prisma.sql`SELECT COUNT(*)::bigint AS voter_count
        FROM "green"."DistrictVoter" dv
        JOIN "green"."Voter" v
          ON v."State" = dv."State"
         AND v."id"    = dv."voter_id"
        WHERE dv."State" = CAST(${state}::text AS "public"."USState")
          AND dv."district_id" = ${districtId}::uuid
          AND ${voterFiltersSql}`,
    )
    const count = rows[0]?.voter_count ?? 0n
    return Number(count)
  }
}
