import { Injectable, NotFoundException } from '@nestjs/common'
import { $Enums } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'

@Injectable()
export class DistrictService extends createPrismaBase(MODELS.District) {
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
