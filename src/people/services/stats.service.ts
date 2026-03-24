import { Injectable, NotFoundException } from '@nestjs/common'
import { DistrictStats } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { StatsDTO } from '../people.schema'

@Injectable()
export class StatsService extends createPrismaBase(MODELS.DistrictStats) {
  async getStats(dto: StatsDTO): Promise<DistrictStats> {
    const stats = await this.model.findUnique({
      where: { districtId: dto.districtId },
    })

    if (!stats) {
      throw new NotFoundException(
        `District stats not found for districtId=${dto.districtId}`,
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
