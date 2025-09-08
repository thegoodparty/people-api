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

    const where = this.buildWhere({
      state,
      districtType: districtType as keyof Prisma.VoterWhereInput | undefined,
      districtName,
      filters,
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
  }): Prisma.VoterWhereInput {
    const { state, districtType, districtName, filters } = options
    const where: Prisma.VoterWhereInput = { State: state }

    if (districtType && districtName) {
      // This cast allows us to avoid making a code change every time a new district type is introduced
      ;(where as Record<string, unknown>)[districtType] = {
        equals: districtName,
      }
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
    if (partyValues.length) where.Parties_Description = { in: partyValues }

    // age buckets on indexed integer column
    const usesAge = filters.some((f) =>
      ['age_18_25', 'age_25_35', 'age_35_50', 'age_50_plus'].includes(f),
    )
    if (usesAge) {
      type AgeClause = Prisma.VoterWhereInput & {
        Voters_Age_Int?: Prisma.IntNullableFilter
      }
      const ageOr: AgeClause[] = []
      if (filters.includes('age_18_25'))
        ageOr.push({ Voters_Age_Int: { gte: 18, lt: 25 } })
      if (filters.includes('age_25_35'))
        ageOr.push({ Voters_Age_Int: { gte: 25, lt: 35 } })
      if (filters.includes('age_35_50'))
        ageOr.push({ Voters_Age_Int: { gte: 35, lt: 50 } })
      if (filters.includes('age_50_plus'))
        ageOr.push({ Voters_Age_Int: { gte: 50 } })
      if (ageOr.length) {
        const andClauses: Prisma.VoterWhereInput[] = []
        if (where.AND) {
          andClauses.push(
            ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
          )
        }
        andClauses.push({ OR: ageOr })
        where.AND = andClauses
      }
    }

    // audience filters
    const turnoutOr: Prisma.VoterWhereInput[] = []
    if (filters.includes('audience_superVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: { in: ['High'] },
      })
    }
    if (filters.includes('audience_likelyVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: {
          in: ['Above Average', 'Average'],
        },
      })
    }
    if (filters.includes('audience_unreliableVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: { in: ['Below Average'] },
      })
    }
    if (filters.includes('audience_unlikelyVoters')) {
      turnoutOr.push({
        Voters_VotingPerformanceEvenYearGeneral: { in: ['Low'] },
      })
    }
    if (filters.includes('audience_firstTimeVoters')) {
      // TODO align with gp-api precise condition using reg date and history
      where.Voters_OfficialRegDate = { not: null }
    }
    if (filters.includes('audience_request')) {
      // TODO clarify semantics
    }
    if (turnoutOr.length) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ OR: turnoutOr })
      where.AND = andClauses
    }

    return where
  }
}
