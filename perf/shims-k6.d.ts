declare module 'k6/http' {
  export type HttpTimings = { duration: number }
  export type HttpResponse = { timings: HttpTimings }
  const http: {
    get: (url: string) => HttpResponse
  }
  export default http
}

declare module 'k6/metrics' {
  export class Trend {
    constructor(name: string)
    add(value: number): void
  }
}

declare module 'k6/execution' {
  export const scenario: { iterationInTest: number }
}
