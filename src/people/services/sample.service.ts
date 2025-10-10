import { Injectable, BadRequestException } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SamplePeopleDTO } from '../people.schema'
import {
  AnyElectionYearKey,
  GeneralYearKey,
  OtherElectionYearKey,
  PresidentialPrimaryYearKey,
  PrimaryYearKey,
  YearSelectKey,
  PerformanceFieldKey,
} from '../people.types'
import { DEMOGRAPHIC_FILTER_FIELDS, DemographicFilter } from '../people.filters'

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
    _demographicFilter: DemographicFilter,
  ): Prisma.VoterSelect {
    const isEvenYear = electionYear % 2 === 0
    if (full) {
      const select: Prisma.VoterSelect = {
        id: true,
        LALVOTERID: true,
        State: true,
        FirstName: true,
        MiddleName: true,
        LastName: true,
        NameSuffix: true,
        Residence_Addresses_AddressLine: true,
        Residence_Addresses_ExtraAddressLine: true,
        Residence_Addresses_City: true,
        Residence_Addresses_State: true,
        Residence_Addresses_Zip: true,
        Residence_Addresses_ZipPlus4: true,
        Mailing_Addresses_AddressLine: true,
        Mailing_Addresses_ExtraAddressLine: true,
        Mailing_Addresses_City: true,
        Mailing_Addresses_State: true,
        Mailing_Addresses_Zip: true,
        Mailing_Addresses_ZipPlus4: true,
        VoterTelephones_LandlineFormatted: true,
        VoterTelephones_CellPhoneFormatted: true,
        Age: true,
        Gender: true,
        Parties_Description: true,
        US_Congressional_District: true,
        State_Senate_District: true,
        State_House_District: true,
        County: true,
        City: true,
        Precinct: true,
      }

      if (isEvenYear) {
        ;(select as Record<YearSelectKey, boolean>)[
          `General_${electionYear}` as GeneralYearKey
        ] = true
        ;(select as Record<YearSelectKey, boolean>)[
          `Primary_${electionYear}` as PrimaryYearKey
        ] = true
        ;(select as Record<YearSelectKey, boolean>)[
          `OtherElection_${electionYear}` as OtherElectionYearKey
        ] = true
        if (electionYear % 4 === 0) {
          ;(select as Record<YearSelectKey, boolean>)[
            `PresidentialPrimary_${electionYear}` as PresidentialPrimaryYearKey
          ] = true
        }
      } else {
        ;(select as Record<YearSelectKey, boolean>)[
          `AnyElection_${electionYear}` as AnyElectionYearKey
        ] = true
      }

      this.addAllDemographicColumnsToSelect(select)
      return select
    }
    const minimal: Prisma.VoterSelect = {
      LALVOTERID: true,
      State: true,
      FirstName: true,
      LastName: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
    }

    this.addAllDemographicColumnsToSelect(minimal)
    return minimal
  }

  private addAllDemographicColumnsToSelect(select: Prisma.VoterSelect): void {
    for (const spec of Object.values(DEMOGRAPHIC_FILTER_FIELDS)) {
      ;(select as Record<string, boolean>)[spec.prismaField as string] = true
    }
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
