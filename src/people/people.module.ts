import { Module } from '@nestjs/common'
import { PeopleController } from './people.controller'
import { PeopleService } from './services/people.service'
import { StatsService } from './services/stats.service'
import { PrismaModule } from 'src/prisma/prisma.module'
import { SampleService } from './services/sample.service'
import { DistrictModule } from 'src/district/district.module'

@Module({
  imports: [PrismaModule, DistrictModule],
  controllers: [PeopleController],
  providers: [PeopleService, StatsService, SampleService],
})
export class PeopleModule {}
