import { $Enums, Prisma, USState } from '@prisma/client'
import {
  DownloadPeopleDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
  SearchPeopleDTO,
  ListPeopleSchema,
  DownloadPeopleSchema,
} from '../people.schema'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SampleService } from './sample.service'

import { buildVoterSelect } from '../people.select'
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common'
import { FilterData } from '../schemas/filters.schema'
import { buildVoterFiltersSql } from '../utils/filters.sql.utils'
import { FastifyReply } from 'fastify'
import { format } from '@fast-csv/format'
import type { RowMap } from '@fast-csv/format'
import { DistrictService } from 'src/district/services/district.service'

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
      districtType = '',
      districtName = '',
      electionYear,
      resultsPerPage,
      page,
      filters,
      full = true,
    } = dto as ListPeopleSchema

    let resolvedDistrictId: string | null = null
    if (districtName && districtType) {
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
      resolvedDistrictId = resolvedDistrict.id
    }

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select = this.buildVoterSelect(full, electionYear)

    const totalResultsPromise = this.rawCountForDistrict({
      state,
      districtId: resolvedDistrictId as string,
      filters,
      electionYear,
    })

    const voterFiltersSql = buildVoterFiltersSql(filters)
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
    const joinClause = resolvedDistrictId
      ? Prisma.sql`JOIN ${dvTable} dv
            ON v."State" = dv."State" AND v."id" = dv."voter_id"`
      : Prisma.empty
    const [totalResults, people] = await Promise.all([
      totalResultsPromise,
      this.client.$queryRaw<
        Array<{
          [K in keyof typeof select]: string | number | boolean | null
        }>
      >(
        Prisma.sql`SELECT ${Prisma.join(selectFields, ', ')}
          FROM ${voterTable} v
          ${joinClause}
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
    } = dto as DownloadPeopleSchema

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

    // TODO: @Nikao, connect once new filters are there
    const where = this.temporaryBuildWhereSql({
      state,
      districtId: resolvedDistrictId,
    })

    const select = this.buildVoterSelect(full, electionYear)
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
    districtId?: string
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
    if (districtId) {
      parts.push(
        Prisma.sql`dv."State" = CAST(${state}::text AS "public"."USState")`,
      )
      parts.push(Prisma.sql`dv."district_id" = ${districtId}::uuid`)
      parts.push(Prisma.sql`dv."voter_id" IS NOT NULL`)
    }
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
  ): Prisma.VoterSelect {
    return buildVoterSelect(full, electionYear)
  }

  private async rawCountForDistrict(args: {
    state: string
    districtId: string
    filters: FilterData
    electionYear: number
  }): Promise<number> {
    const { state, districtId, electionYear: _electionYear } = args

    const voterFiltersSql = buildVoterFiltersSql(args.filters)
    if (!voterFiltersSql) {
      if (districtId) {
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
          FROM "green"."Voter" v
          WHERE v."State" = CAST(${state}::text AS "public"."USState")`,
      )
      const count = rows[0]?.voter_count ?? 0n
      return Number(count)
    }
    if (districtId) {
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
    const rows = await this.client.$queryRaw<{ voter_count: bigint }[]>(
      Prisma.sql`SELECT COUNT(*)::bigint AS voter_count
        FROM "green"."Voter" v
        WHERE v."State" = CAST(${state}::text AS "public"."USState")
          AND ${voterFiltersSql}`,
    )
    const count = rows[0]?.voter_count ?? 0n
    return Number(count)
  }

  private temporaryBuildWhereSql(options: {
    state: string
    districtId?: string | undefined
  }): Prisma.VoterWhereInput {
    const { state, districtId } = options
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
    return where
  }
}
