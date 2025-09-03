import { Controller, Get, Query } from '@nestjs/common'
import { ListPeopleDTO } from './people.schema'
import { PeopleService } from './people.service'

@Controller('people')
export class PeopleController {
  constructor(private readonly peopleService: PeopleService) {}

  @Get('list')
  listPeople(@Query() filterDto: ListPeopleDTO) {
    return this.peopleService.findPeople(filterDto)
  }
}
