import { Injectable, BadRequestException } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SamplePeopleDTO } from '../people.schema'
import { PerformanceFieldKey } from '../people.types'
import { DemographicFilter } from '../people.filters'
import { buildVoterSelect } from '../people.select'

@Injectable()
export class SampleService extends createPrismaBase(MODELS.Voter) {
  async samplePeople(dto: SamplePeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      electionYear,
      size = 500,
      full = true,
      hasCellPhone,
    } = dto

    this.validateDistrictType(districtType as string | undefined)

    const select = this.buildVoterSelect(
      full,
      electionYear ?? new Date().getFullYear(),
      {} as DemographicFilter,
    )

    const target = this.clampSampleSize(size)
    const percents = this.getSamplingPercents()
    const whereSql = this.buildSampleWhereSql(
      state,
      districtType as string | undefined,
      districtName,
      hasCellPhone,
    )

    const ids = await this.collectSampleIds(target, percents, whereSql)

    if (ids.size < target) {
      const remaining = target - ids.size
      const extraIds = await this.collectRandomIds(
        remaining,
        whereSql,
        Array.from(ids),
      )
      for (const id of extraIds) {
        if (ids.size >= target) break
        ids.add(id)
      }
    }

    if (ids.size === 0) return []

    return this.model.findMany({
      where: { id: { in: Array.from(ids) } },
      select,
    })
  }

  private validateDistrictType(districtType?: string): void {
    if (!districtType) return
    const isValidField = Object.values(Prisma.VoterScalarFieldEnum).includes(
      districtType as Prisma.VoterScalarFieldEnum,
    )
    if (!isValidField) {
      throw new BadRequestException(
        `Unsupported districtType: ${districtType as string}`,
      )
    }
  }

  private getPerformanceField(electionYear: number): PerformanceFieldKey {
    const isEvenYear = electionYear % 2 === 0
    return isEvenYear
      ? 'VotingPerformanceEvenYearGeneral'
      : 'VotingPerformanceMinorElection'
  }

  private clampSampleSize(size: number): number {
    return Math.max(1, Math.min(size, 5000))
  }

  private getSamplingPercents(): number[] {
    return [0.5, 2, 5]
  }

  private buildSampleWhereSql(
    state: string,
    districtType?: string,
    districtName?: string,
    hasCellPhone?: boolean,
  ): Prisma.Sql {
    const whereParts: Prisma.Sql[] = [Prisma.sql`"State" = ${state}`]
    if (districtType && districtName) {
      whereParts.push(
        Prisma.sql`"${Prisma.raw(districtType)}" = ${districtName}`,
      )
    }
    if (hasCellPhone === true) {
      whereParts.push(
        Prisma.sql`"VoterTelephones_CellPhoneFormatted" IS NOT NULL`,
      )
    } else if (hasCellPhone === false) {
      whereParts.push(Prisma.sql`"VoterTelephones_CellPhoneFormatted" IS NULL`)
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
    whereSql: Prisma.Sql,
  ): Promise<Set<string>> {
    const ids = new Set<string>()

    const divisors: number[] = [1000, 500, 200, 100, 50, 20, 10, 5, 2, 1]

    for (const d of divisors) {
      if (ids.size >= target) break
      const remaining = target - ids.size
      const bucket = Math.floor(Math.random() * d)
      const condition = Prisma.sql`(abs(pg_catalog.hashtextextended("id"::text, 0)) % ${d}) = ${bucket}`
      const rows = await this.client.$queryRaw<
        Array<{ id: string }>
      >(Prisma.sql`
        SELECT "id"
        FROM "Voter"
        ${whereSql} AND ${condition}
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
    whereSql: Prisma.Sql,
    excludeIds: string[],
  ): Promise<string[]> {
    const whereWithExclusion = excludeIds.length
      ? Prisma.sql`${whereSql} AND "id" NOT IN (${Prisma.join(
          excludeIds.map((id) => Prisma.sql`${id}::uuid`),
        )})`
      : whereSql
    const rows = await this.client.$queryRaw<Array<{ id: string }>>(Prisma.sql`
      SELECT "id"
      FROM "Voter"
      ${whereWithExclusion}
      ORDER BY random()
      LIMIT ${remaining}
    `)
    return rows.map((r) => r.id)
  }
}
