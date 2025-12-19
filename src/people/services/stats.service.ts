import { Injectable, NotFoundException } from '@nestjs/common'
import { DistrictStats } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { StatsDTO } from '../people.schema'
import { DistrictService } from 'src/district/services/district.service'

@Injectable()
export class StatsService extends createPrismaBase(MODELS.DistrictStats) {
  constructor(private readonly districtService: DistrictService) {
    super()
  }

  async getStats({
    state,
    districtType,
    districtName,
  }: StatsDTO): Promise<DistrictStats> {
    const districtId = await this.districtService.findDistrictId({
      state,
      type: districtType,
      name: districtName,
    })
    const stats = await this.model.findUnique({ where: { districtId } })

    if (!stats) {
      throw new NotFoundException(
        `District stats not found for districtId=${districtId}`,
      )
    }

    return stats
  }

  async getTotalCounts(districtId: string) {
    // const totalCounts = await this.model.findUnique({
    //   select: {
    //     totalConstituents: true,
    //     totalConstituentsWithCellPhone: true
    //   },
    //   where: { districtId },
    // })

    // if (!totalCounts) {
    //   throw new NotFoundException(
    //     `District stats not found for districtId=${districtId}`,
    //   )
    // }
    // return totalCounts

    // TODO: Revert the mocking when stats are loaded
    // return {
    //   totalConstituents: 597_696,
    //   totalConstituentsWithCellPhone: 358_617
    // }
    return {
      totalConstituents: 14_957_341,
      totalConstituentsWithCellPhone: 7_478_670,
    }
  }
}
