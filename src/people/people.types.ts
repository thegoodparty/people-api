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
  | 'incomeUnknown'
  | 'audienceRequest'
  | 'cellPhoneFormatted'
  | 'landlineFormatted'

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
