export type DistrictStatsBucket = {
  label: string
  count: number
  percent: number
}

export type DistrictStatSummary = {
  buckets: DistrictStatsBucket[]
}

declare global {
  namespace PrismaJson {
    export type DistrictStatsBucketSummary = {
      age: DistrictStatSummary
      homeowner: DistrictStatSummary
      education: DistrictStatSummary
      presenceOfChildren: DistrictStatSummary
      estimatedIncomeRange: DistrictStatSummary
    }
  }
}

export {}
