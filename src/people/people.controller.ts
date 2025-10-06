import {
  BadRequestException,
  Controller,
  Get,
  NotFoundException,
  Param,
  Query,
  Res,
} from '@nestjs/common'
import {
  DownloadPeopleDTO,
  ListPeopleDTO,
  SamplePeopleDTO,
  SearchPeopleDTO,
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

  @Get('sample')
  samplePeople(@Query() dto: SamplePeopleDTO) {
    return this.peopleService.samplePeople(dto)
  }

  @Get('search')
  search(@Query() dto: SearchPeopleDTO) {
    return this.peopleService.searchVoters(dto)
  }

  @Get(':id')
  async getPerson(@Param('id') id: string) {
    if (!id || id.trim() === '') {
      throw new BadRequestException('ID parameter is required')
    }

    const person = await this.peopleService.findUnique({ where: { id } })
    if (!person) {
      throw new NotFoundException(`Person with ID ${id} not found`)
    }

    return person
  }
}
