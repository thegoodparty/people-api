import { BadRequestException, Injectable } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { samplePeopleSchema, STATE_DISTRICT_TYPE } from '../people.schema'
import { BaseDbPerson, buildVoterSelectSql } from '../people.select'
import { DistrictService } from 'src/district/services/district.service'
import { z } from 'zod'
import { StatsService } from './stats.service'
import { hash32 } from 'src/shared/util/hash.util'
import { resolveDistrict } from '../utils/resolveDistrict.utils'

type SampleQueryMode =
  | {
      kind: 'stateOnly'
      state: string
      hasCellPhone: boolean | undefined
      districtId: string
    }
  | {
      kind: 'district'
      state: string
      districtId: string
    }

interface SampleQueryFragments {
  sourceFromClause: Prisma.Sql
  candidateIdReference: Prisma.Sql
  excludeIdReference: Prisma.Sql
  innerWhereClause: Prisma.Sql
}

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
    hasCellPhone: boolean,
  ) {
    const { totalConstituentsWithCellPhone, totalConstituents } =
      await this.statsService.getTotalCounts(districtId)
    const effectiveExcludeCount = Math.min(
      excludeIdsSize,
      totalConstituentsWithCellPhone,
    )

    const remainingConstituentCount = hasCellPhone
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
  ): Promise<BaseDbPerson[]> {
    const resolved = await resolveDistrict(this.districtService, dto)
    const { state, districtId: resolvedDistrictId, useVoterOnlyPath } = resolved
    const size = dto.size ?? 500
    const hasCellPhone = dto.hasCellPhone ?? true
    const excludeIds = dto.excludeIds ?? []

    const seed = hash32(`${resolvedDistrictId ?? state}:${Date.now() / 60_000}`)

    const outerWhereClause = this.buildOuterWhereSql(state, hasCellPhone)
    const { sql: voterSelect } = buildVoterSelectSql()

    const mode: SampleQueryMode = useVoterOnlyPath
      ? {
          kind: 'stateOnly',
          state,
          hasCellPhone,
          districtId:
            resolvedDistrictId ??
            (await this.districtService.findDistrictId({
              state,
              type: STATE_DISTRICT_TYPE,
              name: state,
            })),
        }
      : {
          kind: 'district',
          state,
          districtId: resolvedDistrictId!,
        }
    const { districtId } = mode

    const { hashDivisor, prelimit } = await this.computeHashDivisorAndPrelimit(
      districtId,
      excludeIds.length,
      size,
      hasCellPhone,
    )
    const queryFragments = this.buildSampleQueryFragments(mode)
    const { excludeCte, excludeJoin, excludeWhere } = this.buildAntiJoin(
      excludeIds,
      queryFragments.excludeIdReference,
    )
    const result = await this.runSampleQuery({
      mode,
      queryFragments,
      seed,
      hashDivisor,
      outerWhereClause,
      excludeCte,
      excludeJoin,
      excludeWhere,
      prelimit,
      voterSelect,
      size,
    })
    if (result.length < size) {
      const { kind, state: modeState, districtId: modeDistrictId } = mode
      this.logger.warn(
        kind === 'district'
          ? `Sampling retry activated for district: ${modeDistrictId}`
          : `Sampling retry activated for state: ${modeState}`,
      )
      const retrySeed = (seed + 1) >>> 0
      return this.runSampleQuery({
        mode,
        queryFragments,
        seed: retrySeed,
        hashDivisor,
        outerWhereClause,
        excludeCte,
        excludeJoin,
        excludeWhere,
        prelimit,
        voterSelect,
        size,
      })
    }
    return result
  }

  private async runSampleQuery(args: {
    mode: SampleQueryMode
    queryFragments: SampleQueryFragments
    seed: number
    hashDivisor: number
    outerWhereClause: Prisma.Sql
    excludeCte: Prisma.Sql
    excludeJoin: Prisma.Sql
    excludeWhere: Prisma.Sql
    prelimit: number
    voterSelect: Prisma.Sql
    size: number
  }): Promise<BaseDbPerson[]> {
    const {
      mode,
      queryFragments,
      seed,
      hashDivisor,
      outerWhereClause,
      excludeCte,
      excludeJoin,
      excludeWhere,
      prelimit,
      voterSelect,
      size,
    } = args
    const { kind, districtId } = mode
    const hashBuckets = this.makeHashBuckets(hashDivisor, seed)
    if (kind === 'district') {
      this.logger.debug(`
      Querying for sample buckets.
      districtId: ${districtId}
      hashBuckets: ${hashBuckets.toString()}
      hashDivisor: ${hashDivisor}
      seed: ${seed}
      `)
    }
    const rows = (await this.client.$transaction(
      async (tx) => {
        await tx.$executeRawUnsafe(`
        SET LOCAL plan_cache_mode = force_custom_plan;
      `)
        return tx.$queryRaw`
      WITH ${excludeCte} candidate_ids AS (
        SELECT ${queryFragments.candidateIdReference} AS id
        ${queryFragments.sourceFromClause}
          ${excludeJoin}
          ${queryFragments.innerWhereClause}
      
          -- PRE CUT - Divides all of the voterIds into buckets
          -- Number of buckets is our hashDivisor
          -- A row only passes this filter if it's bucket is in hashBuckets
          -- Ex: hashDivisor = 2000, bucketCount - 3, we select 3/2000 = ~0.15%
          AND (
            abs(hashtextextended(${queryFragments.candidateIdReference}::text, ${seed})) % ${hashDivisor}
          ) = ANY(${hashBuckets}::int[])
      
          -- cheap hash anti-join (exclude ids)
          ${excludeWhere}
      
        LIMIT ${prelimit}
      )
      ${voterSelect}
      FROM candidate_ids c
      JOIN green."Voter" v
        ON v.id = c.id
      ${outerWhereClause}
      LIMIT ${size};
      `
      },
      {
        timeout: 60_000,
      },
    )) as BaseDbPerson[]
    return rows
  }

  private buildSampleQueryFragments(
    mode: SampleQueryMode,
  ): SampleQueryFragments {
    const { kind } = mode
    if (kind === 'stateOnly') {
      return {
        sourceFromClause: Prisma.sql`FROM green."Voter" v`,
        candidateIdReference: Prisma.sql`v.id`,
        excludeIdReference: Prisma.sql`v.id`,
        innerWhereClause: this.buildInnerWhereSql(mode),
      }
    }
    return {
      sourceFromClause: Prisma.sql`FROM green."DistrictVoter" dv`,
      candidateIdReference: Prisma.sql`dv.voter_id`,
      excludeIdReference: Prisma.sql`dv.voter_id`,
      innerWhereClause: this.buildInnerWhereSql(mode),
    }
  }

  private makeHashBuckets(hashDivisor: number, seed32: number): number[] {
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

  private buildAntiJoin(
    excludeIds: string[],
    idReference: Prisma.Sql,
  ): {
    excludeCte: Prisma.Sql
    excludeJoin: Prisma.Sql
    excludeWhere: Prisma.Sql
  } {
    if (excludeIds.length == 0) {
      return {
        excludeCte: Prisma.empty,
        excludeJoin: Prisma.empty,
        excludeWhere: Prisma.empty,
      }
    }

    const excludeArray = Prisma.sql`ARRAY[${Prisma.join(excludeIds)}]::uuid[]`

    return {
      excludeCte: Prisma.sql`exclude AS (SELECT unnest(${excludeArray}) AS id),`,
      excludeJoin: Prisma.sql`LEFT JOIN exclude e ON e.id = ${idReference}`,
      excludeWhere: Prisma.sql`AND e.id IS NULL`,
    }
  }

  private buildOuterWhereSql(
    state: string,
    hasCellPhone?: boolean,
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

  private buildInnerWhereSql(mode: SampleQueryMode): Prisma.Sql {
    const { kind, state } = mode
    const whereParts: Prisma.Sql[] = []
    if (kind === 'stateOnly') {
      const { hasCellPhone } = mode
      whereParts.push(
        Prisma.sql`v."State" = CAST(${state}::text AS public."USState")`,
      )
      if (hasCellPhone === true) {
        whereParts.push(
          Prisma.sql`v."VoterTelephones_CellPhoneFormatted" IS NOT NULL`,
        )
      } else if (hasCellPhone === false) {
        whereParts.push(
          Prisma.sql`v."VoterTelephones_CellPhoneFormatted" IS NULL`,
        )
      }
    } else if (mode.districtId && state) {
      const { districtId } = mode
      whereParts.push(Prisma.sql`dv.district_id = ${districtId}::uuid`)
      whereParts.push(
        Prisma.sql`dv."State" = CAST(${state}::text AS public."USState")`,
      )
    } else if (state) {
      whereParts.push(
        Prisma.sql`dv."State" = CAST(${state}::text AS public."USState")`,
      )
    }
    return whereParts.length > 0
      ? Prisma.sql`WHERE ${Prisma.join(whereParts, ' AND ')}`
      : Prisma.sql`WHERE TRUE`
  }
}
