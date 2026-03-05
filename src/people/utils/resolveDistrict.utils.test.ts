import { BadRequestException } from '@nestjs/common'
import { describe, expect, it, vi } from 'vitest'
import { STATE_DISTRICT_TYPE } from '../people.schema'
import { resolveDistrict } from './resolveDistrict.utils'

describe('resolveDistrict', () => {
  it('resolves districtId-only query via district lookup', async () => {
    const districtService = {
      findDistrictById: vi.fn().mockResolvedValue({
        id: '0e5bafca-93a9-86a5-2522-f373979720df',
        type: 'City_Ward',
        name: 'CHEYENNE CITY WARD 1',
        state: 'WY',
      }),
      findDistrictId: vi.fn(),
    }

    const resolved = await resolveDistrict(districtService as never, {
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
    })

    expect(districtService.findDistrictById).toHaveBeenCalledWith(
      '0e5bafca-93a9-86a5-2522-f373979720df',
    )
    expect(districtService.findDistrictId).not.toHaveBeenCalled()
    expect(resolved).toEqual({
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
      state: 'WY',
      useVoterOnlyPath: false,
      districtType: 'City_Ward',
      districtName: 'CHEYENNE CITY WARD 1',
    })
  })

  it('marks districtId-only state district as voter-only path', async () => {
    const districtService = {
      findDistrictById: vi.fn().mockResolvedValue({
        id: 'district-wy',
        type: STATE_DISTRICT_TYPE,
        name: 'WY',
        state: 'WY',
      }),
      findDistrictId: vi.fn(),
    }

    const resolved = await resolveDistrict(districtService as never, {
      districtId: 'district-wy',
    })

    expect(resolved.useVoterOnlyPath).toBe(true)
    expect(resolved.state).toBe('WY')
  })

  it('resolves state + districtType + districtName via district id lookup', async () => {
    const districtService = {
      findDistrictById: vi.fn(),
      findDistrictId: vi.fn().mockResolvedValue('district-lookup-id'),
    }

    const resolved = await resolveDistrict(districtService as never, {
      state: 'WY',
      districtType: 'City_Ward',
      districtName: 'CHEYENNE CITY WARD 1',
    })

    expect(districtService.findDistrictId).toHaveBeenCalledWith({
      state: 'WY',
      type: 'City_Ward',
      name: 'CHEYENNE CITY WARD 1',
    })
    expect(districtService.findDistrictById).not.toHaveBeenCalled()
    expect(resolved).toEqual({
      districtId: 'district-lookup-id',
      state: 'WY',
      useVoterOnlyPath: false,
      districtType: 'City_Ward',
      districtName: 'CHEYENNE CITY WARD 1',
    })
  })

  it('uses voter-only path for state-only queries', async () => {
    const districtService = {
      findDistrictById: vi.fn(),
      findDistrictId: vi.fn(),
    }

    const resolved = await resolveDistrict(districtService as never, {
      state: 'WY',
    })

    expect(resolved).toEqual({
      districtId: null,
      state: 'WY',
      useVoterOnlyPath: true,
    })
    expect(districtService.findDistrictId).not.toHaveBeenCalled()
    expect(districtService.findDistrictById).not.toHaveBeenCalled()
  })

  it('throws for missing district and missing state', async () => {
    const districtService = {
      findDistrictById: vi.fn(),
      findDistrictId: vi.fn(),
    }

    await expect(resolveDistrict(districtService as never, {})).rejects.toThrow(
      BadRequestException,
    )
  })
})
