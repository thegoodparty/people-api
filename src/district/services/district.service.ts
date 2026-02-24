import { Injectable, NotFoundException } from '@nestjs/common'
import { $Enums } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'

export interface DistrictById {
  id: string
  type: string
  name: string
  state: string
}

@Injectable()
export class DistrictService extends createPrismaBase(MODELS.District) {
  async findDistrictById(id: string): Promise<DistrictById> {
    const district = await this.model.findUnique({
      where: { id },
      select: { id: true, type: true, name: true, state: true },
    })
    if (!district) {
      throw new NotFoundException(`District not found for id=${id}`)
    }
    const { id: districtId, type, name, state } = district
    return {
      id: districtId,
      type,
      name,
      state,
    }
  }

  async findDistrictId(typeNameState: {
    state: string
    type: string
    name: string
  }) {
    const { state, type, name } = typeNameState
    const district = await this.model.findUnique({
      where: {
        type_name_state: {
          type,
          name,
          state: state as $Enums.DistrictUSState,
        },
      },
      select: { id: true },
    })
    if (!district?.id) {
      throw new NotFoundException(
        `District not found for state=${state} type=${type} name=${name}`,
      )
    }
    return district.id
  }
}
