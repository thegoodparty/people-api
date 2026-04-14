import http from 'k6/http'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { buildUrl, recordMetrics, buildHeaders } = require('./common.js')

const DISTRICT_SMALL =
  __ENV.DISTRICT_SMALL || 'd79c532c-ee5f-cf01-758f-bd62d4fca41c'
const DISTRICT_LARGE =
  __ENV.DISTRICT_LARGE || '47b7b5fb-5edf-70dc-5448-ef5f545a4793'

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
    districtId: DISTRICT_SMALL,
  })
  const res = http.get(url, { headers: buildHeaders('perf:stats small') })
  recordMetrics(res)
}

export function large() {
  const url = buildUrl('/people/stats', {
    districtId: DISTRICT_LARGE,
  })
  const res = http.get(url, { headers: buildHeaders('perf:stats large') })
  recordMetrics(res)
}
