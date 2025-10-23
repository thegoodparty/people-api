import { Prisma } from '@prisma/client'

export type AllowedFilter =
  | 'audienceSuperVoters'
  | 'audienceLikelyVoters'
  | 'audienceUnreliableVoters'
  | 'audienceUnlikelyVoters'
  | 'audienceFirstTimeVoters'
  | 'audienceUnknown'
  | 'partyIndependent'
  | 'partyDemocrat'
  | 'partyRepublican'
  | 'partyUnknown'
  | 'age18_25'
  | 'age25_35'
  | 'age35_50'
  | 'age50Plus'
  | 'ageUnknown'
  | 'genderMale'
  | 'genderFemale'
  | 'genderUnknown'
  | 'registeredVoterUnknown'
  | 'incomeUnknown'
  | 'audienceRequest'
  | 'cellPhoneFormatted'
  | 'landlineFormatted'

export interface BuildWhereOptions {
  state: string
  districtType?: keyof Prisma.VoterWhereInput | undefined
  districtName?: string | undefined
  filters: AllowedFilter[]
  ageIds?: string[]
}

export type GeneralYearKey = `General_${number}`
export type PrimaryYearKey = `Primary_${number}`
export type OtherElectionYearKey = `OtherElection_${number}`
export type PresidentialPrimaryYearKey = `PresidentialPrimary_${number}`
export type AnyElectionYearKey = `AnyElection_${number}`
export type YearSelectKey =
  | GeneralYearKey
  | PrimaryYearKey
  | OtherElectionYearKey
  | PresidentialPrimaryYearKey
  | AnyElectionYearKey

export type PrismaVoterScalarStringKeys = Extract<
  keyof Prisma.VoterWhereInput,
  | 'Homeowner_Probability_Model'
  | 'Business_Owner'
  | 'Estimated_Income_Amount'
  | 'Education_Of_Person'
  | 'Presence_Of_Children'
  | 'Marital_Status'
  | 'Gender'
  | 'Parties_Description'
>

export type PrismaVoterScalarIntKeys = Extract<
  keyof Prisma.VoterWhereInput,
  'Age_Int' | 'Estimated_Income_Amount_Int'
>

export type BucketLabel = string

export interface Bucket {
  label: BucketLabel
  count: number
  percent: number
}

export interface BucketsResult {
  buckets: Bucket[]
}

export interface RawDistributionItem {
  label: string
  count: number
}

export interface BucketsWithRaw extends BucketsResult {
  rawModelBreakdown?: RawDistributionItem[]
}

export type StringMapper<Label extends string> = (
  value: string | null | undefined,
) => Label

export interface StatsCategoryMap {
  age?: BucketsResult
  homeowner?: BucketsWithRaw
  businessOwner?: BucketsWithRaw
  income?: BucketsResult
  education?: BucketsResult
  familyChildren?: BucketsResult
  familyMarital?: BucketsResult
  // Plus dynamic keys for DEMOGRAPHIC_FILTER_FIELDS
  [extra: string]: unknown
}
