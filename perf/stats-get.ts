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
    ? { scenarios: { small: { ...baseScenarios.small, startTime: '0s' } } }
    : (__ENV && __ENV.ONLY) === 'large'
      ? { scenarios: { large: { ...baseScenarios.large, startTime: '0s' } } }
      : { scenarios: baseScenarios }

export function small() {
  const url = buildUrl('/people/stats', {
    state: 'WI',
    districtType: 'City',
    districtName: 'ONALASKA CITY',
  })
  const res = http.get(url, { headers: buildHeaders('perf:stats small') })
  recordMetrics(res)
}

export function large() {
  const url = buildUrl('/people/stats', {
    state: 'WI',
    districtType: 'City',
    districtName: 'MILWAUKEE CITY',
  })
  const res = http.get(url, { headers: buildHeaders('perf:stats large') })
  recordMetrics(res)
}
