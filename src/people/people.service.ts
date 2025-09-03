import { PrismaService } from 'src/prisma/prisma.service'
import { ListPeopleDTO } from './people.schema'
import { BadRequestException, Injectable } from '@nestjs/common'

@Injectable()
export class PeopleService {
  constructor(private readonly prisma: PrismaService) {}

  async findPeople(dto: ListPeopleDTO) {
    const { state, districtType, districtName, resultsPerPage, page } = dto
    const modelKey = `Voter${state.toUpperCase()}`

    const prismaAny = this.prisma as any
    const model = prismaAny[modelKey] ?? prismaAny['voter']
    if (!model) {
      throw new BadRequestException(`Unsupported state: ${state}`)
    }

    // Proper typing of this isn't available since we aren't tied to one table
    const where: Record<string, unknown> = {}
    if (districtType && districtName) {
      where[districtType] = districtName
    }

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const [totalResults, people] = await Promise.all([
      model.count({ where }),
      model.findMany({ where, take, skip }),
    ])

    const totalPages = Math.max(1, Math.ceil(totalResults / resultsPerPage))
    const currentPage = Math.min(Math.max(1, page), totalPages)

    return {
      pagination: {
        totalResults,
        currentPage,
        pageSize: resultsPerPage,
        totalPages,
        hasNextPage: currentPage < totalPages,
        hasPreviousPage: currentPage > 1,
      },
      people,
    }
  }
}
