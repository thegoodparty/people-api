import { describe, expect, it, vi } from 'vitest'
import { resolveDistrict } from './resolveDistrict.utils'

describe('resolveDistrict', () => {
  it('resolves district and returns state from lookup', async () => {
    const districtService = {
      findDistrictById: vi.fn().mockResolvedValue({
        id: '0e5bafca-93a9-86a5-2522-f373979720df',
        type: 'City_Ward',
        name: 'CHEYENNE CITY WARD 1',
        state: 'WY',
      }),
    }

    const resolved = await resolveDistrict(districtService as never, {
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
    })

    expect(districtService.findDistrictById).toHaveBeenCalledWith(
      '0e5bafca-93a9-86a5-2522-f373979720df',
    )
    expect(resolved).toEqual({
      districtId: '0e5bafca-93a9-86a5-2522-f373979720df',
      state: 'WY',
      useVoterOnlyPath: false,
      districtType: 'City_Ward',
      districtName: 'CHEYENNE CITY WARD 1',
    })
  })

  it('marks state district as voter-only path', async () => {
    const districtService = {
      findDistrictById: vi.fn().mockResolvedValue({
        id: 'district-wy',
        type: 'State',
        name: 'WY',
        state: 'WY',
      }),
    }

    const resolved = await resolveDistrict(districtService as never, {
      districtId: 'district-wy',
    })

    expect(resolved.useVoterOnlyPath).toBe(true)
    expect(resolved.state).toBe('WY')
  })
})
