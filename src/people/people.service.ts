import { PrismaService } from 'src/prisma/prisma.service'
import { Prisma } from '@prisma/client'
import { ListPeopleDTO } from './people.schema'
import {
  BadRequestException,
  NotFoundException,
  Injectable,
} from '@nestjs/common'

@Injectable()
export class PeopleService {
  constructor(private readonly prisma: PrismaService) {}

  async findPeople(dto: ListPeopleDTO) {
    const { state, districtType, districtName, resultsPerPage, page } = dto
    const model = this.prisma.voter

    // Strongly-typed where clause for unified Voter table
    let where: Prisma.VoterWhereInput = { State: state }
    if (districtType && districtName) {
      const isValidField = Object.values(Prisma.VoterScalarFieldEnum).includes(
        districtType as Prisma.VoterScalarFieldEnum,
      )
      if (!isValidField) {
        throw new BadRequestException(
          `Unsupported districtType: ${districtType}`,
        )
      }
      const key = districtType as keyof Prisma.VoterWhereInput
      where = {
        ...where,
        [key]: { equals: districtName } as unknown,
      } as Prisma.VoterWhereInput
    }

    const take = resultsPerPage
    const skip = (page - 1) * resultsPerPage

    const [totalResults, people] = await Promise.all([
      model.count({ where }),
      model.findMany({ where, take, skip }),
    ])

    if (totalResults == 0) {
      throw new NotFoundException('No people found based on those parameters')
    }

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
