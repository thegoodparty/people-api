import { BadRequestException, Injectable } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { samplePeopleSchema } from '../people.schema'
import { buildVoterSelect, buildVoterSelectSql } from '../people.select'
import { DistrictService } from 'src/district/services/district.service'
import { z } from 'zod'
import { StatsService } from './stats.service'
import { hash32 } from 'src/shared/util/hash.util'


// The comments in this class are not LLM generated, do not remove
// They are human-written
@Injectable()
export class SampleService extends createPrismaBase(MODELS.Voter) {
  constructor(
    private readonly districtService: DistrictService,
    private readonly statsService: StatsService,
  ) {
    super()
  }
  private static readonly OVERSAMPLE_FACTOR = 3
  private static readonly BUCKET_COUNT = 3
  private static readonly MAX_HASH_DIVISOR = 10000
  private static readonly MIN_HASH_DIVISOR = 1
  private static readonly MIN_POPULATION_MULTIPLIER = 1.5
  private static readonly PRELIMIT_MULTIPLIER = 2
  private static readonly MAX_PRELIMIT = 20000

  private async computeHashDivisorAndPrelimit(
    districtId: string,
    excludeIdsSize: number,
    targetSampleSize: number,
    hasCellPhone: boolean
  ) {
    const { totalConstituentsWithCellPhone, totalConstituents } =
      await this.statsService.getTotalCounts(districtId)
    const effectiveExcludeCount = Math.min(
      excludeIdsSize,
      totalConstituentsWithCellPhone,
    )

    const remainingConstituentCount =
      hasCellPhone 
      ? totalConstituentsWithCellPhone - effectiveExcludeCount
      : totalConstituents - effectiveExcludeCount

    if (remainingConstituentCount < targetSampleSize) {
      throw new BadRequestException(
        `Not enough non-excluded constituents ${remainingConstituentCount} to satisfy target: ${targetSampleSize}`,
      )
    }

    const desiredRows = targetSampleSize * SampleService.OVERSAMPLE_FACTOR
    const dontBucketCutoff =
      desiredRows * SampleService.MIN_POPULATION_MULTIPLIER

    const hashDivisor = Math.floor(
      (remainingConstituentCount * SampleService.BUCKET_COUNT) / desiredRows,
    )

    const prelimit = Math.min(
      SampleService.MAX_PRELIMIT,
      desiredRows * SampleService.PRELIMIT_MULTIPLIER,
    )

    // TODO: Test this branch and behavior
    if (remainingConstituentCount <= dontBucketCutoff)
      return { hashDivisor: SampleService.MIN_HASH_DIVISOR, prelimit }

    return {
      hashDivisor: Math.min(
        Math.max(hashDivisor, SampleService.MIN_HASH_DIVISOR),
        SampleService.MAX_HASH_DIVISOR,
      ),
      prelimit,
    }
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
      hasCellPhone = true,
      excludeIds = [],
    } = dto
    // TODO: Need at least one retry fallback in this method

    const districtId = await this.districtService.findDistrictId({
      state,
      type: districtType,
      name: districtName,
    })

    const seed = hash32(`${districtId}:${(Date.now() / 60_000)}`) // Rotates every minute

    const whereClause = this.buildSampleWhereSql(
      state,
      districtId,
      hasCellPhone,
      excludeIds,
    )
    const { hashDivisor, prelimit } = await this.computeHashDivisorAndPrelimit(
      districtId,
      excludeIds.length,
      size,
      hasCellPhone,
    )

    const voterSelect = buildVoterSelectSql(full, electionYear, 'v')
    // TODO: implement once the filters are done

    const antiJoin = this.buildAntiJoin(excludeIds)
    const hashBuckets = this.makeHashBuckets(hashDivisor, seed)

    this.logger.debug(`
      Querying for sample buckets.
      districtId: ${districtId}
      hashBuckets: ${hashBuckets.toString()}
      hashDivisor: ${hashDivisor}
      seed: ${seed}
      `)

    return await this.client.$transaction(
      async (tx) => {
        await tx.$executeRawUnsafe(`
        SET LOCAL plan_cache_mode = force_custom_plan;
      `)
          // TODO: Await this or no?
        return tx.$queryRaw`
      WITH candidate_ids AS (
        SELECT dv.voter_id AS id
        FROM green."DistrictVoter" dv
        WHERE dv.district_id = ${districtId}::uuid
          AND dv."State" = CAST(${state}::text AS public."USState")
      
          -- PRE CUT - Divides all of the voterIds into buckets
          -- Number of buckets is our hashDivisor
          -- A row only passes this filter if it's bucket is in hashBuckets
          -- Ex: hashDivisor = 2000, bucketCount - 3, we select 3/2000 = ~0.15%
          AND (
            abs(hashtextextended(dv.voter_id::text, ${seed})) % ${hashDivisor}
          ) = ANY(${hashBuckets}::int[])
      
          -- cheap hash anti-join (exclude ids)
          ${antiJoin}
      
        LIMIT ${prelimit}
      )
      ${voterSelect}
      FROM candidate_ids c
      JOIN green."Voter" v
        ON v.id = c.id
      ${whereClause}
      LIMIT ${size};
      `
      },
      {
        timeout: 60_000,
      },
    )
  }

  private makeHashBuckets(
    hashDivisor: number,
    seed32: number,
  ): number[] {
    if (hashDivisor <= 1) return [0] // ANY([0]) works and effectively disables bucketing

    // Pick a starting bucket index in the valid range [0, hashDivisor-1]
    // 'seed32 % hashDivisor' maps the seed to a valid bucket index
    // '+ hashDivisor then % hashDivisor' is the standard trick to handle negative seeds safely
    const base = ((seed32 % hashDivisor) + hashDivisor) % hashDivisor

    // Take bucketCount consecutive buckets, wrapping around with mod
    const buckets: number[] = []
    for (let i = 0; i < SampleService.BUCKET_COUNT; ++i) {
      buckets.push((base + i) % hashDivisor)
    }

    return buckets
  }

  private buildAntiJoin(excludeIds: string[]): Prisma.Sql {
    if (excludeIds.length == 0) return Prisma.sql``

    return Prisma.sql`
    LEFT JOIN (
      SELECT unnest($excludeIds::uuid[]) AS id
    ) e ON e.id = dv.voter_id
    WHERE e.id IS NULL
    `
  }

  private buildSampleWhereSql(
    state: string,
    districtId: string,
    hasCellPhone?: boolean,
    excludeIds?: string[],
  ): Prisma.Sql {
    const whereParts: Prisma.Sql[] = [
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
