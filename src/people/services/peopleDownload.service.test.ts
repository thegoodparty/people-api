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

const makeRawResponse = () => {
  const raw = new PassThrough() as unknown as PassThrough & {
    statusCode?: number
    headersSent?: boolean
  }
  raw.headersSent = false
  return { raw } as unknown as Parameters<
    PeopleDownloadService['streamPeopleCsv']
  >[1]
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
    mockClientQuery.mockReturnValue(copyStream)
    setupClient()

    service = new PeopleDownloadService(districtServiceMock as never)
  })

  afterEach(() => {
    if (!copyStream.destroyed) copyStream.destroy()
  })

  describe('streamPeopleCsv', () => {
    it('builds COPY SQL with the voter join, where clause, and election constants', async () => {
      const { to: copyTo } = await import('pg-copy-streams')

      const res = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: DISTRICT_UUID,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      ;(res as never as { raw: PassThrough }).raw.destroy()

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

      const res = makeRawResponse()
      const completion = service.streamPeopleCsv(
        {
          districtId: stateDistrict.id,
          filters: { filters: [], filterOperators: {} },
        } as never,
        res,
      )

      copyStream.end()
      ;(res as never as { raw: PassThrough }).raw.destroy()

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

      const res = makeRawResponse()
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
      ;(res as never as { raw: PassThrough }).raw.destroy()

      await completion

      const sql = vi.mocked(copyTo).mock.calls[0][0] as string
      expect(sql).toContain(
        'v."VoterTelephones_CellPhoneFormatted" IS NOT NULL',
      )
      expect(sql).toContain('v."Age_Int" >= 30')
      expect(sql).toContain('v."Age_Int" <= 50')
    })

    it('pipes COPY stream output into res.raw', async () => {
      const res = makeRawResponse()
      const raw = (res as never as { raw: PassThrough }).raw
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
      const res = makeRawResponse()
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
      const res = makeRawResponse()
      const raw = (res as never as { raw: PassThrough }).raw
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
      const res = makeRawResponse()
      const raw = (res as never as { raw: PassThrough }).raw
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

      const res = makeRawResponse()

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
  })

  describe('onModuleDestroy', () => {
    it('closes the pool', async () => {
      mockPoolEnd.mockResolvedValue(undefined)
      await service.onModuleDestroy()
      expect(mockPoolEnd).toHaveBeenCalledTimes(1)
    })
  })
})
