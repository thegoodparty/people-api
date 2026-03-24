import http from 'k6/http'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { buildUrl, recordMetrics, buildHeaders } = require('./common.js')

// Replace these with real district UUIDs from your database
const DISTRICT_SMALL = __ENV.DISTRICT_SMALL || 'REPLACE_WITH_SMALL_DISTRICT_ID'
const DISTRICT_LARGE = __ENV.DISTRICT_LARGE || 'REPLACE_WITH_LARGE_DISTRICT_ID'

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
  const url = buildUrl('/people/sample')
  const body = JSON.stringify({
    districtId: DISTRICT_SMALL,
    size: 1000,
  })
  const res = http.post(url, body, {
    headers: {
      ...buildHeaders('perf:sample small'),
      'Content-Type': 'application/json',
    },
  })
  recordMetrics(res)
}

export function large() {
  const url = buildUrl('/people/sample')
  const body = JSON.stringify({
    districtId: DISTRICT_LARGE,
    size: 1000,
  })
  const res = http.post(url, body, {
    headers: {
      ...buildHeaders('perf:sample large'),
      'Content-Type': 'application/json',
    },
  })
  recordMetrics(res)
}
