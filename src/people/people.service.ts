import { PrismaService } from 'src/prisma/prisma.service'
import { Prisma } from '@prisma/client'
import { ListPeopleDTO } from './people.schema'
import { BadRequestException, Injectable } from '@nestjs/common'
//
import { AllowedFilter } from './people.types'

@Injectable()
export class PeopleService {
  constructor(private readonly prisma: PrismaService) {}

  async findPeople(dto: ListPeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      resultsPerPage,
      page,
      filters = [],
      full = true,
    } = dto
    const model = this.prisma.voter

    // Validate districtType against Prisma enum if provided
    if (districtType) {
      const isValidField = Object.values(Prisma.VoterScalarFieldEnum).includes(
        districtType as Prisma.VoterScalarFieldEnum,
      )
      if (!isValidField) {
        throw new BadRequestException(
          `Unsupported districtType: ${districtType}`,
        )
      }
    }

    const ageIds = await this.findIdsByAgeFilters(
      state,
      filters as AllowedFilter[],
    )

    const where = this.buildWhere({
      state,
      districtType: districtType as keyof Prisma.VoterWhereInput | undefined,
      districtName,
      filters: filters as any,
      ageIds,
    })

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select = this.buildVoterSelect(full)

    const [totalResults, people] = await Promise.all([
      model.count({ where }),
      model.findMany({ where, take, skip, select }),
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

  // Private helpers
  private buildVoterSelect(full: boolean): Prisma.VoterSelect {
    if (full) {
      return {
        LALVOTERID: true,
        State: true,
        Voters_FirstName: true,
        Voters_MiddleName: true,
        Voters_LastName: true,
        Voters_NameSuffix: true,
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
        Voters_Age: true,
        Voters_Gender: true,
        Parties_Description: true,
        US_Congressional_District: true,
        State_Senate_District: true,
        State_House_District: true,
        County: true,
        City: true,
        Precinct: true,
      }
    }
    return {
      LALVOTERID: true,
      State: true,
      Voters_FirstName: true,
      Voters_LastName: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
    }
  }

  private buildWhere(options: {
    state: string
    districtType?: keyof Prisma.VoterWhereInput | undefined
    districtName?: string | undefined
    filters: AllowedFilter[]
    ageIds?: string[]
  }): Prisma.VoterWhereInput {
    const { state, districtType, districtName, filters, ageIds } = options
    const where: Prisma.VoterWhereInput = { State: state }

    if (districtType && districtName) {
      where[districtType] = { equals: districtName } as any
    }

    // genders
    const genderValues: string[] = []
    if (filters.includes('gender_male')) genderValues.push('M')
    if (filters.includes('gender_female')) genderValues.push('F')
    if (filters.includes('gender_unknown')) genderValues.push('')
    if (genderValues.length) where.Voters_Gender = { in: genderValues }

    // parties (TODO verify exact strings)
    const partyValues: string[] = []
    if (filters.includes('party_democrat')) partyValues.push('Dem')
    if (filters.includes('party_republican')) partyValues.push('Rep')
    if (filters.includes('party_independent')) partyValues.push('Ind')
    if (partyValues.length)
      where.Parties_Description = { in: partyValues } as any

    // age buckets via pre-fetched ids
    if (
      filters.some((f) =>
        ['age_18_25', 'age_25_35', 'age_35_50', 'age_50_plus'].includes(f),
      )
    ) {
      if (ageIds && ageIds.length) {
        where.LALVOTERID = { in: ageIds }
      } else {
        // no matches
        where.LALVOTERID = { in: ['__none__'] }
      }
    }

    // audience filters
    const turnoutOr: Prisma.VoterWhereInput[] = []
    if (filters.includes('audience_superVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: { in: ['High'] },
      } as any)
    }
    if (filters.includes('audience_likelyVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: {
          in: ['Above Average', 'Average'],
        },
      } as any)
    }
    if (filters.includes('audience_unreliableVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: { in: ['Below Average'] },
      } as any)
    }
    if (filters.includes('audience_unlikelyVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: { in: ['Low'] },
      } as any)
    }
    if (filters.includes('audience_firstTimeVoters')) {
      // TODO align with gp-api precise condition using reg date and history
      where.Voters_OfficialRegDate = { not: null }
    }
    if (filters.includes('audience_request')) {
      // TODO clarify semantics
    }
    if (turnoutOr.length) {
      where.AND = [...((where.AND as any[]) || []), { OR: turnoutOr }]
    }

    return where
  }

  private async findIdsByAgeFilters(
    state: string,
    filters: AllowedFilter[],
  ): Promise<string[] | undefined> {
    const usesAge = filters.some((f) =>
      ['age_18_25', 'age_25_35', 'age_35_50', 'age_50_plus'].includes(f),
    )
    if (!usesAge) return undefined

    const ranges: { min?: number; max?: number }[] = []
    if (filters.includes('age_18_25')) ranges.push({ min: 18, max: 25 })
    if (filters.includes('age_25_35')) ranges.push({ min: 25, max: 35 })
    if (filters.includes('age_35_50')) ranges.push({ min: 35, max: 50 })
    if (filters.includes('age_50_plus')) ranges.push({ min: 50 })

    // Build SQL where for ranges; Voters_Age is text, cast to int
    const clauses: string[] = []
    const params: any[] = []
    for (const r of ranges) {
      if (r.min !== undefined && r.max !== undefined) {
        clauses.push(
          '(CAST("Voters_Age" AS INT) >= $1 AND CAST("Voters_Age" AS INT) < $2)',
        )
        params.push(r.min, r.max)
      } else if (r.min !== undefined) {
        clauses.push('(CAST("Voters_Age" AS INT) >= $1)')
        params.push(r.min)
      }
    }
    const sql = `SELECT "LALVOTERID" FROM "Voter" WHERE "State" = $${
      params.length + 1
    } AND (${clauses.join(' OR ')}) LIMIT 100000`
    params.push(state)

    // Use $queryRawUnsafe with parameter order
    const rows = (await this.prisma.$queryRawUnsafe(sql, ...params)) as Array<{
      LALVOTERID: string
    }>
    return rows.map((r) => r.LALVOTERID)
  }
}
