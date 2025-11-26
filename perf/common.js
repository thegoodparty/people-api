import { Trend } from 'k6/metrics'
import { scenario } from 'k6/execution'

export const BASE_URL = __ENV.BASE_URL || 'http://localhost:3002/v1'
export const cold_first_hit = new Trend('cold_first_hit')

export function buildUrl(path, params) {
  const entries = Object.entries(params || {})
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
  if (scenario.iterationInTest === 0) {
    cold_first_hit.add(res.timings.duration)
  }
}
