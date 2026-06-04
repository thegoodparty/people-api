import { Prisma } from '../../generated/prisma'
import {
  GetPersonQueryDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
} from '../people.schema'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SampleService } from './sample.service'

import { Injectable, NotFoundException } from '@nestjs/common'
import { DistrictService } from 'src/district/services/district.service'
import { transformToPersonOutput } from '../utils/transformToPersonOutput.utils'
import { FilterData } from '../schemas/filters.schema'
import { StatsService } from './stats.service'
import {
  buildVoterSelectSql,
  BaseDbPerson,
  ExtraSelectedField,
} from '../people.select'
import { resolveDistrict } from '../utils/resolveDistrict.utils'
import { buildVoterWhereSql } from '../utils/buildVoterWhereSql.utils'

export const DATABASE_SCHEMA = 'green'

const VOTER_TABLENAME = 'Voter'
const DISTRICTVOTER_TABLENAME = 'DistrictVoter'

@Injectable()
export class PeopleService extends createPrismaBase(MODELS.Voter) {
  constructor(
    private readonly sampleService: SampleService,
    private readonly districtService: DistrictService,
    private readonly statsService: StatsService,
  ) {
    super()
  }

  async findPerson(id: string, query: GetPersonQueryDTO) {
    const resolved = await resolveDistrict(this.districtService, query)
    const { districtId, state, useVoterOnlyPath } = resolved
    const select = buildVoterSelectSql().sql
    const districtExistsClause = !useVoterOnlyPath
      ? Prisma.sql`AND EXISTS (
            SELECT 1
            FROM green."DistrictVoter" dv
            JOIN green."District" d ON d."id" = dv."district_id"
            WHERE dv."voter_id" = v."id"
              AND d."id" = ${districtId}::uuid
          )`
      : Prisma.empty

    const result = await this.client.$queryRaw<BaseDbPerson[]>(
      Prisma.sql`${select} FROM "green"."Voter" v WHERE v."id" = ${id}::uuid AND v."State" = CAST(${state}::text AS "public"."USState") ${districtExistsClause}`,
    )
    if (!result.length) {
      if (!useVoterOnlyPath) {
        throw new NotFoundException('Person not found in district')
      }
      throw new NotFoundException(`Person with ID ${id} not found`)
    }
    return transformToPersonOutput(result[0])
  }

  async findPeople(dto: ListPeopleDTO) {
    const resolved = await resolveDistrict(this.districtService, dto)
    const { state, useVoterOnlyPath, districtId } = resolved
    const { filters, search, resultsPerPage, page } = dto
    const effectiveDistrictId = useVoterOnlyPath ? null : districtId

    // TODO: This executes count and data query in parallel
    // for latency, but the data query uses the requested page offset while
    // currentPage is clamped from totalResults below. If requested page is out
    // of bounds, pagination metadata and returned rows can diverge.
    const [totalResults, people] = await Promise.all([
      this.rawCountForDistrict({
        state,
        districtId: effectiveDistrictId,
        filters,
        search,
      }),
      this.client.$queryRaw<Array<BaseDbPerson>>(
        this.buildRawPeopleQuery({
          districtId: effectiveDistrictId,
          whereClause: buildVoterWhereSql({
            state,
            districtId: effectiveDistrictId,
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
      people: people.map(transformToPersonOutput),
    }
  }

  async samplePeople(dto: SamplePeopleDTO) {
    return this.sampleService
      .samplePeople(dto)
      .then((people) => people.map(transformToPersonOutput))
  }

  private async rawCountForDistrict(args: {
    state: string
    districtId: string | null
    filters: FilterData
    search?: string
  }): Promise<number> {
    const { state, districtId, search } = args

    if (districtId && !args.search && args.filters.filters.length === 0) {
      const { totalConstituents } =
        await this.statsService.getTotalCounts(districtId)
      return totalConstituents
    }

    const whereClause = buildVoterWhereSql({
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

  private buildRawPeopleQuery(args: {
    districtId: string | null
    whereClause: Prisma.Sql
    take: number
    skip: number
    extraFields?: ExtraSelectedField[]
  }): Prisma.Sql {
    const { districtId, whereClause, take, skip } = args

    const selectSql = buildVoterSelectSql(args.extraFields)
    const voterTable = Prisma.raw(`"${DATABASE_SCHEMA}"."${VOTER_TABLENAME}"`)
    const dvTable = Prisma.raw(
      `"${DATABASE_SCHEMA}"."${DISTRICTVOTER_TABLENAME}"`,
    )
    const joinClause = districtId
      ? Prisma.sql`JOIN ${dvTable} dv
            ON v."State" = dv."State" AND v."id" = dv."voter_id"`
      : Prisma.empty

    return Prisma.sql`${selectSql.sql}
          FROM ${voterTable} v
          ${joinClause}
          ${whereClause}
          ORDER BY v."id"
          LIMIT ${take} OFFSET ${skip}`
  }
}
