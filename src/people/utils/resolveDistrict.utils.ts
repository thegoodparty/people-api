import { DistrictService } from 'src/district/services/district.service'
import { STATE_DISTRICT_TYPE } from '../people.schema'

export interface ResolveDistrictParams {
  state?: string
  districtId?: string
  districtType?: string
  districtName?: string
}

export interface ResolvedDistrict {
  districtId: string | null
  state: string
  useVoterOnlyPath: boolean
  districtType?: string
  districtName?: string
}

export async function resolveDistrict(
  districtService: DistrictService,
  params: ResolveDistrictParams,
): Promise<ResolvedDistrict> {
  const { state, districtId, districtType, districtName } = params
  if (districtId && !districtType && !districtName) {
    const district = await districtService.findDistrictById(districtId)
    const useVoterOnlyPath =
      district.type === STATE_DISTRICT_TYPE && district.name === district.state
    return {
      districtId: district.id,
      state: district.state,
      useVoterOnlyPath,
      districtType: district.type,
      districtName: district.name,
    }
  }
  if (state && districtType && districtName) {
    const resolvedId = await districtService.findDistrictId({
      state,
      type: districtType,
      name: districtName,
    })
    const useVoterOnlyPath =
      districtType === STATE_DISTRICT_TYPE && districtName === state
    return {
      districtId: resolvedId,
      state,
      useVoterOnlyPath,
      districtType,
      districtName,
    }
  }
  return {
    districtId: null,
    state: state ?? '',
    useVoterOnlyPath: true,
  }
}
