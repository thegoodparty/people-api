import { BadRequestException } from '@nestjs/common'
import { beforeEach, describe, expect, it, vi } from 'vitest'
import { SampleService } from './sample.service'

describe('SampleService', () => {
  let service: SampleService
  let mockDistrictService: {
    findDistrictById: ReturnType<typeof vi.fn>
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

  it('uses district mode for non-state district', async () => {
    wireTransactionResults([[{ id: 'person-1', State: 'WY' }]])

    const result = await service.samplePeople({
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
      size: 1,
      hasCellPhone: true,
    })

    expect(mockDistrictService.findDistrictById).toHaveBeenCalledWith(
      '0e5bafca-93a9-86a5-2522-f373979720df',
    )
    expect(mockStatsService.getTotalCounts).toHaveBeenCalledWith(
      '0e5bafca-93a9-86a5-2522-f373979720df',
    )
    expect(result).toHaveLength(1)
  })

  it('uses state-only mode for state district', async () => {
    mockDistrictService.findDistrictById.mockResolvedValue({
      id: 'district-wy',
      type: 'State',
      name: 'WY',
      state: 'WY',
    })
    wireTransactionResults([[{ id: 'person-2', State: 'WY' }]])

    const result = await service.samplePeople({
      districtId: 'district-wy',
      size: 1,
      hasCellPhone: false,
    })

    expect(mockDistrictService.findDistrictById).toHaveBeenCalledWith(
      'district-wy',
    )
    expect(mockStatsService.getTotalCounts).toHaveBeenCalledWith('district-wy')
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

  it('applies excludeIds against total constituency pool when hasCellPhone=false', async () => {
    mockStatsService.getTotalCounts.mockResolvedValue({
      totalConstituents: 100,
      totalConstituentsWithCellPhone: 10,
    })
    wireTransactionResults([[]])

    await expect(
      service.samplePeople({
        districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
        size: 60,
        hasCellPhone: false,
        excludeIds: Array.from({ length: 50 }, (_, i) => `exclude-${i}`),
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
