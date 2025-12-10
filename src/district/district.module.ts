import { Module } from '@nestjs/common'
import { PrismaModule } from 'src/prisma/prisma.module'
import { DistrictService } from './services/district.service'

@Module({
  imports: [PrismaModule],
  providers: [DistrictService],
  exports: [DistrictService],
})
export class DistrictModule {}
