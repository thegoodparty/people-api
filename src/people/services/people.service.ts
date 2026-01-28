import { $Enums, Prisma } from '@prisma/client'
import {
  DownloadPeopleDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
} from '../people.schema'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SampleService } from './sample.service'

import { Injectable, NotFoundException } from '@nestjs/common'
import { buildVoterFiltersSql } from '../utils/filters.sql.utils'
import { FastifyReply } from 'fastify'
import { format } from '@fast-csv/format'
import type { RowMap } from '@fast-csv/format'
import { DistrictService } from 'src/district/services/district.service'
import {
  transformToPersonOutputArray,
  transformToPersonOutput,
} from '../utils/transformToPersonOutput.utils'
import { FilterData } from '../schemas/filters.schema'
import { StatsService } from './stats.service'
import {
  buildVoterSelectSql,
  BaseDbPerson,
  ExtraSelectedField,
} from '../people.select'

export const DATABASE_SCHEMA = 'green'

const VOTER_TABLENAME = 'Voter'
const DISTRICTVOTER_TABLENAME = 'DistrictVoter'

const getNormalizedPhoneNumber = (phone: string): string | null => {
  if (!/^\d+$/.test(phone)) {
    return null
  }

  if (![11, 10].includes(phone.length)) {
    return null
  }

  const digits =
    phone.length === 11 && phone.startsWith('1') ? phone.slice(1) : phone

  const area = digits.slice(0, 3)
  const prefix = digits.slice(3, 6)
  const line = digits.slice(6)
  return `(${area}) ${prefix}-${line}`
}

@Injectable()
export class PeopleService extends createPrismaBase(MODELS.Voter) {
  constructor(
    private readonly sampleService: SampleService,
    private readonly districtService: DistrictService,
    private readonly statsService: StatsService,
  ) {
    super()
  }

