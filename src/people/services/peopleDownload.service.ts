import {
  Injectable,
  InternalServerErrorException,
  Logger,
  OnModuleDestroy,
} from '@nestjs/common'
import type { FastifyReply } from 'fastify'
import { Pool, PoolClient } from 'pg'
import { to as copyTo } from 'pg-copy-streams'
import { DistrictService } from 'src/district/services/district.service'
import { DownloadPeopleDTO } from '../people.schema'
import { buildVoterSelectSql, ExtraSelectedField } from '../people.select'
import { buildVoterWhereSql } from '../utils/buildVoterWhereSql.utils'
import { inlinePrismaSql } from '../utils/inlinePrismaSql.utils'
import { resolveDistrict } from '../utils/resolveDistrict.utils'

const DATABASE_SCHEMA = 'green'
const VOTER_TABLENAME = 'Voter'
const DISTRICTVOTER_TABLENAME = 'DistrictVoter'

// Same turnout columns as the previous fast-csv implementation; preserved
// exactly so the exported CSV schema does not change.
const EXTRA_FIELDS: ExtraSelectedField[] = [
  'AnyElection_2017',
  'AnyElection_2019',
  'AnyElection_2021',
  'AnyElection_2023',
  'AnyElection_2025',
  'General_2016',
  'General_2018',
  'General_2020',
  'General_2022',
  'General_2024',
  'General_2026',
  'OtherElection_2016',
  'OtherElection_2018',
  'OtherElection_2020',
  'OtherElection_2022',
  'OtherElection_2024',
  'OtherElection_2026',
  'PresidentialPrimary_2016',
  'PresidentialPrimary_2020',
  'PresidentialPrimary_2024',
  'Primary_2016',
  'Primary_2018',
  'Primary_2020',
  'Primary_2022',
  'Primary_2024',
  'Primary_2026',
]

const quoteIdent = (id: string) => `"${id.replace(/"/g, '""')}"`

@Injectable()
export class PeopleDownloadService implements OnModuleDestroy {
  private readonly logger = new Logger(PeopleDownloadService.name)
  private readonly pool: Pool

  constructor(private readonly districtService: DistrictService) {
    const databaseUrl = process.env.DATABASE_URL
    if (!databaseUrl) {
      throw new Error('DATABASE_URL environment variable is required')
    }
    // Each COPY holds one session for the entire download. Cap connections so
    // CSV downloads cannot crowd out other workloads.
    //
    // NOTE: `COPY ... TO STDOUT` requires a session-mode Postgres connection.
    // It is INCOMPATIBLE with `pgbouncer` in transaction or statement pooling
    // mode. People-api currently connects directly to Aurora Postgres (see
    // `deploy/index.ts`), which is session-mode. If a transaction-mode pooler
    // is ever introduced in front of the DB, this service must bypass it.
    this.pool = new Pool({ connectionString: databaseUrl, max: 5 })
  }

  async onModuleDestroy() {
    await this.pool.end()
  }

  async streamPeopleCsv(
    dto: DownloadPeopleDTO,
    res: FastifyReply,
  ): Promise<void> {
    const { state, useVoterOnlyPath, districtId, districtType, districtName } =
      await resolveDistrict(this.districtService, dto)
    const effectiveDistrictId = useVoterOnlyPath ? null : districtId

    let client: PoolClient
    try {
      client = await this.pool.connect()
    } catch (err) {
      this.logger.error({ err }, 'Failed to acquire pg client for COPY')
      throw new InternalServerErrorException('Failed to start download')
    }

    const sql = this.buildCopySql({
      client,
      effectiveDistrictId,
      state,
      filters: dto.filters,
      districtName,
      districtType,
    })

    const copyStream = client.query(copyTo(sql))

    let released = false
    const release = () => {
      if (released) return
      released = true
      client.release()
    }

    copyStream.on('end', () => {
      release()
    })

    copyStream.on('error', (err: Error) => {
      this.logger.error({ err }, 'COPY stream error')
      release()
      if (!res.raw.headersSent) {
        res.raw.statusCode = 500
      }
      // Headers have likely already been sent for a streaming response, so we
      // cannot deliver a structured error. Terminate the underlying socket
      // without propagating the error event (the client will see a truncated
      // response and we have logged the cause).
      if (!res.raw.destroyed) {
        res.raw.destroy()
      }
    })

    res.raw.on('close', () => {
      if (!copyStream.destroyed) {
        copyStream.destroy()
      }
      release()
    })

    copyStream.pipe(res.raw)

    // Keep the Nest request alive until the response has fully flushed to the
    // client. Real HTTP responses fire `close` once the socket is done; in
    // tests / non-socket wrappers `finish` arrives first after `end()`. We
    // accept either signal.
    await new Promise<void>((resolve) => {
      const done = () => resolve()
      res.raw.once('close', done)
      res.raw.once('finish', done)
    })
  }

  private buildCopySql(args: {
    client: PoolClient
    effectiveDistrictId: string | null
    state: string
    filters: DownloadPeopleDTO['filters']
    districtName: string
    districtType: string
  }): string {
    const {
      client,
      effectiveDistrictId,
      state,
      filters,
      districtName,
      districtType,
    } = args

    const { columnNames } = buildVoterSelectSql(EXTRA_FIELDS)

    const voterCols = columnNames
      .map((c) => `v.${quoteIdent(c)} AS ${quoteIdent(c)}`)
      .join(', ')
    const electionLocationLiteral = client.escapeLiteral(districtName)
    const electionTypeLiteral = client.escapeLiteral(districtType)
    const selectList = `SELECT ${voterCols}, ${electionLocationLiteral} AS "electionLocation", ${electionTypeLiteral} AS "electionType"`

    const voterTable = `"${DATABASE_SCHEMA}"."${VOTER_TABLENAME}"`
    const dvTable = `"${DATABASE_SCHEMA}"."${DISTRICTVOTER_TABLENAME}"`
    const joinClause = effectiveDistrictId
      ? `JOIN ${dvTable} dv ON v."State" = dv."State" AND v."id" = dv."voter_id"`
      : ''

    const whereSql = buildVoterWhereSql({
      state,
      districtId: effectiveDistrictId,
      filters,
    })
    const whereClause = inlinePrismaSql(whereSql, client)

    return `COPY (
      ${selectList}
      FROM ${voterTable} v
      ${joinClause}
      ${whereClause}
    ) TO STDOUT WITH (FORMAT CSV, HEADER TRUE)`
  }
}
