import { PrismaService } from 'src/prisma/prisma.service'
import { Prisma } from '@prisma/client'
import { ListPeopleDTO } from './people.schema'
import { BadRequestException, Injectable } from '@nestjs/common'
import {
  AllowedFilter,
  AnyElectionYearKey,
  GeneralYearKey,
  OtherElectionYearKey,
  PerformanceFieldKey,
  PresidentialPrimaryYearKey,
  PrimaryYearKey,
  YearSelectKey,
} from './people.types'

@Injectable()
export class PeopleService {
  constructor(private readonly prisma: PrismaService) {}

  async findPeople(dto: ListPeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      electionYear,
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

    const isEvenYear = electionYear % 2 === 0
    const performanceField: PerformanceFieldKey = isEvenYear
      ? 'Voters_VotingPerformanceEvenYearGeneral'
      : 'Voters_VotingPerformanceMinorElection'

    const where = this.buildWhere({
      state,
      districtType: districtType as keyof Prisma.VoterWhereInput | undefined,
      districtName,
      filters,
      performanceField,
    })

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select = this.buildVoterSelect(full, electionYear)

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

  private buildVoterSelect(
    full: boolean,
    electionYear: number,
  ): Prisma.VoterSelect {
    const isEvenYear = electionYear % 2 === 0
    if (full) {
      const select: Prisma.VoterSelect = {
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

      return select
    }
    const minimal: Prisma.VoterSelect = {
      LALVOTERID: true,
      State: true,
      Voters_FirstName: true,
      Voters_LastName: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
    }
    return minimal
  }

  private buildWhere(options: {
    state: string
    districtType?: keyof Prisma.VoterWhereInput | undefined
    districtName?: string | undefined
    filters: AllowedFilter[]
    performanceField: PerformanceFieldKey
  }): Prisma.VoterWhereInput {
    const { state, districtType, districtName, filters, performanceField } =
      options
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
    if (filters.includes('party_democrat')) partyValues.push('Democratic')
    if (filters.includes('party_republican')) partyValues.push('Republican')
    if (filters.includes('party_independent'))
      partyValues.push('Non-Partisan', 'Other')
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
        ageOr.push({ Voters_Age_Int: { gte: 18, lte: 25 } })
      if (filters.includes('age_25_35'))
        ageOr.push({ Voters_Age_Int: { gt: 25, lte: 35 } })
      if (filters.includes('age_35_50'))
        ageOr.push({ Voters_Age_Int: { gt: 35, lte: 50 } })
      if (filters.includes('age_50_plus'))
        ageOr.push({ Voters_Age_Int: { gt: 50 } })
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
        [performanceField]: { in: ['High'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audience_likelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Above Average', 'Average'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audience_unreliableVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Below Average'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audience_unlikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Low'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audience_firstTimeVoters')) {
      // Match gp-api: treat no voting performance as first-time
      turnoutOr.push({
        OR: [
          {
            [performanceField]: { in: ['0%', 'Not Eligible', ''] },
          } as unknown as Prisma.VoterWhereInput,
          { [performanceField]: null } as unknown as Prisma.VoterWhereInput,
        ],
      })
    }
    if (filters.includes('audience_request')) {
      // no-op by design
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
