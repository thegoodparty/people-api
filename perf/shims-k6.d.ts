declare module 'k6/http' {
  export type HttpTimings = { duration: number }
  export type HttpResponse = { timings: HttpTimings; status: number }
  const http: {
    get: (
      url: string,
      params?: { headers?: Record<string, string> },
    ) => HttpResponse
  }
  export default http
}

declare module 'k6/metrics' {
  export class Trend {
    constructor(name: string, isTime?: boolean)
    add(value: number): void
  }
  export class Rate {
    constructor(name: string)
    add(value: boolean | number): void
  }
}

declare module 'k6/execution' {
  export const scenario: {
    iterationInTest: number
    iterationInScenario: number
    name: string
  }
}

// k6 globals for VU and iteration counters
declare const __VU: number
declare const __ITER: number

declare const __ENV: Record<string, string> & { BASE_URL?: string }