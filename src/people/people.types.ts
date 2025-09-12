import { Prisma } from '@prisma/client'

export type AllowedFilter =
  | 'audienceSuperVoters'
  | 'audienceLikelyVoters'
  | 'audienceUnreliableVoters'
  | 'audienceUnlikelyVoters'
  | 'audienceFirstTimeVoters'
  | 'partyIndependent'
  | 'partyDemocrat'
  | 'partyRepublican'
  | 'age18_25'
  | 'age25_35'
  | 'age35_50'
  | 'age50Plus'
  | 'genderMale'
  | 'genderFemale'
  | 'genderUnknown'
  | 'audienceRequest'

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

export type PerformanceFieldKey = Extract<
  keyof Prisma.VoterWhereInput,
  'VotingPerformanceEvenYearGeneral' | 'VotingPerformanceMinorElection'
>
