import { Logger } from '@nestjs/common'
import { PassThrough } from 'stream'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'
import { PeopleDownloadService } from './peopleDownload.service'

const mockRelease = vi.fn()
const mockPoolEnd = vi.fn()
const mockClientQuery = vi.fn()
const mockPoolConnect = vi.fn()

vi.mock('pg', () => {
  const PoolClass = function () {
    // @ts-expect-error -- mock constructor
    this.connect = mockPoolConnect
    // @ts-expect-error -- mock constructor
    this.end = mockPoolEnd
  }
  return { Pool: PoolClass }
})

vi.mock('pg-copy-streams', () => ({
  to: vi.fn((sql: string) => sql),
}))

const districtServiceMock = {
  findDistrictById: vi.fn(),
}

const DISTRICT_UUID = '0e5bafca-93a9-86a5-2522-f373979720df'

const cityWardDistrict = {
  id: DISTRICT_UUID,
  type: 'City_Ward',
  name: 'CHEYENNE CITY WARD 1',
  state: 'WY',
}

const stateDistrict = {
  id: 'district-wy',
  type: 'State',
  name: 'WY',
  state: 'WY',
}

const escapeLiteralMock = (raw: string) => `'${raw.replace(/'/g, "''")}'`

const setupClient = () => {
  const client = {
    query: mockClientQuery,
    release: mockRelease,
    escapeLiteral: escapeLiteralMock,
  }
  mockPoolConnect.mockResolvedValue(client)
  return client
}

type MockRaw = PassThrough & {
  statusCode?: number
  headersSent: boolean
  flushHeaders: ReturnType<typeof vi.fn>
  setHeader: ReturnType<typeof vi.fn>
}

type MockReply = Parameters<PeopleDownloadService['streamPeopleCsv']>[1]

const makeRawResponse = (): { res: MockReply; raw: MockRaw } => {
  const raw = new PassThrough() as unknown as MockRaw
  raw.headersSent = false
  // Real Node ServerResponse exposes `flushHeaders` and `setHeader`. The
  // download service uses both to commit headers to the wire before COPY
  // produces any rows.
  raw.flushHeaders = vi.fn(() => {
    raw.headersSent = true
  })
  raw.setHeader = vi.fn()
  const res = { raw } as unknown as MockReply
  return { res, raw }
}

