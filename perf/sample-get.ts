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
  const url = buildUrl('/people/sample')
  const body = JSON.stringify({
    state: 'FL',
    districtType: 'City',
    districtName: 'NICEVILLE CITY (EST.)',
    size: 1000,
  })
  const res = http.post(url, body, {
    headers: { ...buildHeaders('perf:sample small'), 'Content-Type': 'application/json' },
  })
  recordMetrics(res)
}

export function large() {
  const url = buildUrl('/people/sample')
  const body = JSON.stringify({
    state: 'FL',
    districtType: 'City',
    districtName: 'JACKSONVILLE CITY (EST.)',
    size: 1000,
  })
  const res = http.post(url, body, {
    headers: { ...buildHeaders('perf:sample large'), 'Content-Type': 'application/json' },
  })
  recordMetrics(res)
}
