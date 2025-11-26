import http from 'k6/http'
import { buildUrl, recordColdFirstHit } from './common'

export const options = {
  scenarios: {
    small: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'small' },
    large: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'large' },
  },
}

export function small() {
  const url = buildUrl('/people/sample', {
    state: 'FL',
    districtType: 'City',
    districtName: 'NICEVILLE CITY (EST.)',
    size: 1000,
  })
  const res = http.get(url)
  recordColdFirstHit(res)
}

export function large() {
  const url = buildUrl('/people/sample', {
    state: 'FL',
    districtType: 'City',
    districtName: 'JACKSONVILLE CITY (EST.)',
    size: 1000,
  })
  const res = http.get(url)
  recordColdFirstHit(res)
}
