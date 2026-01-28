export type GenderExpected = 'Male' | 'Female' | 'Unknown'
export type MaritalStatusExpected =
  | 'Likely Married'
  | 'Likely Single'
  | 'Married'
  | 'Single'
  | 'Unknown'
export type PresenceOfChildrenExpected = 'Yes' | 'No' | 'Unknown'
export type HomeownerExpected = 'Yes' | 'Likely' | 'No' | 'Unknown'
export type EducationExpected =
  | 'None'
  | 'High School Diploma'
  | 'Technical School'
  | 'Some College'
  | 'College Degree'
  | 'Graduate Degree'
  | 'Unknown'
export type EthnicityExpected =
  | 'Asian'
  | 'European'
  | 'Hispanic'
  | 'African American'
  | 'Other'
  | 'Unknown'
export type BusinessOwnerExpected = 'Yes' | 'Unknown'
export type VeteranStatusExpected = 'Yes' | 'Unknown'
export type RegisteredVoterExpected = 'Yes' | 'No' | 'Unknown'
export type PoliticalPartyExpected =
  | 'Independent'
  | 'Democratic'
  | 'Republican'
  | 'Unknown'
export type LanguageExpected = 'English' | 'Spanish' | 'Other'

export const mapGender = (value: string | null | undefined): GenderExpected => {
  if (!value) return 'Unknown'
  if (value === 'M') return 'Male'
  if (value === 'F') return 'Female'
  return 'Unknown'
}

export const mapMaritalStatus = (
  value: string | null | undefined,
): MaritalStatusExpected => {
  if (!value) return 'Unknown'
  const v = value.toLowerCase()
  if (v.includes('inferred married')) return 'Likely Married'
  if (v.includes('inferred single')) return 'Likely Single'
  if (v === 'married') return 'Married'
  if (v === 'single') return 'Single'
  return 'Unknown'
}

export const mapPresenceOfChildren = (
  value: string | null | undefined,
): PresenceOfChildrenExpected => {
  if (!value) return 'Unknown'
  const v = value.toLowerCase()
  if (v === 'y' || v === 'yes') return 'Yes'
  if (v === 'n' || v === 'no') return 'No'
  return 'Unknown'
}

export const mapHomeowner = (
  value: string | null | undefined,
): HomeownerExpected => {
  if (!value) return 'Unknown'
  const v = value.toLowerCase()
  if (v === 'home owner') return 'Yes'
  if (v === 'probable home owner') return 'Likely'
  if (v === 'renter') return 'No'
  return 'Unknown'
}

export const mapEducation = (
  value: string | null | undefined,
): EducationExpected => {
  if (!value) return 'Unknown'
  const v = value.toLowerCase()
  if (v === 'did not complete high school likely') return 'None'
  if (v === 'completed high school likely') return 'High School Diploma'
  if (v === 'attended vocational/technical school likely')
    return 'Technical School'
  if (v === 'attended but did not complete college likely')
    return 'Some College'
  if (v === 'completed college likely') return 'College Degree'
  if (v === 'completed graduate school likely') return 'Graduate Degree'
  return 'Unknown'
}

export const mapEthnicity = (
  value: string | null | undefined,
): EthnicityExpected => {
  if (!value) return 'Unknown'
  const v = value.toLowerCase()
  if (v === 'east and south asian') return 'Asian'
  if (v === 'european') return 'European'
  if (v === 'hispanic and portuguese') return 'Hispanic'
  if (v === 'likely african-american') return 'African American'
  if (v === 'other') return 'Other'
  return 'Unknown'
}

export const mapBusinessOwner = (
  value: string | null | undefined,
): BusinessOwnerExpected => {
  if (!value) return 'Unknown'
  return 'Yes'
}

export const mapVeteranStatus = (
  value: string | null | undefined,
): VeteranStatusExpected => {
  if (!value) return 'Unknown'
  if (value === 'Yes') return 'Yes'
  return 'Unknown'
}

export const mapRegisteredVoter = (
  value: boolean | null | undefined,
): RegisteredVoterExpected => {
  if (value === true) return 'Yes'
  if (value === false) return 'No'
  return 'Unknown'
}

export const mapPoliticalParty = (
  value: string | null | undefined,
): PoliticalPartyExpected => {
  if (!value) return 'Unknown'
  const v = value.toLowerCase()
  if (v.includes('democratic') || v.includes('democrat')) return 'Democratic'
  if (v.includes('republican')) return 'Republican'
  if (
    v.includes('independent') ||
    v.includes('declined to state') ||
    v.includes('non-partisan')
  )
    return 'Independent'
  return 'Unknown'
}

export const mapLanguage = (
  value: string | null | undefined,
): LanguageExpected => {
  if (!value) return 'Other'
  const v = value.toLowerCase()
  if (v === 'english') return 'English'
  if (v === 'spanish') return 'Spanish'
  return 'Other'
}
