import { Trend, Rate } from 'k6/metrics'
import { scenario } from 'k6/execution'

export const BASE_URL = (__ENV && __ENV.BASE_URL) || 'http://localhost:3002/v1'
export const duration_small = new Trend('duration_small', true)
export const duration_large = new Trend('duration_large', true)
export const cold_first_hit_small = new Trend('cold_first_hit_small', true)
export const cold_first_hit_large = new Trend('cold_first_hit_large', true)
export const error_rate_small = new Rate('error_rate_small')
export const error_rate_large = new Rate('error_rate_large')

export function buildUrl(path, params = {}) {
  const entries = Object.entries(params)
  const parts = []
  for (const [key, value] of entries) {
    if (value === undefined || value === null) continue
    if (Array.isArray(value)) {
      for (const v of value) {
        parts.push(
          `${encodeURIComponent(key)}=${encodeURIComponent(String(v))}`,
        )
      }
    } else {
      parts.push(
        `${encodeURIComponent(key)}=${encodeURIComponent(String(value))}`,
      )
    }
  }
  const q = parts.join('&')
  return q ? `${BASE_URL}${path}?${q}` : `${BASE_URL}${path}`
}

export function recordColdFirstHit(res) {
  const name = (scenario && scenario.name) || ''
  const isFirst =
    typeof __VU === 'number' && typeof __ITER === 'number'
      ? __VU === 1 && __ITER === 0
      : (scenario &&
          typeof scenario.iterationInScenario === 'number' &&
          scenario.iterationInScenario === 0)
  if (!isFirst) return
  if (name === 'small') {
    cold_first_hit_small.add(res.timings.duration)
  } else if (name === 'large') {
    cold_first_hit_large.add(res.timings.duration)
  }
}

export function recordMetrics(res) {
  recordColdFirstHit(res)
  const failed = res.status === 0 || res.status >= 400
  const name = (scenario && scenario.name) || ''
  if (name === 'small') {
    duration_small.add(res.timings.duration)
    error_rate_small.add(failed ? 1 : 0)
  } else if (name === 'large') {
    duration_large.add(res.timings.duration)
    error_rate_large.add(failed ? 1 : 0)
  }
}

export function buildHeaders(title) {
  return {
    'x-perf-scenario': title,
  }
}


