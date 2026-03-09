import { Injectable, NotFoundException } from '@nestjs/common'
import { DistrictStats } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { STATE_DISTRICT_TYPE, StatsDTO } from '../people.schema'
import { DistrictService } from 'src/district/services/district.service'

@Injectable()
export class StatsService extends createPrismaBase(MODELS.DistrictStats) {
  constructor(private readonly districtService: DistrictService) {
    super()
  }

  async getStats(dto: StatsDTO): Promise<DistrictStats> {
    const { districtId: dtoDistrictId, state, districtType, districtName } = dto
    const districtId = dtoDistrictId
      ? dtoDistrictId
      : await this.districtService.findDistrictId(
          districtType && districtName
            ? {
                state: state!,
                type: districtType,
                name: districtName,
              }
            : {
                state: state!,
                type: STATE_DISTRICT_TYPE,
                name: state!,
              },
        )
    const stats = await this.model.findUnique({ where: { districtId } })

    if (!stats) {
      throw new NotFoundException(
        `District stats not found for districtId=${districtId}`,
      )
    }

    return stats
  }

  async getTotalCounts(districtId: string) {
    const totalCounts = await this.model.findUnique({
      select: {
        totalConstituents: true,
        totalConstituentsWithCellPhone: true,
      },
      where: { districtId },
    })
    if (!totalCounts) {
      throw new NotFoundException(
        `District stats not found for districtId=${districtId}`,
      )
    }
    return totalCounts
  }
}
