import { BadRequestException } from '@nestjs/common'
import { beforeEach, describe, expect, it, vi } from 'vitest'
import { STATE_DISTRICT_TYPE } from '../people.schema'
import { SampleService } from './sample.service'

describe('SampleService', () => {
  let service: SampleService
  let mockDistrictService: {
    findDistrictById: ReturnType<typeof vi.fn>
    findDistrictId: ReturnType<typeof vi.fn>
  }
  let mockStatsService: {
    getTotalCounts: ReturnType<typeof vi.fn>
  }
  let mockPrisma: {
    $transaction: ReturnType<typeof vi.fn>
  }

  beforeEach(() => {
    mockDistrictService = {
      findDistrictById: vi.fn().mockResolvedValue({
        id: '0e5bafca-93a9-86a5-2522-f373979720df',
        type: 'City_Ward',
        name: 'CHEYENNE CITY WARD 1',
        state: 'WY',
      }),
      findDistrictId: vi.fn().mockResolvedValue('statewide-district-id'),
    }

    mockStatsService = {
      getTotalCounts: vi.fn().mockResolvedValue({
        totalConstituents: 5000,
        totalConstituentsWithCellPhone: 3000,
      }),
    }

    mockPrisma = {
      $transaction: vi.fn(),
    }

    service = new SampleService(
      mockDistrictService as never,
      mockStatsService as never,
    )

    Object.defineProperty(service, '_prisma', {
      get: () => mockPrisma,
      configurable: true,
    })
  })

  const wireTransactionResults = (resultsByCall: unknown[][]) => {
    let call = 0
    mockPrisma.$transaction.mockImplementation(async (callback: unknown) => {
      const tx = {
        $executeRawUnsafe: vi.fn().mockResolvedValue(undefined),
        $queryRaw: vi.fn().mockResolvedValue(resultsByCall[call++] ?? []),
      }
      return (callback as (tx: unknown) => Promise<unknown>)(tx)
    })
  }

  it('uses district mode for districtId-only queries', async () => {
    wireTransactionResults([[{ id: 'person-1', State: 'WY' }]])

    const result = await service.samplePeople({
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
      size: 1,
      hasCellPhone: true,
    })

    expect(mockDistrictService.findDistrictById).toHaveBeenCalledWith(
      '0e5bafca-93a9-86a5-2522-f373979720df',
    )
    expect(mockDistrictService.findDistrictId).not.toHaveBeenCalled()
    expect(mockStatsService.getTotalCounts).toHaveBeenCalledWith(
      '0e5bafca-93a9-86a5-2522-f373979720df',
    )
    expect(result).toHaveLength(1)
  })

  it('uses state-only mode and resolves statewide district id when only state is provided', async () => {
    wireTransactionResults([[{ id: 'person-2', State: 'WY' }]])

    const result = await service.samplePeople({
      state: 'WY',
      size: 1,
      hasCellPhone: false,
    })

    expect(mockDistrictService.findDistrictById).not.toHaveBeenCalled()
    expect(mockDistrictService.findDistrictId).toHaveBeenCalledWith({
      state: 'WY',
      type: STATE_DISTRICT_TYPE,
      name: 'WY',
    })
    expect(mockStatsService.getTotalCounts).toHaveBeenCalledWith(
      'statewide-district-id',
    )
    expect(result).toHaveLength(1)
  })

  it('throws when remaining non-excluded constituents are insufficient', async () => {
    mockStatsService.getTotalCounts.mockResolvedValue({
      totalConstituents: 10,
      totalConstituentsWithCellPhone: 8,
    })
    wireTransactionResults([[]])

    await expect(
      service.samplePeople({
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        size: 20,
        hasCellPhone: true,
      }),
    ).rejects.toThrow(BadRequestException)
  })

  it('retries with a new seed when first sample is underfilled', async () => {
    wireTransactionResults([
      [{ id: 'person-a', State: 'WY' }],
      [{ id: 'person-a', State: 'WY' }, { id: 'person-b', State: 'WY' }],
    ])

    const result = await service.samplePeople({
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
      size: 2,
      hasCellPhone: true,
    })

    expect(mockPrisma.$transaction).toHaveBeenCalledTimes(2)
    expect(result).toHaveLength(2)
  })
})
