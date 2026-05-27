import { Controller, Get, Post, Param, Query, Res, Body } from '@nestjs/common'
import {
  DownloadPeopleDTO,
  GetPersonParamsDTO,
  GetPersonQueryDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
  StatsDTO,
} from './people.schema'
import { PeopleService } from './services/people.service'
import { PeopleDownloadService } from './services/peopleDownload.service'
import { StatsService } from './services/stats.service'
import { FastifyReply } from 'fastify'

@Controller('people')
export class PeopleController {
  constructor(
    private readonly peopleService: PeopleService,
    private readonly peopleDownloadService: PeopleDownloadService,
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
    // Headers (Content-Type, Content-Disposition) are set inside
    // `streamPeopleCsv` only after the pg connection is acquired and the
    // COPY stream is constructed, so any earlier failure can still surface
    // as a structured 4xx/5xx instead of an `attachment; filename` header
    // committing the response to a broken download.
    await this.peopleDownloadService.streamPeopleCsv(dto, res)
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
    @Query() query: GetPersonQueryDTO,
  ) {
    return this.peopleService.findPerson(id, query)
  }
}
