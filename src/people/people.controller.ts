import { Controller, Get, Param, Query, Res } from '@nestjs/common'
import { DownloadPeopleDTO, ListPeopleDTO, StatsDTO } from './people.schema'
import { PeopleService } from './services/people.service'
import { StatsService } from './services/stats.service'
import { FastifyReply } from 'fastify'

@Controller('people')
export class PeopleController {
  constructor(
    private readonly peopleService: PeopleService,
    private readonly statsService: StatsService,
  ) {}

  @Get(':id')
  getPerson(@Param('id') id: string) {
    return this.peopleService.findUnique({ where: { id } })
  }

  @Get()
  listPeople(@Query() filterDto: ListPeopleDTO) {
    return this.peopleService.findPeople(filterDto)
  }

  @Get('download')
  async downloadPeople(
    @Query() dto: DownloadPeopleDTO,
    @Res() res: FastifyReply,
  ) {
    res.header('Content-Type', 'text/csv')
    res.header('Content-Disposition', 'attachment; filename="people.csv"')
    await this.peopleService.streamPeopleCsv(dto, res)
  }

  @Get('stats')
  getStats(@Query() dto: StatsDTO) {
    return this.statsService.getStats(dto)
  }
}
