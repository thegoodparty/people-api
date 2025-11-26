import { Trend } from 'k6/metrics'
import { scenario } from 'k6/execution'

export const BASE_URL: string = __ENV.BASE_URL || 'http://localhost:3002/v1'
export const cold_first_hit = new Trend('cold_first_hit')

type ParamValue = string | number | boolean | Array<string | number | boolean>
type QueryParams = Record<string, ParamValue>

export function buildUrl(path: string, params?: QueryParams): string {
  const entries = Object.entries(params || {})
  const parts: string[] = []
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

export function recordColdFirstHit(res: { timings: { duration: number } }) {
  if (scenario.iterationInTest === 0) {
    cold_first_hit.add(res.timings.duration)
  }
}
