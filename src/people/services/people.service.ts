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

    const _where: Prisma.VoterWhereInput = {}
    if (state) _where.State = state as USState
    const districtId = await this.districtService.findDistrictId({
      state,
      type: districtType,
      name: districtName,
    })

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
      _where.OR = [
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
        _where.AND = [
          { FirstName: { equals: fn, mode: Prisma.QueryMode.default } },
          { LastName: { equals: ln, mode: Prisma.QueryMode.default } },
        ]
      } else {
        const single = firstName ?? lastName ?? tokens[0]
        _where.OR = [
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

    // TODO: Make sure this works @Stephen
    const where = this.buildWhereSql({
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

  // DEPRECATED, left just as a reference to some of the logic Stephen is translating to raw SQL
  // TODO: Remove @Stephen when done
  private buildWhereSql(options: {
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
    // const demographicWhere = this.translateDemographicFilter(
    //   demographicFilter,
    //   electionYear,
    // )
    // if (Object.keys(demographicWhere).length) {
    //   Object.assign(where, demographicWhere)
    // }

    return where
  }

  private validateDemographicFilter(filter: DemographicFilter): string[] {
    // TODO: @Stephen, not sure if you still want to do this with the raw SQL
    // The client passing too many field might be bad for performance, up to you
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

  // TODO: @Stephen delete this when you're done
  // Leaving this just document the logic you'll need to implement for votingPerformance fields
  private translateDemographicFilter(
    filter: DemographicFilter,
    electionYear: number,
  ) {
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
    }
  }

  // TODO: Implement this @Stephen
  private buildVoterFiltersSql(
    filters: AllowedFilter[],
    electionYear: number,
    demographicFilter: DemographicFilter,
  ): Prisma.Sql | null {
    const andClauses: Prisma.Sql[] = []
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

    // TODO: Make sure this works @Stephen
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
