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
  const byDistrictId = !!districtId && !districtType && !districtName
  const byTypeName = !!state && !!districtType && !!districtName

  let resolved: ResolvedDistrict
  if (byDistrictId) {
    const district = await districtService.findDistrictById(districtId!)
    const { id, type, name, state: districtState } = district
    resolved = {
      districtId: id,
      state: districtState,
      useVoterOnlyPath: type === STATE_DISTRICT_TYPE && name === districtState,
      districtType: type,
      districtName: name,
    }
  } else if (byTypeName) {
    const resolvedId = await districtService.findDistrictId({
      state: state!,
      type: districtType!,
      name: districtName!,
    })
    resolved = {
      districtId: resolvedId,
      state: state!,
      useVoterOnlyPath:
        districtType === STATE_DISTRICT_TYPE && districtName === state,
      districtType,
      districtName,
    }
  } else {
    resolved = {
      districtId: null,
      state: state ?? '',
      useVoterOnlyPath: true,
    }
  }
  return resolved
}
