import { Controller, Get, Query, Res } from '@nestjs/common'
import { DownloadPeopleDTO, ListPeopleDTO } from './people.schema'
import { PeopleService } from './people.service'
import { FastifyReply } from 'fastify'

@Controller('people')
export class PeopleController {
  constructor(private readonly peopleService: PeopleService) {}

  @Get('list')
  listPeople(@Query() filterDto: ListPeopleDTO) {
    return this.peopleService.findPeople(filterDto)
  }

  @Get('download')
  async downloadPeople(
    @Query() dto: DownloadPeopleDTO,
    @Res({ passthrough: true }) res: FastifyReply,
  ) {
    res.header('Content-Type', 'text/csv')
    res.header('Content-Disposition', 'attachment; filename="people.csv"')
    return this.peopleService.streamPeopleCsv(dto, res)
  }
}
