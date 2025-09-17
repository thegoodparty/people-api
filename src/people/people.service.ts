import { PrismaService } from 'src/prisma/prisma.service'
import { Prisma } from '@prisma/client'
import { DownloadPeopleDTO, ListPeopleDTO } from './people.schema'
import {
  DEMOGRAPHIC_FILTER_FIELDS,
  DemographicFilter,
  FieldFilterOps,
} from './people.filters'
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
      filter = {},
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
      demographicFilter: filter as DemographicFilter,
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
      filter = {},
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
      demographicFilter: filter as DemographicFilter,
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
        for (const person of page as unknown as PrismaRow[]) {
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
    demographicFilter: DemographicFilter
  }): Prisma.VoterWhereInput {
    const {
      state,
      districtType,
      districtName,
      filters,
      performanceField,
      demographicFilter,
    } = options
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

    // phones
    if (filters.includes('cellPhoneFormatted')) {
      where.VoterTelephones_CellPhoneFormatted = { not: null }
    }
    if (filters.includes('landlineFormatted')) {
      where.VoterTelephones_LandlineFormatted = { not: null }
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

    // demographic filter translation
    const demographicWhere = this.translateDemographicFilter(demographicFilter)
    if (Object.keys(demographicWhere).length) {
      Object.assign(where, demographicWhere)
    }

    return where
  }

  private translateDemographicFilter(
    filter: DemographicFilter,
  ): Prisma.VoterWhereInput {
    const where: Prisma.VoterWhereInput = {}
    const andClauses: Prisma.VoterWhereInput[] = []

    const fieldNames = Object.keys(filter)
    if (!fieldNames.length) return where

    // enforce max fields
    if (fieldNames.length > 15) {
      throw new BadRequestException(
        `Too many fields in filter. Max allowed is 15`,
      )
    }

    for (const apiField of fieldNames) {
      const spec = DEMOGRAPHIC_FILTER_FIELDS[apiField]
      if (!spec) {
        throw new BadRequestException(`Unsupported filter field: ${apiField}`)
      }

      const ops = filter[apiField] as FieldFilterOps
      const { prismaField, type } = spec

      const clauses: Prisma.VoterWhereInput[] = []

      if (ops.eq !== undefined) {
        if (type === 'boolean') {
          let value = ops.eq as unknown
          if (typeof value === 'string') {
            const s = value.toLowerCase()
            if (s === 'true') value = true
            else if (s === 'false') value = false
            else {
              throw new BadRequestException(
                `Field ${apiField} expects true/false`,
              )
            }
          }
          if (typeof value !== 'boolean') {
            throw new BadRequestException(
              `Field ${apiField} expects a boolean for eq`,
            )
          }
          clauses.push({ [prismaField]: value as boolean } as never)
        } else {
          if (typeof ops.eq !== 'string') {
            throw new BadRequestException(
              `Field ${apiField} expects a string for eq`,
            )
          }
          if (ops.eq.length > 100) {
            throw new BadRequestException(
              `Value for ${apiField} exceeds 100 characters`,
            )
          }
          clauses.push({
            [prismaField]: { equals: ops.eq, mode: 'insensitive' },
          } as never)
        }
      }

      if (ops.in !== undefined) {
        const values = Array.isArray(ops.in) ? ops.in : [ops.in]
        if (!values.length) continue
        if (values.length > 50) {
          throw new BadRequestException(
            `Too many values for ${apiField}. Max allowed is 50`,
          )
        }
        if (type === 'boolean') {
          const coerced: boolean[] = []
          for (const v of values) {
            if (typeof v === 'boolean') {
              coerced.push(v)
            } else if (typeof v === 'string') {
              const s = v.toLowerCase()
              if (s === 'true') coerced.push(true)
              else if (s === 'false') coerced.push(false)
              else
                throw new BadRequestException(
                  `Field ${apiField} only accepts true/false`,
                )
            } else {
              throw new BadRequestException(
                `Field ${apiField} only accepts boolean values`,
              )
            }
          }
          clauses.push({ [prismaField]: { in: coerced } } as never)
        } else {
          // string case-insensitive IN -> OR of equals with mode insensitive
          const perValueClauses: Prisma.VoterWhereInput[] = []
          for (const v of values) {
            if (typeof v !== 'string') {
              throw new BadRequestException(
                `Field ${apiField} only accepts string values`,
              )
            }
            if (v.length > 100) {
              throw new BadRequestException(
                `Value for ${apiField} exceeds 100 characters`,
              )
            }
            perValueClauses.push({
              [prismaField]: { equals: v, mode: 'insensitive' },
            } as never)
          }
          if (perValueClauses.length === 1) {
            clauses.push(perValueClauses[0])
          } else {
            clauses.push({ OR: perValueClauses })
          }
        }
      }

      if (ops.is === 'null') {
        clauses.push({ [prismaField]: null } as never)
      } else if (ops.is === 'not_null') {
        clauses.push({ NOT: { [prismaField]: null } } as never)
      }

      // If we have multiple clauses for this field that must be ORed (e.g., IN + is:null)
      if (clauses.length === 1) {
        const single = clauses[0]
        if (single) andClauses.push(single)
      } else if (clauses.length > 1) {
        andClauses.push({ OR: clauses })
      }
    }

    if (andClauses.length) {
      if (where.AND) {
        andClauses.unshift(
          ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
        )
      }
      where.AND = andClauses
    }

    return where
  }
}
