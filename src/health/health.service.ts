import { Injectable, Logger } from '@nestjs/common'
import { PrismaService } from '../prisma/prisma.service'

@Injectable()
export class HealthService {
  constructor(private prisma: PrismaService) {}
  private readonly logger = new Logger(HealthService.name)
  private startTime = Date.now()

  async checkHealth(): Promise<boolean> {
    const uptime = Date.now() - this.startTime

    if (uptime < 30000) {
      this.logger.debug(
        `Application still starting up (${uptime}ms), returning healthy`,
      )
      return true
    }

    try {
      await this.prisma.$queryRaw`SELECT 1`
      this.logger.debug('Database health check passed')
      return true
    } catch (error) {
      this.logger.error('Health check failed', { error })
      return false
    }
  }
}
