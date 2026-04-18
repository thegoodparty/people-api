import { describe, expect, it } from 'vitest'
import {
  downloadPeopleSchema,
  getPersonQuerySchema,
  listPeopleSchema,
  samplePeopleSchema,
  StatsDTO,
} from './people.schema'

const DISTRICT_ID = '0e5bafca-93a9-86a5-2522-f373979720df'

describe('people query schemas', () => {
  it('accepts districtId list query', () => {
    const parsed = listPeopleSchema.parse({
      districtId: DISTRICT_ID,
      filters: {},
    })

    expect(parsed.districtId).toBe(DISTRICT_ID)
  })

  it('rejects missing districtId', () => {
    expect(() =>
      listPeopleSchema.parse({
        filters: {},
      }),
    ).toThrow()
  })

  it('rejects invalid districtId format', () => {
    expect(() =>
      listPeopleSchema.parse({
        districtId: 'not-a-uuid',
        filters: {},
      }),
    ).toThrow()
  })

  it('accepts districtId stats query', () => {
    const parsed = StatsDTO.create({ districtId: DISTRICT_ID })
    expect(parsed.districtId).toBe(DISTRICT_ID)
  })

  it('accepts districtId sample query', () => {
    const parsed = samplePeopleSchema.parse({
      districtId: DISTRICT_ID,
      size: 25,
    })
    expect(parsed.districtId).toBe(DISTRICT_ID)
    expect(parsed.size).toBe(25)
  })

  it('accepts districtId download query', () => {
    const parsed = downloadPeopleSchema.parse({
      districtId: DISTRICT_ID,
      filters: {},
    })
    expect(parsed.districtId).toBe(DISTRICT_ID)
  })

  it('accepts districtId getPerson query', () => {
    const parsed = getPersonQuerySchema.parse({
      districtId: DISTRICT_ID,
    })
    expect(parsed.districtId).toBe(DISTRICT_ID)
  })
})
