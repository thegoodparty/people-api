import { Injectable } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { samplePeopleSchema } from '../people.schema'
import { buildVoterSelect, buildVoterSelectSql } from '../people.select'
import { DistrictService } from 'src/district/services/district.service'
import { z } from 'zod'

@Injectable()
export class SampleService extends createPrismaBase(MODELS.Voter) {
  // DEFAULTS
  // p = 0.60
  // s = 3
  // K = 3
  // m = dedupe(excludeIds).length
  // E = floor(N * p)
  // m_eff = min(m, E) (district-scoped assumption)
  // A = E - m_eff

  private static readonly PHONE_PERCENT = 0.6
  private static readonly OVERSAMPLE_FACTOR = 3
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

    const voterSelect = buildVoterSelectSql(full, electionYear, 'v')
    // TODO: implement once the filters are done

    return await this.client.$transaction(
      async (tx) => {
        await tx.$executeRawUnsafe(`
        SET LOCAL plan_cache_mode = force_custom_plan;
      `)

        return tx.$queryRaw`
        ${voterSelect}
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
  ): Prisma.VoterSelect {
    // TODO: You decide @Stephen what columns we should return here,
    // we might need a special case to return all since we don't filter sampling based on demographic filters
    return buildVoterSelect(full, electionYear, {})
  }
}
