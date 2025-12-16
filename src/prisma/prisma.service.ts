import {
  Injectable,
  Logger,
  OnModuleDestroy,
  OnModuleInit,
} from '@nestjs/common'
import { Prisma, PrismaClient } from '@prisma/client'

const PRISMA_LOG_LEVELS = [
  'info',
  'warn',
  'error',
  ...(process.env.LOG_LEVEL === 'debug' ? ['query' as Prisma.LogLevel] : []),
]

@Injectable()
export class PrismaService
  extends PrismaClient<Prisma.PrismaClientOptions, 'query'>
  implements OnModuleInit, OnModuleDestroy
{
  private logger = new Logger(PrismaService.name)

  constructor() {
    const databaseUrl = process.env.DATABASE_URL
    if (!databaseUrl) {
      throw new Error('DATABASE_URL environment variable is required')
    }

    // Parse existing DATABASE_URL and add connection pool parameters
    const url = new URL(databaseUrl)

    // Add connection pool parameters to the URL
    url.searchParams.set('connection_limit', '25')
    url.searchParams.set('pool_timeout', '5')
    url.searchParams.set('connect_timeout', '5')
    // Queries that take longer than 20 seconds will be cancelled.
    url.searchParams.set('socket_timeout', '60')

    super({
      log: PRISMA_LOG_LEVELS.map((level) => ({
        emit: 'event',
        level: level as Prisma.LogLevel,
      })),
      errorFormat: 'pretty',
      datasources: {
        db: {
          url: url.toString(),
        },
      },
    })
  }

  async onModuleInit() {
    if (process.env.NODE_ENV === 'perf-local') {
      this.$use(async (params, next) => {
        const blocked = [
          'create',
          'createMany',
          'update',
          'updateMany',
          'upsert',
          'delete',
          'deleteMany',
          //'$executeRaw',
          //'$executeRawUnsafe',
        ]
        if (blocked.includes(params.action)) {
          throw new Error('Writes are disabled in perf-local')
        }
        return next(params)
      })
    }
    await this.$connect()

    this.$on('query', (event: Prisma.QueryEvent) => {
      this.logger.debug(
        {
          query: event.query,
          params: event.params,
          durationMs: event.duration,
        },
        'Completed SQL query',
      )
    })
  }

  async onModuleDestroy() {
    await this.$disconnect()
  }
}
