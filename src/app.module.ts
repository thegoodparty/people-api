import { Module } from '@nestjs/common'
import { APP_INTERCEPTOR } from '@nestjs/core'
import { HealthModule } from './health/health.module'
import { AuthModule } from './auth/auth.module'
import { PrismaModule } from './prisma/prisma.module'
import { PeopleModule } from './people/people.module'
import { loggingConfig } from './logging/logging.config'
import { LoggerModule } from 'nestjs-pino'
import { NewRelicInterceptor } from './monitoring/newrelic.interceptor'

@Module({
  imports: [
    LoggerModule.forRoot(loggingConfig),
    PrismaModule,
    HealthModule,
    PeopleModule,
    AuthModule,
  ],
  providers: [
    {
      provide: APP_INTERCEPTOR,
      useClass: NewRelicInterceptor,
    },
  ],
})
export class AppModule {}
