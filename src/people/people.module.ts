import { Module } from '@nestjs/common'
import { PeopleController } from './people.controller'
import { PeopleService } from './services/people.service'
import { StatsService } from './services/stats.service'
import { PrismaModule } from 'src/prisma/prisma.module'

@Module({
  imports: [PrismaModule],
  controllers: [PeopleController],
  providers: [PeopleService, StatsService],
})
export class PeopleModule {}
