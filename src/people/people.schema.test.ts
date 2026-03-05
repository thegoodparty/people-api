import { describe, expect, it } from 'vitest'
import {
  downloadPeopleSchema,
  getPersonQuerySchema,
  listPeopleSchema,
  samplePeopleSchema,
  STATE_DISTRICT_TYPE,
  StatsDTO,
} from './people.schema'

const DISTRICT_ID = '0e5bafca-93a9-86a5-2522-f373979720df'

describe('people query schemas', () => {
  it('accepts districtId-only list query', () => {
    const parsed = listPeopleSchema.parse({
      districtId: DISTRICT_ID,
      filters: {},
    })

    expect(parsed.districtId).toBe(DISTRICT_ID)
    expect(parsed.state).toBeUndefined()
    expect(parsed.districtType).toBeUndefined()
    expect(parsed.districtName).toBeUndefined()
  })

  it('accepts state + districtType + districtName list query', () => {
    const parsed = listPeopleSchema.parse({
      state: 'wy',
      districtType: 'City_Ward',
      districtName: 'CHEYENNE CITY WARD 1',
      filters: {},
    })

    expect(parsed.state).toBe('WY')
    expect(parsed.districtType).toBe('City_Ward')
    expect(parsed.districtName).toBe('CHEYENNE CITY WARD 1')
  })

  it('normalizes state-only list query to statewide district', () => {
    const parsed = listPeopleSchema.parse({
      state: 'wy',
      filters: {},
    })

    expect(parsed.state).toBe('WY')
    expect(parsed.districtType).toBe(STATE_DISTRICT_TYPE)
    expect(parsed.districtName).toBe('WY')
  })

  it('rejects mixed districtId + districtType/name list query', () => {
    expect(() =>
      listPeopleSchema.parse({
        districtId: DISTRICT_ID,
        districtType: 'City_Ward',
        districtName: 'CHEYENNE CITY WARD 1',
        filters: {},
      }),
    ).toThrow(
      'Either districtId only, or state + districtType + districtName, or state only',
    )
  })

  it('rejects statewide district with mismatched districtName', () => {
    expect(() =>
      listPeopleSchema.parse({
        state: 'WY',
        districtType: STATE_DISTRICT_TYPE,
        districtName: 'CO',
        filters: {},
      }),
    ).toThrow('When districtType is State, districtName must equal state')
  })

  it('accepts districtId-only stats query', () => {
    const parsed = StatsDTO.create({ districtId: DISTRICT_ID })
    expect(parsed.districtId).toBe(DISTRICT_ID)
    expect(parsed.state).toBeUndefined()
  })

  it('accepts districtId-only sample query', () => {
    const parsed = samplePeopleSchema.parse({
      districtId: DISTRICT_ID,
      size: 25,
    })
    expect(parsed.districtId).toBe(DISTRICT_ID)
    expect(parsed.size).toBe(25)
  })

  it('accepts districtId-only download query', () => {
    const parsed = downloadPeopleSchema.parse({
      districtId: DISTRICT_ID,
      filters: {},
    })
    expect(parsed.districtId).toBe(DISTRICT_ID)
    expect(parsed.state).toBeUndefined()
  })

  it('accepts districtId-only getPerson query', () => {
    const parsed = getPersonQuerySchema.parse({
      districtId: DISTRICT_ID,
    })
    expect(parsed.districtId).toBe(DISTRICT_ID)
    expect(parsed.state).toBeUndefined()
  })
})
