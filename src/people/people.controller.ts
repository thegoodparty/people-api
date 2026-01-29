import {
  Controller,
  Get,
  Post,
  Param,
  Query,
  Res,
  Body,
} from '@nestjs/common'
import {
  DownloadPeopleDTO,
  GetPersonParamsDTO,
  GetPersonQueryDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
  StatsDTO,
} from './people.schema'
import { PeopleService } from './services/people.service'
import { StatsService } from './services/stats.service'
import { FastifyReply } from 'fastify'

@Controller('people')
export class PeopleController {
  constructor(
    private readonly peopleService: PeopleService,
    private readonly statsService: StatsService,
  ) {}

  @Post()
  listPeople(@Body() filterDto: ListPeopleDTO) {
    return this.peopleService.findPeople(filterDto)
  }

  @Post('download')
  async downloadPeople(
    @Body() dto: DownloadPeopleDTO,
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

  // keep for backwards compatibility
  @Get('sample')
  samplePeople(@Query() dto: SamplePeopleDTO) {
    return this.peopleService.samplePeople(dto)
  }

  // Post to allow large arrays of excludeIds in the body
  @Post('sample')
  async samplePeoplePost(@Body() dto: SamplePeopleDTO) {
    return this.peopleService.samplePeople(dto)
  }

  @Get(':id')
  async getPerson(
    @Param() { id }: GetPersonParamsDTO,
    @Query() { state }: GetPersonQueryDTO,
  ) {
    return this.peopleService.findPerson(id, state)
  }
}
