import { Prisma } from '@prisma/client'

export type AllowedFilter =
  | 'audience_superVoters'
  | 'audience_likelyVoters'
  | 'audience_unreliableVoters'
  | 'audience_unlikelyVoters'
  | 'audience_firstTimeVoters'
  | 'party_independent'
  | 'party_democrat'
  | 'party_republican'
  | 'age_18_25'
  | 'age_25_35'
  | 'age_35_50'
  | 'age_50_plus'
  | 'gender_male'
  | 'gender_female'
  | 'gender_unknown'
  | 'audience_request'

export interface BuildWhereOptions {
  state: string
  districtType?: keyof Prisma.VoterWhereInput | undefined
  districtName?: string | undefined
  filters: AllowedFilter[]
  ageIds?: string[]
}

export type GeneralYearKey = Extract<
  keyof Prisma.VoterSelect,
  `General_${number}`
>
export type PrimaryYearKey = Extract<
  keyof Prisma.VoterSelect,
  `Primary_${number}`
>
export type OtherElectionYearKey = Extract<
  keyof Prisma.VoterSelect,
  `OtherElection_${number}`
>
export type PresidentialPrimaryYearKey = Extract<
  keyof Prisma.VoterSelect,
  `PresidentialPrimary_${number}`
>
export type AnyElectionYearKey = Extract<
  keyof Prisma.VoterSelect,
  `AnyElection_${number}`
>
export type YearSelectKey =
  | GeneralYearKey
  | PrimaryYearKey
  | OtherElectionYearKey
  | PresidentialPrimaryYearKey
  | AnyElectionYearKey

export type PerformanceFieldKey = Extract<
  keyof Prisma.VoterWhereInput,
  | 'Voters_VotingPerformanceEvenYearGeneral'
  | 'Voters_VotingPerformanceMinorElection'
>
