import http from 'k6/http'
import { buildUrl, recordColdFirstHit } from './common.js'

export const options = {
  scenarios: {
    small: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'small' },
    large: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'large' },
  },
}

export function small() {
  const url = buildUrl('/people', {
    state: 'WY',
    districtType: 'County_Commissioner_District',
    districtName: 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)',
    'filter[gender][is]': 'not_null',
    'filter[educationOfPerson][is]': 'not_null',
  })
  const res = http.get(url)
  recordColdFirstHit(res)
}

export function large() {
  const url = buildUrl('/people', {
    state: 'TX',
    districtType: 'City',
    districtName: 'DALLAS CITY (EST.)',
    'filter[gender][is]': 'not_null',
    'filter[educationOfPerson][is]': 'not_null',
  })
  const res = http.get(url)
  recordColdFirstHit(res)
}
