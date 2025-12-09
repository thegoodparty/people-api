import { Prisma, USState, $Enums } from '@prisma/client'
import {
  DownloadPeopleDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
  SearchPeopleDTO,
} from '../people.schema'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { SampleService } from './sample.service'
import {
  DEMOGRAPHIC_FILTER_FIELDS,
  DemographicFilter,
  FieldFilterOps,
  FilterFieldType,
} from '../people.filters'
import { buildVoterSelect } from '../people.select'
import { BadRequestException, Injectable } from '@nestjs/common'
import { AllowedFilter } from '../people.types'
import { FastifyReply } from 'fastify'
import { format } from '@fast-csv/format'
import type { RowMap } from '@fast-csv/format'
import { DistrictService } from 'src/district/services/district.service'

const filterToVoterStatusMap: Partial<Record<AllowedFilter, string>> = {
  audienceUnknown: 'Unknown',
  audienceFirstTimeVoters: 'First Time',
  audienceLikelyVoters: 'Likely',
  audienceUnlikelyVoters: 'Unlikely',
  audienceSuperVoters: 'Super',
}

@Injectable()
export class PeopleService extends createPrismaBase(MODELS.Voter) {
  constructor(
    private readonly sampleService: SampleService,
    private readonly districtService: DistrictService,
  ) {
    super()
  }
  private static readonly MAX_FIELDS = 15
  private static readonly API_FIELD_MAX_CHARS = 100
  private static readonly API_FIELD_MAX_VALUES = 50

  private normalizePhone(input: string): string | null {
    const digits = (input || '').replace(/\D/g, '')
    if (digits.length === 11 && digits.startsWith('1')) return digits.slice(1)
    if (digits.length === 10) return digits
    return null
  }

  private formatStoredPhoneFromDigits(digits: string): string {
    const area = digits.slice(0, 3)
    const prefix = digits.slice(3, 6)
    const line = digits.slice(6)
    return `(${area}) ${prefix}-${line}`
  }

