import { Module } from '@nestjs/common'
import { APP_GUARD, Reflector } from '@nestjs/core'
import { S2SAuthGuard } from './s2s-auth.guard'

@Module({
  providers: [
    Reflector,
    {
      provide: APP_GUARD,
      useClass: S2SAuthGuard,
    },
  ],
})
export class AuthModule {}
