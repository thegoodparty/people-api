import { Injectable } from '@nestjs/common'
import { Prisma } from '@prisma/client'
import { createPrismaBase, MODELS } from 'src/prisma/util/prisma.util'
import type {
  BucketsResult,
  BucketsWithRaw,
  StatsCategoryMap,
} from '../people.types'
import { StatsDTO } from '../people.schema'

@Injectable()
export class StatsService extends createPrismaBase(MODELS.Voter) {
  async getStats(dto: StatsDTO): Promise<{
    meta: {
      state: string
      districtType?: string
      districtName?: string
      electionYear: number
      totalConstituents: number
    }
    categories: StatsCategoryMap
  }> {
    const { state, districtType, districtName, electionYear } = dto

    const where: Prisma.VoterWhereInput = { State: state }

    if (districtType && districtName) {
      ;(where as Record<string, unknown>)[districtType] = {
        equals: districtName,
      }
    }

    const totalConstituents = await this.model.count({ where })

    const tasks: Array<Promise<[string, BucketsResult | BucketsWithRaw]>> = []

    // Limit concurrency to reduce Prisma connection pool pressure
    const concurrency = 4
    const results: Array<[string, BucketsResult | BucketsWithRaw]> = []
    for (let i = 0; i < tasks.length; i += concurrency) {
      const batch = tasks.slice(i, i + concurrency)
      const batchResults = await Promise.all(batch)
      results.push(...batchResults)
    }
    const categoriesOut: StatsCategoryMap = {}
    for (const [name, value] of results) categoriesOut[name] = value

    return {
      meta: {
        state,
        districtType,
        districtName,
        electionYear,
        totalConstituents,
      },
      categories: categoriesOut,
    }
  }
}
