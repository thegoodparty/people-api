import { Module } from '@nestjs/common'
import { HealthModule } from './health/health.module'
import { AuthModule } from './auth/auth.module'
import { PrismaModule } from './prisma/prisma.module'
import { PeopleModule } from './people/people.module'

@Module({
  imports: [PrismaModule, HealthModule, PeopleModule, AuthModule],
})
export class AppModule {}
