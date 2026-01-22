import {
  BadRequestException,
  Controller,
  Get,
  Post,
  NotFoundException,
  Param,
  Query,
  Res,
  Req,
  Body,
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
import type { FastifyRequest } from 'fastify'

type S2SPayload = {
  allowStatewide?: boolean
  state?: string
  iss?: string
  iat?: number
  exp?: number
}

type S2SRequest = FastifyRequest & { s2s?: S2SPayload }

@Controller('people')
export class PeopleController {
  constructor(
    private readonly peopleService: PeopleService,
    private readonly statsService: StatsService,
  ) { }

  @Get()
  listPeople(@Query() filterDto: ListPeopleDTO, @Req() req: S2SRequest) {
    this.enforceDistrictOrClaim(filterDto, req)
    return this.peopleService.findPeople(filterDto)
  }

  @Get('download')
  async downloadPeople(
    @Query() dto: DownloadPeopleDTO,
    @Req() req: S2SRequest,
    @Res() res: FastifyReply,
  ) {
    this.enforceDistrictOrClaim(dto, req)
    res.header('Content-Type', 'text/csv')
    res.header('Content-Disposition', 'attachment; filename="people.csv"')
    await this.peopleService.streamPeopleCsv(dto, res)
  }

  @Get('stats')
  getStats(@Query() dto: StatsDTO, @Req() req: S2SRequest) {
    this.enforceDistrictOrClaim(dto, req)
    return this.statsService.getStats(dto)
  }

  // keep for backwards compatibility
  @Get('sample')
  samplePeople(@Query() dto: SamplePeopleDTO) {
    return this.peopleService.samplePeople(dto)
  }

  // Post to allow large arrays of excludeIds in the body
  @Post('sample')
  async samplePeoplePost(@Body() dto: SamplePeopleDTO, @Req() req: S2SRequest) {
    this.enforceDistrictOrClaim(dto, req)
    return this.peopleService.samplePeople(dto)
  }

  @Get('search')
  search(@Query() dto: SearchPeopleDTO, @Req() req: S2SRequest) {
    this.enforceDistrictOrClaim(dto, req)
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

  private enforceDistrictOrClaim(
    dto: { state?: string; districtType?: string; districtName?: string },
    req: S2SRequest,
  ) {
    const { districtType, districtName, state } = dto
    const hasDistrict = Boolean(districtType && districtName)
    if (hasDistrict) return

    const allowStatewide = req?.s2s?.allowStatewide === true
    const claimState = req?.s2s?.state
    const matches = allowStatewide && state && claimState === state
    if (matches) return

    throw new BadRequestException(
      'districtType and districtName are required unless a valid statewide claim is present for the given state',
    )
  }
}
