import http from 'k6/http'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { buildUrl, recordMetrics, buildHeaders } = require('./common.js')

const baseScenarios = {
  small: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'small' },
  large: {
    executor: 'constant-vus',
    vus: 3,
    duration: '30s',
    startTime: '35s',
    exec: 'large',
  },
} as const

export const options =
  (__ENV && __ENV.ONLY) === 'small'
    ? { scenarios: { small: baseScenarios.small } }
    : (__ENV && __ENV.ONLY) === 'large'
      ? { scenarios: { large: baseScenarios.large } }
      : { scenarios: baseScenarios }

export function small() {
  const url = buildUrl('/people', {
    state: 'WY',
    districtType: 'County_Commissioner_District',
    districtName: 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)',
    'filter[gender][is]': 'not_null',
    'filter[educationOfPerson][is]': 'not_null',
  })
  const res = http.get(url, { headers: buildHeaders('perf:people small') })
  recordMetrics(res)
}

export function large() {
  const url = buildUrl('/people', {
    state: 'TX',
    districtType: 'City',
    districtName: 'DALLAS CITY (EST.)',
    'filter[gender][is]': 'not_null',
    'filter[educationOfPerson][is]': 'not_null',
  })
  const res = http.get(url, { headers: buildHeaders('perf:people large') })
  recordMetrics(res)
}
