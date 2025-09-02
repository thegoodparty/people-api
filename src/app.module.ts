import { Module } from '@nestjs/common'
import { HealthModule } from './health/health.module'
import { PrismaModule } from './prisma/prisma.module'

@Module({
  imports: [PrismaModule, HealthModule],
})
export class AppModule {}
