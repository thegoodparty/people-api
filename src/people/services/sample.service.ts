import { Injectable } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { samplePeopleSchema } from '../people.schema'
import { DemographicFilter } from '../people.filters'
import { buildVoterSelect } from '../people.select'
import { DistrictService } from 'src/district/services/district.service'
import { z } from 'zod'

@Injectable()
export class SampleService extends createPrismaBase(MODELS.Voter) {
  constructor(private readonly districtService: DistrictService) {
    super()
  }

  async samplePeople(
    dto: z.output<typeof samplePeopleSchema>,
  ): Promise<Prisma.$VoterPayload[]> {
    const {
      state,
      districtType,
      districtName,
      electionYear,
      size = 500,
      full = true,
      hasCellPhone: _hasCellPhone,
      excludeIds = [],
    } = dto

    const districtId = await this.districtService.findDistrictId({
      state,
      type: districtType,
      name: districtName,
    })

    const whereClause = this.buildSampleWhereSql(
      state,
      districtId,
      _hasCellPhone,
      excludeIds,
    )

    const voterSelect = buildVoterSelect(full, electionYear, {})
    // TODO: implement once the filters are done

    return await this.client.$transaction(
      async (tx) => {
        await tx.$executeRawUnsafe(`
        SET LOCAL plan_cache_mode = force_custom_plan;
      `)

        return tx.$queryRaw`
        SELECT v.*
        FROM green."DistrictVoter" dv
        JOIN green."Voter" V
          ON v.id = dv.voter_id
        ${whereClause}
        ORDER BY hashtextextended(v.id::text, 0)
      LIMIT ${size}`
      },
      {
        timeout: 60_000,
      },
    )
  }

  private getSamplingPercents(): number[] {
    return [0.5, 2, 5]
  }

  private buildSampleWhereSql(
    state: string,
    districtId: string,
    hasCellPhone?: boolean,
    excludeIds?: string[],
  ): Prisma.Sql {
    const whereParts: Prisma.Sql[] = [
      Prisma.sql`dv.district_id = ${districtId}::uuid`,
      Prisma.sql`dv."State" = CAST(${state}::text AS public."USState")`,
      Prisma.sql`v."State" = CAST(${state}::text AS public."USState")`,
    ]
    if (hasCellPhone === true) {
      whereParts.push(
        Prisma.sql`v."VoterTelephones_CellPhoneFormatted" IS NOT NULL`,
      )
    } else if (hasCellPhone === false) {
      whereParts.push(
        Prisma.sql`v."VoterTelephones_CellPhoneFormatted" IS NULL`,
      )
    }
    if (excludeIds && excludeIds.length > 0) {
      // Do not change to `NOT IN (...)`
      // This form is more performant when hundreds or thousands of ids
      // Usually this is O(N + M) instead of O(N * M)
      // Helps the query planner do a hash anti-join
      whereParts.push(
        Prisma.sql`NOT EXISTS (
          SELECT 1
          FROM unnest(${excludeIds}::uuid[]) as e(id)
          WHERE e.id = v.id
        )`,
      )
    }
    return Prisma.sql`WHERE ${Prisma.join(whereParts, ' AND ')}`
  }

  private buildVoterSelect(
    full: boolean,
    electionYear: number,
    demographicFilter: DemographicFilter,
  ): Prisma.VoterSelect {
    return buildVoterSelect(full, electionYear, demographicFilter)
  }
  // async collectSampleIds(
  //   target: number,
  //   _percents: number[],
  //   voterWhereSql: Prisma.Sql,
  //   state: string,
  //   districtId?: string,
  // ): Promise<Set<string>> {
  //   const ids = new Set<string>()

  //   const divisors: number[] = [1000, 500, 200, 100, 50, 20, 10, 5, 2, 1]

  //   for (const d of divisors) {
  //     if (ids.size >= target) break
  //     const remaining = target - ids.size
  //     const bucket = Math.floor(Math.random() * d)
  //     const voterHashCondition = Prisma.sql`(abs(pg_catalog.hashtextextended("id"::text, 0)) % ${d}) = ${bucket}`
  //     let rows: Array<{ id: string }> = []
  //     if (districtId) {
  //       rows = await this.client.$queryRaw<Array<{ id: string }>>(Prisma.sql`
  //         SELECT "id"
  //         FROM "green"."Voter"
  //         ${voterWhereSql}
  //         AND EXISTS (
  //           SELECT 1
  //           FROM "green"."DistrictVoter" dv
  //           WHERE dv."voter_id" = "Voter"."id"
  //             AND dv."district_id" = ${Prisma.sql`${districtId}::uuid`}
  //             AND dv."State" = CAST(${state}::text AS public."USState")
  //         )
  //         AND ${voterHashCondition}
  //         LIMIT ${remaining}
  //       `)
  //     } else {
  //       rows = await this.client.$queryRaw<Array<{ id: string }>>(Prisma.sql`
  //         SELECT "id"
  //         FROM "green"."Voter"
  //         ${voterWhereSql}
  //         AND ${voterHashCondition}
  //         LIMIT ${remaining}
  //       `)
  //     }
  //     for (const row of rows) {
  //       if (ids.size >= target) break
  //       ids.add(row.id)
  //     }
  //   }

  //   return ids
  // }

  // async collectRandomIds(
  //   remaining: number,
  //   state: string,
  //   districtId: string | undefined,
  //   hasCellPhone: boolean | undefined,
  //   excludeIds: string[],
  // ): Promise<string[]> {
  //   const picked = new Set<string>()
  //   let percent = 0.1
  //   let attempt = 0
  //   const maxPercent = 20
  //   while (picked.size < remaining && percent <= maxPercent) {
  //     const exclude = excludeIds.concat(Array.from(picked))
  //     const whereWithExclusion = this.buildSampleWhereSql(
  //       state,
  //       districtId,
  //       hasCellPhone,
  //       exclude,
  //     )
  //     const seed = Math.floor(Date.now() + attempt * 9973)
  //     const rows = await this.client.$queryRaw<Array<{ id: string }>>(
  //       Prisma.sql`
  //         SELECT "id"
  //         FROM "green"."Voter" TABLESAMPLE SYSTEM (${percent}) REPEATABLE (${seed})
  //         ${whereWithExclusion}
  //         LIMIT ${remaining - picked.size}
  //       `,
  //     )
  //     for (const r of rows) {
  //       if (picked.size >= remaining) break
  //       picked.add(r.id)
  //     }
  //     if (picked.size < remaining) {
  //       percent = percent * 2
  //       attempt += 1
  //     }
  //   }
  //   return Array.from(picked)
  // }
}