  async searchVoters(dto: SearchPeopleDTO) {
    const {
      state,
      districtType,
      districtName,
      phone,
      name,
      firstName,
      lastName,
      resultsPerPage,
      page,
    } = dto

    const where: Prisma.VoterWhereInput = {}

    if (state) where.State = state as USState
    const districtId =
      state && districtType && districtName
        ? (
            await this.districtService.findFirst({
              where: {
                type: districtType, 
                name: districtName,
                state: state as $Enums.DistrictUSState,
              },
              select: { id: true },
            })
          )?.id
        : undefined

    const tokens = (name || '').trim().split(/\s+/).filter(Boolean)
    const hasNameTokens = tokens.length > 0 || firstName || lastName

    if (phone) {
      const normalized = this.normalizePhone(phone)
      if (!normalized) {
        throw new BadRequestException(
          'Invalid phone number; expected 10 digits',
        )
      }
      const formatted = this.formatStoredPhoneFromDigits(normalized)
      where.OR = [
        { VoterTelephones_CellPhoneFormatted: formatted },
        { VoterTelephones_LandlineFormatted: formatted },
      ]
    } else if (hasNameTokens) {
      const explicitFirst = Boolean(firstName)
      const explicitLast = Boolean(lastName)
      const twoTokens = tokens.length > 1

      if ((explicitFirst && explicitLast) || twoTokens) {
        const fn = firstName ?? tokens[0]
        const ln = lastName ?? tokens[tokens.length - 1]
        where.AND = [
          { FirstName: { equals: fn, mode: Prisma.QueryMode.default } },
          { LastName: { equals: ln, mode: Prisma.QueryMode.default } },
        ]
      } else {
        const single = firstName ?? lastName ?? tokens[0]
        where.OR = [
          {
            FirstName: {
              equals: single as string,
              mode: Prisma.QueryMode.default,
            },
          },
          {
            LastName: {
              equals: single as string,
              mode: Prisma.QueryMode.default,
            },
          },
        ]
      }
    }

    if (districtId) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ DistrictLinks: { some: { districtId } } })
      where.AND = andClauses
    }

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select: Prisma.VoterSelect = {
      id: true,
      LALVOTERID: true,
      State: true,
      FirstName: true,
      MiddleName: true,
      LastName: true,
      NameSuffix: true,
      VoterTelephones_CellPhoneFormatted: true,
      VoterTelephones_LandlineFormatted: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
      Parties_Description: true,
    }

    const [totalResults, results] = await Promise.all([
      this.model.count({ where }),
      this.model.findMany({
        where,
        take,
        skip,
        select,
        orderBy: [{ LastName: 'asc' }, { FirstName: 'asc' }],
      }),
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
      people: results,
    }
  }

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
    const model = this.model

    const resolvedDistrictId =
      state && districtType && districtName
        ? (
            await this.districtService.findFirst({
              where: {
                type: districtType,
                name: districtName,
                state: state as $Enums.DistrictUSState,
              },
              select: { id: true },
            })
          )?.id
        : undefined

    const where = this.buildWhere({
      state,
      districtId: resolvedDistrictId,
      filters,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const select = this.buildVoterSelect(
      full,
      electionYear,
      filter as DemographicFilter,
    )

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

    const resolvedDistrictId =
      state && districtType && districtName
        ? (
            await this.districtService.findFirst({
              where: {
                type: districtType,
                name: districtName,
                state: state as $Enums.DistrictUSState,
              },
              select: { id: true },
            })
          )?.id
        : undefined

    const where = this.buildWhere({
      state,
      districtId: resolvedDistrictId,
      filters,
      demographicFilter: filter as DemographicFilter,
      electionYear,
    })

    const select = this.buildVoterSelect(
      full,
      electionYear,
      filter as DemographicFilter,
    )
    const selectedColumns = Object.keys(select)
    const headers = [...selectedColumns, 'electionLocation', 'electionType']

    type ExportRow = RowMap<string | number | null | undefined>
    const csvStream = format<ExportRow, ExportRow>({ headers })
    csvStream.pipe(res.raw)

    const model = this.model
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

        type CsvValue = string | number | null | undefined
        for (const person of page) {
          if (aborted) break
          const row: ExportRow = {}
          for (const key of selectedColumns) {
            row[key] = person[key as keyof typeof person] as CsvValue
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

        cursor = (page[page.length - 1] as { LALVOTERID: string }).LALVOTERID

        if (page.length < pageSize) break
      }
    } finally {
      res.raw.off('close', onClose)
      csvStream.end()
    }
  }

  async samplePeople(dto: SamplePeopleDTO) {
    return this.sampleService.samplePeople(dto)
  }
  private buildVoterSelect(
    full: boolean,
    electionYear: number,
    demographicFilter: DemographicFilter,
  ): Prisma.VoterSelect {
    return buildVoterSelect(full, electionYear, demographicFilter)
  }

  private buildWhere(options: {
    state: string
    districtId?: string | undefined
    filters: AllowedFilter[]
    demographicFilter: DemographicFilter
    electionYear: number
  }): Prisma.VoterWhereInput {
    const { state, districtId, filters, demographicFilter, electionYear } =
      options
    const where: Prisma.VoterWhereInput = { State: state as USState }

    if (districtId) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ DistrictLinks: { some: { districtId } } })
      where.AND = andClauses
    }

    // genders
    const genderValues: string[] = []
    const includeNullGender = filters.includes('genderUnknown')
    if (filters.includes('genderMale')) genderValues.push('M')
    if (filters.includes('genderFemale')) genderValues.push('F')
    if (filters.includes('genderUnknown')) genderValues.push('')

    if (genderValues.length || includeNullGender) {
      const genderConditions: Prisma.VoterWhereInput[] = []
      if (genderValues.length) {
        genderConditions.push({ Gender: { in: genderValues } })
      }
      if (includeNullGender) {
        genderConditions.push({ Gender: null })
      }
      if (genderConditions.length === 1) {
        Object.assign(where, genderConditions[0])
      } else {
        const andClauses: Prisma.VoterWhereInput[] = []
        if (where.AND) {
          andClauses.push(
            ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
          )
        }
        andClauses.push({ OR: genderConditions })
        where.AND = andClauses
      }
    }

    const wantsDemocratic = filters.includes('partyDemocrat')
    const wantsRepublican = filters.includes('partyRepublican')
    const wantsIndependentOrOther = filters.includes('partyIndependent')
    const wantsUnknown = filters.includes('partyUnknown')

    if (
      wantsDemocratic ||
      wantsRepublican ||
      wantsIndependentOrOther ||
      wantsUnknown
    ) {
      // Build an OR of acceptable party conditions to correctly support
      // "independent" meaning everything that is NOT Democratic/Republican,
      // and combinations like Republican + Independent => exclude Democrats.
      const partyOrClauses: Prisma.VoterWhereInput[] = []

      // Explicit party inclusions (case-insensitive)
      if (wantsDemocratic) {
        partyOrClauses.push({
          Parties_Description: { equals: 'Democratic', mode: 'insensitive' },
        })
      }
      if (wantsRepublican) {
        partyOrClauses.push({
          Parties_Description: { equals: 'Republican', mode: 'insensitive' },
        })
      }

      // Independent means: anything non-null and non-empty except Democratic or Republican (case-insensitive)
      if (wantsIndependentOrOther) {
        partyOrClauses.push({
          AND: [
            {
              NOT: {
                Parties_Description: {
                  equals: 'Democratic',
                  mode: 'insensitive',
                },
              },
            },
            {
              NOT: {
                Parties_Description: {
                  equals: 'Republican',
                  mode: 'insensitive',
                },
              },
            },
            { Parties_Description: { not: '' } },
            { Parties_Description: { not: null } },
          ],
        })
      }

      // Unknown party means null or empty string
      if (wantsUnknown) {
        partyOrClauses.push({
          OR: [{ Parties_Description: null }, { Parties_Description: '' }],
        })
      }

      // If all four were selected, this effectively means "everyone"; in that
      // case we can skip adding a filter altogether. Otherwise apply OR.
      const selectsAll =
        wantsDemocratic &&
        wantsRepublican &&
        wantsIndependentOrOther &&
        wantsUnknown
      if (!selectsAll && partyOrClauses.length) {
        const andClauses: Prisma.VoterWhereInput[] = []
        if (where.AND) {
          andClauses.push(
            ...(Array.isArray(where.AND) ? where.AND : [where.AND]),
          )
        }
        andClauses.push({ OR: partyOrClauses })
        where.AND = andClauses
      }
    }

    // age buckets on indexed integer column
    const usesAge = filters.some((f) =>
      ['age18_25', 'age25_35', 'age35_50', 'age50Plus', 'ageUnknown'].includes(
        f,
      ),
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
      if (filters.includes('ageUnknown')) ageOr.push({ Age_Int: null as never })
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

    const voterStatusFilters = filters
      .map((filter) => filterToVoterStatusMap[filter] || '')
      .filter(Boolean)
    if (voterStatusFilters.length) {
      const andClauses: Prisma.VoterWhereInput[] = []
      if (where.AND) {
        andClauses.push(...(Array.isArray(where.AND) ? where.AND : [where.AND]))
      }
      andClauses.push({ Voter_Status: { in: voterStatusFilters } })
      where.AND = andClauses
    }

    // demographic filter translation
    const demographicWhere = this.translateDemographicFilter(
      demographicFilter,
      electionYear,
    )
    if (Object.keys(demographicWhere).length) {
      Object.assign(where, demographicWhere)
    }

    return where
  }

  private processEqualityOperation(
    apiField: string,
    prismaField: string,
    type: FilterFieldType,
    value: unknown,
  ): Prisma.VoterWhereInput {
    if (type === 'boolean') {
      let coercedValue = value
      if (typeof value === 'string') {
        const s = value.toLowerCase()
        if (s === 'true') coercedValue = true
        else if (s === 'false') coercedValue = false
        else {
          throw new BadRequestException(`Field ${apiField} expects true/false`)
        }
      }
      if (typeof coercedValue !== 'boolean') {
        throw new BadRequestException(
          `Field ${apiField} expects a boolean for eq`,
        )
      }
      return { [prismaField]: coercedValue as boolean } as never
    } else {
      if (typeof value !== 'string') {
        throw new BadRequestException(
          `Field ${apiField} expects a string for eq`,
        )
      }
      if (value.length > PeopleService.API_FIELD_MAX_CHARS) {
        throw new BadRequestException(
          `Value for ${apiField} exceeds ${PeopleService.API_FIELD_MAX_CHARS} characters`,
        )
      }
      return {
        [prismaField]: { equals: value, mode: 'insensitive' },
      } as never
    }
  }

  private processInclusionOperation(
    apiField: string,
    prismaField: string,
    type: FilterFieldType,
    inValue: unknown[] | unknown,
  ): Prisma.VoterWhereInput | null {
    const values = Array.isArray(inValue) ? inValue : [inValue]
    if (!values.length) return null
    if (values.length > PeopleService.API_FIELD_MAX_VALUES) {
      throw new BadRequestException(
        `Too many values for ${apiField}. Max allowed is ${PeopleService.API_FIELD_MAX_VALUES}`,
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
      return { [prismaField]: { in: coerced } } as never
    } else {
      // string case-insensitive IN -> OR of equals with mode insensitive
      const perValueClauses: Prisma.VoterWhereInput[] = []
      for (const v of values) {
        if (typeof v !== 'string') {
          throw new BadRequestException(
            `Field ${apiField} only accepts string values`,
          )
        }
        if (v.length > PeopleService.API_FIELD_MAX_CHARS) {
          throw new BadRequestException(
            `Value for ${apiField} exceeds ${PeopleService.API_FIELD_MAX_CHARS} characters`,
          )
        }
        perValueClauses.push({
          [prismaField]: { equals: v, mode: 'insensitive' },
        } as never)
      }
      if (perValueClauses.length === 1) {
        return perValueClauses[0]
      } else {
        return { OR: perValueClauses }
      }
    }
  }

  private processNullOperation(
    prismaField: string,
    isOperator: 'null' | 'not_null',
  ): Prisma.VoterWhereInput {
    if (isOperator === 'null') {
      return { [prismaField]: null } as never
    } else {
      return { NOT: { [prismaField]: null } } as never
    }
  }

  private combineFieldClauses(
    clauses: Prisma.VoterWhereInput[],
    andClauses: Prisma.VoterWhereInput[],
  ): void {
    // If we have multiple clauses for this field that must be ORed (e.g., IN + is:null)
    if (clauses.length === 1) {
      const single = clauses[0]
      if (single) andClauses.push(single)
    } else if (clauses.length > 1) {
      andClauses.push({ OR: clauses })
    }
  }

  private finalizeWhereClause(
    where: Prisma.VoterWhereInput,
    andClauses: Prisma.VoterWhereInput[],
  ): Prisma.VoterWhereInput {
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

  private validateDemographicFilter(filter: DemographicFilter): string[] {
    const fieldNames = Object.keys(filter)
    // enforce max fields
    if (fieldNames.length > PeopleService.MAX_FIELDS) {
      throw new BadRequestException(
        `Too many fields in filter. Max allowed is ${PeopleService.MAX_FIELDS}`,
      )
    }

    // validate field names
    for (const apiField of fieldNames) {
      const spec = DEMOGRAPHIC_FILTER_FIELDS[apiField]
      if (!spec) {
        throw new BadRequestException(`Unsupported filter field: ${apiField}`)
      }
    }

    return fieldNames
  }

  private translateDemographicFilter(
    filter: DemographicFilter,
    electionYear: number,
  ): Prisma.VoterWhereInput {
    const where: Prisma.VoterWhereInput = {}
    const andClauses: Prisma.VoterWhereInput[] = []

    const fieldNames = this.validateDemographicFilter(filter)
    if (!fieldNames.length) return where

    for (const apiField of fieldNames) {
      const spec = DEMOGRAPHIC_FILTER_FIELDS[apiField]
      const ops = filter[apiField] as FieldFilterOps
      const { type } = spec
      let { prismaField } = spec

      // Handle voting performance fields dynamically based on election year
      if (
        apiField === 'votingPerformanceEvenYearGeneral' ||
        apiField === 'votingPerformanceMinorElection'
      ) {
        const isEvenYear = electionYear % 2 === 0
        if (apiField === 'votingPerformanceEvenYearGeneral' && !isEvenYear) {
          continue // Skip this field for odd years
        }
        if (apiField === 'votingPerformanceMinorElection' && isEvenYear) {
          continue // Skip this field for even years
        }
        // Use the appropriate field based on election year
        prismaField = isEvenYear
          ? 'VotingPerformanceEvenYearGeneral'
          : 'VotingPerformanceMinorElection'
      }

      const clauses: Prisma.VoterWhereInput[] = []

      if (ops.eq !== undefined) {
        const eqClause = this.processEqualityOperation(
          apiField,
          prismaField,
          type,
          ops.eq,
        )
        clauses.push(eqClause)
      }

      if (ops.in !== undefined) {
        const inClause = this.processInclusionOperation(
          apiField,
          prismaField,
          type,
          ops.in,
        )
        if (inClause) {
          clauses.push(inClause)
        }
      }

      if (ops.is === 'null' || ops.is === 'not_null') {
        const nullClause = this.processNullOperation(prismaField, ops.is)
        clauses.push(nullClause)
      }

      this.combineFieldClauses(clauses, andClauses)
    }

    return this.finalizeWhereClause(where, andClauses)
  }
}
