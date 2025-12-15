import { Injectable, NotFoundException } from '@nestjs/common'
import { Prisma, $Enums } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SamplePeopleDTO } from '../people.schema'
import { DemographicFilter } from '../people.filters'
import { buildVoterSelect } from '../people.select'
import { DistrictService } from 'src/district/services/district.service'

@Injectable()
export class SampleService extends createPrismaBase(MODELS.Voter) {
  constructor(private readonly districtService: DistrictService) {
    super()
  }
  async samplePeople(dto: SamplePeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      electionYear,
      size = 500,
      full = true,
      hasCellPhone,
      excludeIds = [],
    } = dto

    this.validateDistrictType(districtType as string | undefined)

    const select = this.buildVoterSelect(
      full,
      electionYear ?? new Date().getFullYear(),
      {} as DemographicFilter,
    )

    const percents = this.getSamplingPercents()
    const hasDistrictParams = Boolean(state && districtType && districtName)
    const resolvedDistrict = hasDistrictParams
      ? await this.districtService.findFirst({
          where: {
            type: districtType as string,
            name: districtName,
            state: state as $Enums.DistrictUSState,
          },
          select: { id: true },
        })
      : undefined
    if (hasDistrictParams && !resolvedDistrict?.id) {
      throw new NotFoundException(
        `District not found for state=${state} type=${districtType as string} name=${districtName}`,
      )
    }
    const resolvedDistrictId = resolvedDistrict?.id
    const voterWhereSql = this.buildVoterOnlyWhereSql(
      state,
      hasCellPhone,
      excludeIds,
    )

    const ids = await this.collectSampleIds(
      size,
      percents,
      voterWhereSql,
      state,
      resolvedDistrictId,
    )

    if (ids.size < size) {
      const remaining = size - ids.size
      const extraIds = await this.collectRandomIds(
        remaining,
        state,
        resolvedDistrictId,
        hasCellPhone,
        Array.from(ids),
      )
      for (const id of extraIds) {
        if (ids.size >= size) break
        ids.add(id)
      }
    }

    if (ids.size === 0) return []

    return this.model.findMany({
      where: { id: { in: Array.from(ids) } },
      select,
    })
  }

  private getSamplingPercents(): number[] {
    return [0.5, 2, 5]
  }

  private buildSampleWhereSql(
    state: string,
    districtId?: string,
    hasCellPhone?: boolean,
    excludeIds?: string[],
  ): Prisma.Sql {
    const whereParts: Prisma.Sql[] = [
      Prisma.sql`"State" = CAST(${state}::text AS public."USState")`,
    ]
    if (districtId) {
      whereParts.push(
        Prisma.sql`EXISTS (
          SELECT 1
          FROM "DistrictVoter" dv
          WHERE dv."voter_id" = "Voter"."id"
            AND dv."district_id" = ${Prisma.sql`${districtId}::uuid`}
            AND dv."State" = CAST(${state}::text AS public."USState")
        )`,
      )
    }
    if (hasCellPhone === true) {
      whereParts.push(
        Prisma.sql`"VoterTelephones_CellPhoneFormatted" IS NOT NULL`,
      )
    } else if (hasCellPhone === false) {
      whereParts.push(Prisma.sql`"VoterTelephones_CellPhoneFormatted" IS NULL`)
    }
    if (excludeIds && excludeIds.length > 0) {
      whereParts.push(
        Prisma.sql`"id" NOT IN (${Prisma.join(
          excludeIds.map((id) => Prisma.sql`${id}::uuid`),
        )})`,
      )
    }
    return Prisma.sql`WHERE ${Prisma.join(whereParts, ' AND ')}`
  }

  private buildVoterOnlyWhereSql(
    state: string,
    hasCellPhone?: boolean,
    excludeIds?: string[],
  ): Prisma.Sql {
    const whereParts: Prisma.Sql[] = [
      Prisma.sql`"State" = CAST(${state}::text AS public."USState")`,
    ]
    if (hasCellPhone === true) {
      whereParts.push(
        Prisma.sql`"VoterTelephones_CellPhoneFormatted" IS NOT NULL`,
      )
    } else if (hasCellPhone === false) {
      whereParts.push(Prisma.sql`"VoterTelephones_CellPhoneFormatted" IS NULL`)
    }
    if (excludeIds && excludeIds.length > 0) {
      whereParts.push(
        Prisma.sql`"id" NOT IN (${Prisma.join(
          excludeIds.map((id) => Prisma.sql`${id}::uuid`),
        )})`,
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
  async collectSampleIds(
    target: number,
    _percents: number[],
    voterWhereSql: Prisma.Sql,
    state: string,
    districtId?: string,
  ): Promise<Set<string>> {
    const ids = new Set<string>()

    const divisors: number[] = [1000, 500, 200, 100, 50, 20, 10, 5, 2, 1]

    for (const d of divisors) {
      if (ids.size >= target) break
      const remaining = target - ids.size
      const bucket = Math.floor(Math.random() * d)
      const condition = Prisma.sql`(abs(pg_catalog.hashtextextended("id"::text, 0)) % ${d}) = ${bucket}`
      if (!districtId) throw new Error('No districtId in collectSampleIds')
      const rows = districtId
        ? await this.client.$queryRaw<Array<{ id: string }>>(Prisma.sql`
            SELECT "id"
            FROM "Voter"
            ${voterWhereSql}
            AND EXISTS (
              SELECT 1
              FROM "DistrictVoter" dv
              WHERE dv."voter_id" = "Voter"."id"
                AND dv."district_id" = ${Prisma.sql`${districtId}::uuid`}
                AND dv."State" = CAST(${state}::text AS public."USState")
            )
            AND ${condition}
            LIMIT ${remaining}
          `)
        : await this.client.$queryRaw<Array<{ id: string }>>(Prisma.sql`
            SELECT "id"
            FROM "Voter"
            ${voterWhereSql}
            AND ${condition}
            LIMIT ${remaining}
          `)
      for (const row of rows) {
        if (ids.size >= target) break
        ids.add(row.id)
      }
    }

    return ids
  }

  async collectRandomIds(
    remaining: number,
    state: string,
    districtId: string | undefined,
    hasCellPhone: boolean | undefined,
    excludeIds: string[],
  ): Promise<string[]> {
    const picked = new Set<string>()
    let percent = 0.1
    let attempt = 0
    const maxPercent = 20
    while (picked.size < remaining && percent <= maxPercent) {
      const exclude = excludeIds.concat(Array.from(picked))
      const whereWithExclusion = this.buildSampleWhereSql(
        state,
        districtId,
        hasCellPhone,
        exclude,
      )
      const seed = Math.floor(Date.now() + attempt * 9973)
      const rows = await this.client.$queryRaw<Array<{ id: string }>>(
        Prisma.sql`
          SELECT "id"
          FROM "Voter" TABLESAMPLE SYSTEM (${percent}) REPEATABLE (${seed})
          ${whereWithExclusion}
          LIMIT ${remaining - picked.size}
        `,
      )
      for (const r of rows) {
        if (picked.size >= remaining) break
        picked.add(r.id)
      }
      if (picked.size < remaining) {
        percent = percent * 2
        attempt += 1
      }
    }
    return Array.from(picked)
  }
}
