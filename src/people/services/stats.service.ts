import { Injectable, NotFoundException } from '@nestjs/common'
import { DistrictStats } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import { z } from 'zod'
import { StatsDTO } from '../people.schema'
import { DistrictService } from 'src/district/services/district.service'

const BucketsSchema = z.object({
  buckets: z.array(
    z.object({
      label: z.string(),
      count: z.number().int().positive(),
      percent: z.number().min(0).max(1),
    }),
  ),
})

const BucketStatsSchema = z.object({
  age: BucketsSchema,
  homeowner: BucketsSchema,
  education: BucketsSchema,
  presenceOfChildren: BucketsSchema,
  estimatedIncomeRange: BucketsSchema,
})

export type Stats = Omit<DistrictStats, 'stats'> & {
  stats: z.infer<typeof BucketStatsSchema>
}

@Injectable()
export class StatsService extends createPrismaBase(MODELS.DistrictStats) {
  constructor(private readonly districtService: DistrictService) {
    super()
  }

  async getStats({
    state,
    districtType,
    districtName,
  }: StatsDTO): Promise<Stats> {
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

    const parsedStats = BucketStatsSchema.safeParse(stats.stats)

    if (!parsedStats.success) {
      this.logger.error(parsedStats.error)
      throw new Error(parsedStats.error.message)
    }

    return { ...stats, stats: parsedStats.data }
  }
}
