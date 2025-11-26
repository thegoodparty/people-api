import http from 'k6/http'
import { buildUrl, recordColdFirstHit } from './common.js'

export const options = {
  scenarios: {
    small: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'small' },
    large: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'large' },
  },
}

export function small() {
  const url = buildUrl('/people/stats', {
    state: 'WI',
    districtType: 'City',
    districtName: 'ONALASKA CITY',
  })
  const res = http.get(url)
  recordColdFirstHit(res)
}

export function large() {
  const url = buildUrl('/people/stats', {
    state: 'WI',
    districtType: 'City',
    districtName: 'MILWAUKEE CITY',
  })
  const res = http.get(url)
  recordColdFirstHit(res)
}
