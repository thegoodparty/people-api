import { Module } from '@nestjs/common'
import { HealthModule } from './health/health.module'
import { PrismaModule } from './prisma/prisma.module'
import { PeopleModule } from './people/people.module'

@Module({
  imports: [PrismaModule, HealthModule, PeopleModule],
})
export class AppModule {}
