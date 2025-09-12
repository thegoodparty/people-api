import { PrismaService } from 'src/prisma/prisma.service'
import { Prisma } from '@prisma/client'
import { DownloadPeopleDTO, ListPeopleDTO } from './people.schema'
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
import { FastifyReply } from 'fastify'
import { format } from '@fast-csv/format'
import type { RowMap } from '@fast-csv/format'

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
      ? 'VotingPerformanceEvenYearGeneral'
      : 'VotingPerformanceMinorElection'

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

  async streamPeopleCsv(dto: DownloadPeopleDTO, res: FastifyReply) {
    const {
      state,
      electionYear = new Date().getFullYear(),
      full = true,
      filters = [],
    } = dto

    const districtType = (dto.districtType ?? dto.electionLocation) as
      | keyof Prisma.VoterWhereInput
      | undefined
    const districtName = dto.districtName ?? dto.electionType

    // Validate districtType against Prisma enum if provided
    if (districtType) {
      const isValidField = Object.values(Prisma.VoterScalarFieldEnum).includes(
        districtType as Prisma.VoterScalarFieldEnum,
      )
      if (!isValidField) {
        throw new BadRequestException(
          `Unsupported districtType: ${districtType as string}`,
        )
      }
    }

    const isEvenYear = electionYear % 2 === 0
    const performanceField: PerformanceFieldKey = isEvenYear
      ? 'VotingPerformanceEvenYearGeneral'
      : 'VotingPerformanceMinorElection'

    const where = this.buildWhere({
      state,
      districtType,
      districtName,
      filters,
      performanceField,
    })

    const select = this.buildVoterSelect(full, electionYear)
    const selectedColumns = Object.keys(select)
    const headers = [...selectedColumns, 'electionLocation', 'electionType']

    type ExportRow = RowMap<string | number | null | undefined>
    const csvStream = format<ExportRow, ExportRow>({ headers })
    csvStream.pipe(res.raw)

    const model = this.prisma.voter
    const pageSize = 5000
    let cursor: string | undefined
    let aborted = false

    const onClose = () => {
      aborted = true
    }
    res.raw.on('close', onClose)

    try {
      // pagination loop
      for (;;) {
        if (aborted) break

        const page = await model.findMany({
          where,
          select,
          orderBy: { LALVOTERID: 'asc' },
          take: pageSize,
          ...(cursor
            ? { skip: 1, cursor: { LALVOTERID: cursor as string } }
            : {}),
        })

        if (!page.length) break

        type PrismaRow = Record<string, string | number | null | undefined>
        for (const person of page as PrismaRow[]) {
          if (aborted) break
          const row: ExportRow = {}
          for (const key of selectedColumns) {
            row[key] = person[key]
          }
          row.electionLocation = districtType ?? ''
          row.electionType = districtName ?? ''

          const canContinue = csvStream.write(row)
          if (!canContinue) {
            await new Promise<void>((resolve) =>
              csvStream.once('drain', resolve),
            )
          }
        }

        cursor = (page[page.length - 1] as unknown as { LALVOTERID: string })
          .LALVOTERID

        if (page.length < pageSize) break
      }
    } finally {
      res.raw.off('close', onClose)
      csvStream.end()
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
    if (filters.includes('genderMale')) genderValues.push('M')
    if (filters.includes('genderFemale')) genderValues.push('F')
    if (filters.includes('genderUnknown')) genderValues.push('')
    if (genderValues.length) where.Gender = { in: genderValues }

    // parties (TODO verify exact strings)
    const partyValues: string[] = []
    if (filters.includes('partyDemocrat')) partyValues.push('Democratic')
    if (filters.includes('partyRepublican')) partyValues.push('Republican')
    if (filters.includes('partyIndependent'))
      partyValues.push('Non-Partisan', 'Other')
    if (partyValues.length) where.Parties_Description = { in: partyValues }

    // age buckets on indexed integer column
    const usesAge = filters.some((f) =>
      ['age18_25', 'age25_35', 'age35_50', 'age50Plus'].includes(f),
    )
    if (usesAge) {
      type AgeClause = Prisma.VoterWhereInput & {
        Age_Int?: Prisma.IntNullableFilter
      }
      const ageOr: AgeClause[] = []
      if (filters.includes('age18_25'))
        ageOr.push({ Age_Int: { gte: 18, lte: 25 } })
      if (filters.includes('age25_35'))
        ageOr.push({ Age_Int: { gt: 25, lte: 35 } })
      if (filters.includes('age35_50'))
        ageOr.push({ Age_Int: { gt: 35, lte: 50 } })
      if (filters.includes('age50Plus')) ageOr.push({ Age_Int: { gt: 50 } })
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
    if (filters.includes('audienceSuperVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['High'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceLikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Above Average', 'Average'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceUnreliableVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Below Average'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceUnlikelyVoters')) {
      turnoutOr.push({
        [performanceField]: { in: ['Low'] },
      } as unknown as Prisma.VoterWhereInput)
    }
    if (filters.includes('audienceFirstTimeVoters')) {
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
    if (filters.includes('audienceRequest')) {
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