describe('PeopleDownloadService', () => {
  let service: PeopleDownloadService
  let copyStream: PassThrough

  beforeEach(() => {
    process.env.DATABASE_URL = 'postgres://example/test'
    vi.clearAllMocks()
    districtServiceMock.findDistrictById.mockReset()
    districtServiceMock.findDistrictById.mockResolvedValue(cityWardDistrict)

    copyStream = new PassThrough()
    // The service issues a plain `SET statement_timeout = 0` before the COPY
    // and then the COPY itself. The plain SET resolves as a regular pg query
    // result; the COPY call returns a Readable stream via pg-copy-streams.
    mockClientQuery.mockImplementation((arg: unknown) => {
      if (typeof arg === 'string' && arg.startsWith('SET ')) {
        return Promise.resolve({ rows: [], rowCount: 0 })
      }
      return copyStream
    })
    setupClient()

    service = new PeopleDownloadService(districtServiceMock as never)
  })

  afterEach(() => {
    if (!copyStream.destroyed) copyStream.destroy()
  })

  describe('streamPeopleCsv', () => {
    it('builds COPY SQL with the voter join, where clause, and election constants', async () => {
      const { to: copyTo } = await import('pg-copy-streams')

      const { res, raw } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      raw.destroy()

      await completion

      const sql = vi.mocked(copyTo).mock.calls[0][0] as string
      expect(sql).toContain('TO STDOUT WITH (FORMAT CSV, HEADER TRUE)')
      expect(sql).toContain('FROM "green"."Voter" v')
      expect(sql).toContain('JOIN "green"."DistrictVoter" dv')
      expect(sql).toContain(`dv."district_id" = '${DISTRICT_UUID}'::uuid`)
      expect(sql).toContain(
        `v."State" = CAST('WY'::text AS "public"."USState")`,
      )
      expect(sql).toContain(`'CHEYENNE CITY WARD 1' AS "electionLocation"`)
      expect(sql).toContain(`'City_Ward' AS "electionType"`)
      expect(sql).toContain('v."LALVOTERID" AS "LALVOTERID"')
      expect(sql).toContain('v."Primary_2026" AS "Primary_2026"')
    })

    it('omits the DistrictVoter join for state-only districts', async () => {
      const { to: copyTo } = await import('pg-copy-streams')
      districtServiceMock.findDistrictById.mockResolvedValue(stateDistrict)

      const { res, raw } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: stateDistrict.id,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      raw.destroy()

      await completion

      const sql = vi.mocked(copyTo).mock.calls[0][0] as string
      expect(sql).not.toContain('JOIN "green"."DistrictVoter"')
      expect(sql).not.toContain('dv."district_id"')
      expect(sql).toContain(
        `v."State" = CAST('WY'::text AS "public"."USState")`,
      )
    })

    it('inlines filter predicates into the COPY SQL', async () => {
      const { to: copyTo } = await import('pg-copy-streams')

      const { res, raw } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: {
            filters: ['hasCellPhone', 'ageInt'],
            filterOperators: {
              hasCellPhone: { operator: 'is', value: 'not_null' },
              ageInt: { operator: 'range', gte: 30, lte: 50 },
            },
          },
        } as never,
        res,
      )

      copyStream.end()
      raw.destroy()

      await completion

      const sql = vi.mocked(copyTo).mock.calls[0][0] as string
      expect(sql).toContain(
        'v."VoterTelephones_CellPhoneFormatted" IS NOT NULL',
      )
      expect(sql).toContain('v."Age_Int" >= 30')
      expect(sql).toContain('v."Age_Int" <= 50')
    })

    it('pipes COPY stream output into res.raw', async () => {
      const { res, raw } = makeRawResponse()
      const chunks: Buffer[] = []
      raw.on('data', (chunk) => chunks.push(Buffer.from(chunk)))

      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.write('id,first_name\n')
      copyStream.write('"abc","Jane"\n')
      copyStream.end()

      // pipe.end propagates to raw, which fires `finish` then `close`.
      await completion
      const out = Buffer.concat(chunks).toString('utf-8')
      expect(out).toContain('id,first_name')
      expect(out).toContain('"abc","Jane"')
    })

    it('releases the pg client when the COPY stream ends', async () => {
      const { res } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      await completion

      expect(mockRelease).toHaveBeenCalledTimes(1)
    })

    it('releases the pg client and propagates an error on COPY failure', async () => {
      const { res, raw } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.destroy(new Error('pg connection lost'))

      await completion
      expect(mockRelease).toHaveBeenCalledTimes(1)
      expect(raw.destroyed).toBe(true)
    })

    it('destroys the COPY stream when the client aborts (res.raw close)', async () => {
      const { res, raw } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      raw.destroy()
      await completion

      expect(copyStream.destroyed).toBe(true)
      expect(mockRelease).toHaveBeenCalledTimes(1)
    })

    it('throws InternalServerErrorException when the pool cannot connect', async () => {
      mockPoolConnect.mockRejectedValueOnce(new Error('pool exhausted'))

      const { res } = makeRawResponse()

      await expect(
        service.streamPeopleCsv(
          {
            districtId: DISTRICT_UUID,
            filters: { filters: [], filterOperators: {} },
          } as never,
          res,
        ),
      ).rejects.toMatchObject({ status: 500 })
    })

    it('disables statement_timeout for the COPY session before issuing the COPY', async () => {
      const { res } = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      await completion

      const queries = mockClientQuery.mock.calls.map((call) => call[0])
      const setIdx = queries.findIndex(
        (q) => typeof q === 'string' && q.includes('statement_timeout'),
      )
      const copyIdx = queries.findIndex(
        (q) => typeof q === 'string' && q.startsWith('COPY ('),
      )
      expect(setIdx).toBeGreaterThanOrEqual(0)
      expect(copyIdx).toBeGreaterThan(setIdx)
      expect(queries[setIdx]).toBe('SET statement_timeout = 0')
    })

    it('flushes response headers after pool.connect + SET + COPY init, with download headers set first', async () => {
      const { to: copyTo } = await import('pg-copy-streams')

      const { res, raw } = makeRawResponse()

      const callOrder: string[] = []
      mockPoolConnect.mockImplementationOnce(async () => {
        callOrder.push('connect')
        return {
          query: mockClientQuery,
          release: mockRelease,
          escapeLiteral: escapeLiteralMock,
        }
      })
      mockClientQuery.mockImplementation((arg: unknown) => {
        if (typeof arg === 'string' && arg.startsWith('SET ')) {
          callOrder.push('set-timeout')
          return Promise.resolve({ rows: [], rowCount: 0 })
        }
        callOrder.push('copy')
        return copyStream
      })
      raw.setHeader.mockImplementation((name: string) => {
        callOrder.push(`set-header:${name}`)
      })
      raw.flushHeaders.mockImplementationOnce(() => {
        callOrder.push('flush-headers')
      })

      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      await completion

      expect(raw.flushHeaders).toHaveBeenCalledTimes(1)
      // Required ordering: connect → SET → COPY init → set the download
      // headers → flush. Headers must land on the wire after we know the
      // COPY stream is alive, so any earlier failure surfaces as a
      // structured 5xx instead of a corrupted "attachment" response.
      const connectIdx = callOrder.indexOf('connect')
      const setIdx = callOrder.indexOf('set-timeout')
      const copyIdx = callOrder.indexOf('copy')
      const contentTypeIdx = callOrder.indexOf('set-header:Content-Type')
      const dispositionIdx = callOrder.indexOf('set-header:Content-Disposition')
      const flushIdx = callOrder.indexOf('flush-headers')
      expect(connectIdx).toBeGreaterThanOrEqual(0)
      expect(setIdx).toBeGreaterThan(connectIdx)
      expect(copyIdx).toBeGreaterThan(setIdx)
      expect(contentTypeIdx).toBeGreaterThan(copyIdx)
      expect(dispositionIdx).toBeGreaterThan(copyIdx)
      expect(flushIdx).toBeGreaterThan(contentTypeIdx)
      expect(flushIdx).toBeGreaterThan(dispositionIdx)
      expect(vi.mocked(copyTo)).toHaveBeenCalledTimes(1)
      expect(raw.setHeader).toHaveBeenCalledWith('Content-Type', 'text/csv')
      expect(raw.setHeader).toHaveBeenCalledWith(
        'Content-Disposition',
        'attachment; filename="people.csv"',
      )
    })

    it('does not flush response headers when pool.connect fails', async () => {
      mockPoolConnect.mockRejectedValueOnce(new Error('pool exhausted'))

      const { res, raw } = makeRawResponse()

      await expect(
        service.streamPeopleCsv(
          {
            districtId: DISTRICT_UUID,
            filters: { filters: [], filterOperators: {} },
          } as never,
          res,
        ),
      ).rejects.toMatchObject({ status: 500 })

      expect(raw.flushHeaders).not.toHaveBeenCalled()
    })

    it('does not flush response headers when SET statement_timeout fails', async () => {
      mockClientQuery.mockImplementationOnce(() =>
        Promise.reject(new Error('boom')),
      )

      const { res, raw } = makeRawResponse()

      await expect(
        service.streamPeopleCsv(
          {
            districtId: DISTRICT_UUID,
            filters: { filters: [], filterOperators: {} },
          } as never,
          res,
        ),
      ).rejects.toMatchObject({ status: 500 })

      expect(raw.flushHeaders).not.toHaveBeenCalled()
    })

    it('releases the pg client and throws when the SET statement_timeout query fails', async () => {
      mockClientQuery.mockImplementationOnce(() =>
        Promise.reject(new Error('boom')),
      )

      const { res } = makeRawResponse()

      await expect(
        service.streamPeopleCsv(
          {
            districtId: DISTRICT_UUID,
            filters: { filters: [], filterOperators: {} },
          } as never,
          res,
        ),
      ).rejects.toMatchObject({ status: 500 })
      expect(mockRelease).toHaveBeenCalledTimes(1)
    })

    it('releases the pg client and throws 500 when COPY init fails synchronously, before any header flush', async () => {
      // SET statement_timeout succeeds; the COPY query construction throws
      // synchronously. Without the try/catch around `client.query(copyTo)`
      // this would leak a pool client and we would have already flushed
      // response headers by the time the failure surfaced.
      mockClientQuery.mockImplementation((arg: unknown) => {
        if (typeof arg === 'string' && arg.startsWith('SET ')) {
          return Promise.resolve({ rows: [], rowCount: 0 })
        }
        throw new Error('copy init blew up')
      })

      const { res, raw } = makeRawResponse()

      await expect(
        service.streamPeopleCsv(
          {
            districtId: DISTRICT_UUID,
            filters: { filters: [], filterOperators: {} },
          } as never,
          res,
        ),
      ).rejects.toMatchObject({ status: 500 })

      expect(mockRelease).toHaveBeenCalledTimes(1)
      expect(raw.flushHeaders).not.toHaveBeenCalled()
      expect(raw.setHeader).not.toHaveBeenCalledWith(
        'Content-Disposition',
        expect.anything(),
      )
    })
  })

  describe('onApplicationBootstrap', () => {
    it('pre-warms the pg pool by acquiring and releasing a connection', async () => {
      mockPoolConnect.mockClear()
      mockRelease.mockClear()

      service.onApplicationBootstrap()

      // Pre-warm is fire-and-forget; flush microtasks so the .then() runs.
      await new Promise((resolve) => setImmediate(resolve))

      expect(mockPoolConnect).toHaveBeenCalledTimes(1)
      expect(mockRelease).toHaveBeenCalledTimes(1)
    })

    it('swallows pre-warm errors so bootstrap does not crash the app, logging a warning', async () => {
      mockPoolConnect.mockClear()
      mockPoolConnect.mockRejectedValueOnce(new Error('cold pool'))

      // Spy on the Nest Logger prototype so we can assert the swallow was
      // surfaced as a structured warning rather than just silently dropped.
      const warnSpy = vi
        .spyOn(Logger.prototype, 'warn')
        .mockImplementation(() => {})

      // Track unhandledRejection too — if the catch is ever lost, the
      // promise rejection would propagate up and we'd fail loudly.
      const unhandled: unknown[] = []
      const onUnhandled = (err: unknown) => unhandled.push(err)
      process.on('unhandledRejection', onUnhandled)

      try {
        service.onApplicationBootstrap()

        await new Promise((resolve) => setImmediate(resolve))

        expect(mockPoolConnect).toHaveBeenCalledTimes(1)
        expect(warnSpy).toHaveBeenCalledWith(
          expect.objectContaining({ err: expect.any(Error) }),
          'Pre-warm of pg pool failed',
        )
        expect(unhandled).toEqual([])
      } finally {
        process.off('unhandledRejection', onUnhandled)
        warnSpy.mockRestore()
      }
    })
  })

  describe('onModuleDestroy', () => {
    it('closes the pool', async () => {
      mockPoolEnd.mockResolvedValue(undefined)
      await service.onModuleDestroy()
      expect(mockPoolEnd).toHaveBeenCalledTimes(1)
    })
  })
})
