import { Module } from '@nestjs/common'
import { HealthModule } from './health/health.module'
import { AuthModule } from './auth/auth.module'
import { PrismaModule } from './prisma/prisma.module'
import { PeopleModule } from './people/people.module'
import { loggingConfig } from './logging/logging.config'
import { LoggerModule } from 'nestjs-pino'

@Module({
  imports: [
    LoggerModule.forRoot(loggingConfig),
    PrismaModule,
    HealthModule,
    PeopleModule,
    AuthModule,
  ],
})
export class AppModule {}
