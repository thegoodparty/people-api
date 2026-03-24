import { NotFoundException } from '@nestjs/common'
import { PassThrough } from 'stream'
import { describe, expect, it, beforeEach, vi } from 'vitest'
import { PeopleService } from './people.service'

const makeDbPerson = (overrides: Record<string, unknown> = {}) =>
  ({
    id: 'person-1',
    LALVOTERID: 'lal-1',
    State: 'WY',
    FirstName: 'Jane',
    MiddleName: null,
    LastName: 'Doe',
    NameSuffix: null,
    Residence_Addresses_AddressLine: null,
    Residence_Addresses_ExtraAddressLine: null,
    Residence_Addresses_City: null,
    Residence_Addresses_State: 'WY',
    Residence_Addresses_Zip: null,
    Residence_Addresses_ZipPlus4: null,
    Mailing_Addresses_AddressLine: null,
    Mailing_Addresses_ExtraAddressLine: null,
    Mailing_Addresses_City: null,
    Mailing_Addresses_State: null,
    Mailing_Addresses_Zip: null,
    Mailing_Addresses_ZipPlus4: null,
    Residence_Addresses_Latitude: null,
    Residence_Addresses_Longitude: null,
    VoterTelephones_LandlineFormatted: null,
    VoterTelephones_CellPhoneFormatted: null,
    Age: null,
    Gender: null,
    Parties_Description: null,
    Business_Owner: null,
    Education_Of_Person: null,
    Estimated_Income_Amount_Int: null,
    Homeowner_Probability_Model: null,
    Language_Code: null,
    Marital_Status: null,
    Presence_Of_Children: null,
    Veteran_Status: null,
    Voter_Status: null,
    EthnicGroups_EthnicGroup1Desc: null,
    Age_Int: null,
    VotingPerformanceEvenYearGeneral: null,
    VotingPerformanceMinorElection: null,
    ...overrides,
  }) as never

