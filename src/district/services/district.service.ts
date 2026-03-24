import { Injectable, NotFoundException } from '@nestjs/common'
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
}
