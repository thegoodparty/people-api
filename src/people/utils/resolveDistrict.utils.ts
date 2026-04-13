import { DistrictService } from 'src/district/services/district.service'

const STATE_DISTRICT_TYPE = 'State'

export interface ResolvedDistrict {
  districtId: string
  state: string
  useVoterOnlyPath: boolean
  districtType: string
  districtName: string
}

export const resolveDistrict = async (
  districtService: DistrictService,
  params: { districtId: string },
): Promise<ResolvedDistrict> => {
  const { id, type, name, state } = await districtService.findDistrictById(
    params.districtId,
  )
  return {
    districtId: id,
    state,
    useVoterOnlyPath: type === STATE_DISTRICT_TYPE && name === state,
    districtType: type,
    districtName: name,
  }
}