  async findPeople({
    state,
    districtType = '',
    districtName = '',
    resultsPerPage,
    page,
    filters,
    search,
  }: ListPeopleDTO) {
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

    const [totalResults, people] = await Promise.all([
      this.rawCountForDistrict({
        state,
        districtId: resolvedDistrictId,
        filters,
        search,
      }),
      this.client.$queryRaw<Array<BaseDbPerson>>(
        this.buildRawPeopleQuery({
          districtId: resolvedDistrictId,
          whereClause: this.rawBuildWhere({
            state,
            districtId: resolvedDistrictId,
            filters,
            search,
          }),
          take: resultsPerPage,
          skip: (page - 1) * resultsPerPage,
        }),
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
      people: transformToPersonOutputArray(people),
    }
  }

  async streamPeopleCsv(dto: DownloadPeopleDTO, res: FastifyReply) {
    const { state, filters, districtType, districtName } = dto

    let resolvedDistrictId: string | null = null
    if (districtType && districtName) {
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
    const whereClause = this.rawBuildWhere({
      districtId: resolvedDistrictId,
      state,
      filters,
    })

    const extraFields: ExtraSelectedField[] = [
      'AnyElection_2017',
      'AnyElection_2019',
      'AnyElection_2021',
      'AnyElection_2023',
      'AnyElection_2025',
      'General_2016',
      'General_2018',
      'General_2020',
      'General_2022',
      'General_2024',
      'General_2026',
      'OtherElection_2016',
      'OtherElection_2018',
      'OtherElection_2020',
      'OtherElection_2022',
      'OtherElection_2024',
      'OtherElection_2026',
      'PresidentialPrimary_2016',
      'PresidentialPrimary_2020',
      'PresidentialPrimary_2024',
      'Primary_2016',
      'Primary_2018',
      'Primary_2020',
      'Primary_2022',
      'Primary_2024',
      'Primary_2026',
    ]

    const { columnNames } = buildVoterSelectSql(extraFields)

    type ExportRow = RowMap<string | number | null | undefined>
    const csvStream = format<ExportRow, ExportRow>({
      headers: [...columnNames, 'electionLocation', 'electionType'],
    })
    csvStream.pipe(res.raw)

    const pageSize = 5000
    let lastId: string | undefined
    let aborted = false

    const onClose = () => {
      aborted = true
    }
    res.raw.on('close', onClose)

    try {
      for (;;) {
        if (aborted) break
        const page = await this.client.$queryRaw<
          Array<Record<string, unknown>>
        >(
          this.buildRawPeopleQuery({
            districtId: resolvedDistrictId,
            whereClause,
            take: pageSize,
            skip: 0,
            afterId: lastId,
            extraFields,
          }),
        )
        if (!page.length) break

        type CsvValue = string | number | null | undefined
        for (const person of page) {
          if (aborted) break
          const row: ExportRow = {}
          for (const key of columnNames) {
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

        lastId = page[page.length - 1].id as string
        if (page.length < pageSize) break
      }
    } finally {
      res.raw.off('close', onClose)
      csvStream.end()
    }
  }

  async samplePeople(dto: SamplePeopleDTO) {
    return this.sampleService
      .samplePeople(dto)
      .then(transformToPersonOutputArray)
  }

  private rawBuildWhere(args: {
    state: string
    districtId?: string | null
    filters: FilterData
    search?: string
  }): Prisma.Sql {
    const { state, districtId } = args

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
    const search = args.search?.trim()
    if (search) {
      const phone = getNormalizedPhoneNumber(search)
      if (phone) {
        parts.push(
          Prisma.sql`(v."VoterTelephones_CellPhoneFormatted" = ${phone} OR v."VoterTelephones_LandlineFormatted" = ${phone})`,
        )
      } else {
        const tokens = search.split(/\s+/).filter(Boolean)
        if (tokens.length === 1) {
          parts.push(
            Prisma.sql`(v."FirstName" = ${tokens[0]} OR v."LastName" = ${tokens[0]})`,
          )
        } else if (tokens.length >= 2) {
          parts.push(
            Prisma.sql`(v."FirstName" = ${tokens[0]} AND v."LastName" = ${tokens[1]})`,
          )
        }
      }
    }
    const voterFiltersSql = buildVoterFiltersSql(args.filters)
    if (voterFiltersSql) {
      parts.push(voterFiltersSql)
    }
    return parts.length
      ? Prisma.sql`WHERE ${Prisma.join(parts, ' AND ')}`
      : Prisma.empty
  }

  private async rawCountForDistrict(args: {
    state: string
    districtId: string | null
    filters: FilterData
    search?: string
  }): Promise<number> {
    const { state, districtId, search } = args

    if (districtId && !args.search && Object.keys(args.filters).length === 0) {
      const { totalConstituents } =
        await this.statsService.getTotalCounts(districtId)
      return totalConstituents
    }

    const whereClause = this.rawBuildWhere({
      state,
      districtId,
      search,
      filters: args.filters,
    })

    if (districtId) {
      const rows = await this.client.$queryRaw<{ voter_count: bigint }[]>(
        Prisma.sql`SELECT COUNT(*)::bigint AS voter_count
          FROM "green"."DistrictVoter" dv
          JOIN "green"."Voter" v
            ON v."State" = dv."State"
           AND v."id"    = dv."voter_id"
          ${whereClause}`,
      )
      const count = rows[0]?.voter_count ?? 0n
      return Number(count)
    }
    const rows = await this.client.$queryRaw<{ voter_count: bigint }[]>(
      Prisma.sql`SELECT COUNT(*)::bigint AS voter_count
        FROM "green"."Voter" v
        ${whereClause}`,
    )
    const count = rows[0]?.voter_count ?? 0n
    return Number(count)
  }

  transformToPersonOutput(person: Record<string, unknown>) {
    return transformToPersonOutput(person)
  }

  private buildRawPeopleQuery(args: {
    districtId: string | null
    whereClause: Prisma.Sql
    take: number
    skip: number
    afterId?: string
    extraFields?: ExtraSelectedField[]
  }): Prisma.Sql {
    const { districtId, whereClause, take, skip, afterId } = args

    const selectSql = buildVoterSelectSql(args.extraFields)
    const voterTable = Prisma.raw(`"${DATABASE_SCHEMA}"."${VOTER_TABLENAME}"`)
    const dvTable = Prisma.raw(
      `"${DATABASE_SCHEMA}"."${DISTRICTVOTER_TABLENAME}"`,
    )
    const joinClause = districtId
      ? Prisma.sql`JOIN ${dvTable} dv
            ON v."State" = dv."State" AND v."id" = dv."voter_id"`
      : Prisma.empty
    const cursorClause = afterId
      ? Prisma.sql` AND v."id" > ${afterId}::uuid`
      : Prisma.empty
    const offsetClause = afterId ? Prisma.empty : Prisma.sql` OFFSET ${skip}`

    return Prisma.sql`${selectSql.sql}
          FROM ${voterTable} v
          ${joinClause}
          ${whereClause}${cursorClause}
          ORDER BY v."id"
          LIMIT ${take}${offsetClause}`
  }
}