describe('PeopleService', () => {
  let service: PeopleService
  let mockSampleService: { samplePeople: ReturnType<typeof vi.fn> }
  let mockDistrictService: {
    findDistrictById: ReturnType<typeof vi.fn>
  }
  let mockStatsService: {
    getTotalCounts: ReturnType<typeof vi.fn>
  }
  let mockClient: {
    $queryRaw: ReturnType<typeof vi.fn>
  }

  beforeEach(() => {
    mockSampleService = {
      samplePeople: vi.fn().mockResolvedValue([]),
    }
    mockDistrictService = {
      findDistrictById: vi.fn().mockResolvedValue({
        id: '0e5bafca-93a9-86a5-2522-f373979720df',
        type: 'City_Ward',
        name: 'CHEYENNE CITY WARD 1',
        state: 'WY',
      }),
    }
    mockStatsService = {
      getTotalCounts: vi.fn().mockResolvedValue({
        totalConstituents: 120,
        totalConstituentsWithCellPhone: 80,
      }),
    }
    mockClient = {
      $queryRaw: vi.fn(),
    }

    service = new PeopleService(
      mockSampleService as never,
      mockDistrictService as never,
      mockStatsService as never,
    )

    Object.defineProperty(service, '_prisma', {
      get: () => mockClient,
      configurable: true,
    })
  })

  describe('findPeople query modes and pagination', () => {
    it('resolves district by id and uses fast count path', async () => {
      mockClient.$queryRaw.mockResolvedValueOnce([makeDbPerson()])

      const result = await service.findPeople({
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        filters: { filters: [], filterOperators: {} },
        resultsPerPage: 10,
        page: 1,
      } as never)

      expect(mockDistrictService.findDistrictById).toHaveBeenCalledWith(
        '0e5bafca-93a9-86a5-2522-f373979720df',
      )
      expect(mockStatsService.getTotalCounts).toHaveBeenCalledWith(
        '0e5bafca-93a9-86a5-2522-f373979720df',
      )
      expect(result.pagination.totalResults).toBe(120)
      expect(result.pagination.totalPages).toBe(12)
      expect(result.people.length).toBeGreaterThan(0)
    })

    it('uses voter-only path for state district', async () => {
      mockDistrictService.findDistrictById.mockResolvedValue({
        id: 'district-wy',
        type: 'State',
        name: 'WY',
        state: 'WY',
      })
      mockClient.$queryRaw
        .mockResolvedValueOnce([{ voter_count: 42n }])
        .mockResolvedValueOnce([makeDbPerson({ id: 'person-2' })])

      const result = await service.findPeople({
        districtId: 'district-wy',
        filters: { filters: [], filterOperators: {} },
        resultsPerPage: 10,
        page: 1,
      } as never)

      expect(mockStatsService.getTotalCounts).not.toHaveBeenCalled()
      expect(result.pagination.totalResults).toBe(42)
      expect(result.people[0]?.id).toBe('person-2')
    })

    it('uses raw count path (not stats shortcut) when search is provided', async () => {
      mockClient.$queryRaw
        .mockResolvedValueOnce([{ voter_count: 5n }])
        .mockResolvedValueOnce([makeDbPerson({ id: 'person-search' })])

      const result = await service.findPeople({
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        search: 'jane',
        filters: { filters: [], filterOperators: {} },
        resultsPerPage: 10,
        page: 1,
      } as never)

      expect(mockStatsService.getTotalCounts).not.toHaveBeenCalled()
      expect(mockClient.$queryRaw).toHaveBeenCalledTimes(2)
      expect(result.pagination.totalResults).toBe(5)
    })

    it('uses raw count path (not stats shortcut) when filters are provided', async () => {
      mockClient.$queryRaw
        .mockResolvedValueOnce([{ voter_count: 7n }])
        .mockResolvedValueOnce([makeDbPerson({ id: 'person-filtered' })])

      const result = await service.findPeople({
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        filters: {
          filters: ['hasCellPhone'],
          filterOperators: {
            hasCellPhone: { operator: 'is', value: 'not_null' },
          },
        },
        resultsPerPage: 10,
        page: 1,
      } as never)

      expect(mockStatsService.getTotalCounts).not.toHaveBeenCalled()
      expect(mockClient.$queryRaw).toHaveBeenCalledTimes(2)
      expect(result.pagination.totalResults).toBe(7)
    })

    it('clamps currentPage to totalPages when request page is too high', async () => {
      mockClient.$queryRaw.mockResolvedValueOnce([makeDbPerson()])
      mockStatsService.getTotalCounts.mockResolvedValue({
        totalConstituents: 15,
        totalConstituentsWithCellPhone: 10,
      })

      const result = await service.findPeople({
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        filters: { filters: [], filterOperators: {} },
        resultsPerPage: 10,
        page: 99,
      } as never)

      expect(result.pagination.totalPages).toBe(2)
      expect(result.pagination.currentPage).toBe(2)
      expect(result.pagination.hasPreviousPage).toBe(true)
      expect(result.pagination.hasNextPage).toBe(false)
    })
  })

  describe('findPerson', () => {
    it('returns person for district path', async () => {
      mockClient.$queryRaw.mockResolvedValueOnce([makeDbPerson({ id: 'person-ok' })])

      const person = await service.findPerson('person-ok', {
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
      } as never)

      expect(person.id).toBe('person-ok')
      expect(person.state).toBe('WY')
      expect(mockDistrictService.findDistrictById).toHaveBeenCalled()
    })

    it('returns district-specific not found message for non-state district', async () => {
      mockClient.$queryRaw.mockResolvedValueOnce([])

      await expect(
        service.findPerson('person-1', {
          districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        } as never),
      ).rejects.toThrow(new NotFoundException('Person not found in district'))
    })

    it('returns generic not found message for state district', async () => {
      mockDistrictService.findDistrictById.mockResolvedValue({
        id: 'district-wy',
        type: 'State',
        name: 'WY',
        state: 'WY',
      })
      mockClient.$queryRaw.mockResolvedValueOnce([])

      await expect(
        service.findPerson('person-1', {
          districtId: 'district-wy',
        } as never),
      ).rejects.toThrow(new NotFoundException('Person with ID person-1 not found'))
    })
  })

  describe('streamPeopleCsv', () => {
    it('streams csv with headers, data rows, and election fields', async () => {
      mockClient.$queryRaw
        .mockResolvedValueOnce([makeDbPerson({ id: 'stream-1' })])
        .mockResolvedValueOnce([])

      const raw = new PassThrough()
      const chunks: Buffer[] = []
      raw.on('data', (chunk) => {
        chunks.push(Buffer.from(chunk))
      })
      const ended = new Promise<void>((resolve) => raw.on('end', () => resolve()))

      await service.streamPeopleCsv(
        {
          districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
          filters: { filters: [], filterOperators: {} },
        } as never,
        {
          raw,
        } as never,
      )

      await ended
      const csv = Buffer.concat(chunks).toString('utf-8')
      const lines = csv
        .split('\n')
        .map((line) => line.trim())
        .filter((line) => line.length > 0)
      const header = lines[0].split(',')
      const data = lines[1].split(',')
      const electionLocationIdx = header.indexOf('electionLocation')
      const electionTypeIdx = header.indexOf('electionType')
      const unquote = (v: string) => v.replace(/^"(.*)"$/, '$1')

      expect(csv).toContain('electionLocation,electionType')
      expect(csv).toContain('stream-1')
      expect(csv).toContain('City_Ward')
      expect(csv).toContain('CHEYENNE CITY WARD 1')
      expect(electionLocationIdx).toBeGreaterThan(-1)
      expect(electionTypeIdx).toBeGreaterThan(-1)
      expect(unquote(data[electionLocationIdx])).toBe('CHEYENNE CITY WARD 1')
      expect(unquote(data[electionTypeIdx])).toBe('City_Ward')
    })
  })
})
