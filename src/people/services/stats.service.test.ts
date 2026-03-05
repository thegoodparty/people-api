import { NotFoundException } from '@nestjs/common'
import { beforeEach, describe, expect, it, vi } from 'vitest'
import { StatsService } from './stats.service'

describe('StatsService', () => {
  let service: StatsService
  let mockDistrictService: {
    findDistrictId: ReturnType<typeof vi.fn>
  }
  let mockPrisma: {
    districtStats: {
      findUnique: ReturnType<typeof vi.fn>
    }
  }

  beforeEach(() => {
    mockDistrictService = {
      findDistrictId: vi.fn().mockResolvedValue('district-by-type-name'),
    }
    mockPrisma = {
      districtStats: {
        findUnique: vi.fn(),
      },
    }

    service = new StatsService(mockDistrictService as never)
    Object.defineProperty(service, '_prisma', {
      get: () => mockPrisma,
      configurable: true,
    })
  })

  it('uses districtId directly when provided', async () => {
    mockPrisma.districtStats.findUnique.mockResolvedValue({
      districtId: 'district-1',
      totalConstituents: 100,
    })

    const result = await service.getStats({
      districtId: 'district-1',
    } as never)

    expect(mockDistrictService.findDistrictId).not.toHaveBeenCalled()
    expect(mockPrisma.districtStats.findUnique).toHaveBeenCalledWith({
      where: { districtId: 'district-1' },
    })
    expect(result.districtId).toBe('district-1')
  })

  it('resolves districtId from state/type/name when districtId is absent', async () => {
    mockPrisma.districtStats.findUnique.mockResolvedValue({
      districtId: 'district-by-type-name',
      totalConstituents: 200,
    })

    const result = await service.getStats({
      state: 'WY',
      districtType: 'City_Ward',
      districtName: 'CHEYENNE CITY WARD 1',
    } as never)

    expect(mockDistrictService.findDistrictId).toHaveBeenCalledWith({
      state: 'WY',
      type: 'City_Ward',
      name: 'CHEYENNE CITY WARD 1',
    })
    expect(result.districtId).toBe('district-by-type-name')
  })

  it('throws NotFoundException when stats are missing', async () => {
    mockPrisma.districtStats.findUnique.mockResolvedValue(null)

    await expect(
      service.getStats({ districtId: 'missing-district-id' } as never),
    ).rejects.toThrow(NotFoundException)
  })

  it('returns total counts for a district', async () => {
    mockPrisma.districtStats.findUnique.mockResolvedValue({
      totalConstituents: 111,
      totalConstituentsWithCellPhone: 55,
    })

    const counts = await service.getTotalCounts('district-1')

    expect(mockPrisma.districtStats.findUnique).toHaveBeenCalledWith({
      select: {
        totalConstituents: true,
        totalConstituentsWithCellPhone: true,
      },
      where: { districtId: 'district-1' },
    })
    expect(counts.totalConstituents).toBe(111)
    expect(counts.totalConstituentsWithCellPhone).toBe(55)
  })

  it('throws when total counts are missing', async () => {
    mockPrisma.districtStats.findUnique.mockResolvedValue(null)

    await expect(service.getTotalCounts('missing-district-id')).rejects.toThrow(
      NotFoundException,
    )
  })
})
