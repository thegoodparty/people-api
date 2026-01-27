import {
  mapGender,
  mapMaritalStatus,
  mapPresenceOfChildren,
  mapHomeowner,
  mapEducation,
  mapEthnicity,
  mapBusinessOwner,
  mapVeteranStatus,
  mapPoliticalParty,
  mapLanguage,
} from './mapToExpectedValues.utils'

type RawPerson = {
  id?: string | number | boolean | null | undefined
  FirstName?: string | number | boolean | null | undefined
  LastName?: string | number | boolean | null | undefined
  Gender?: string | number | boolean | null | undefined
  Age?: string | number | boolean | null | undefined
  Age_Int?: number | string | boolean | null | undefined
  Parties_Description?: string | number | boolean | null | undefined
  Voter_Status?: string | number | boolean | null | undefined
  Residence_Addresses_AddressLine?: string | number | boolean | null | undefined
  Residence_Addresses_City?: string | number | boolean | null | undefined
  Residence_Addresses_State?: string | number | boolean | null | undefined
  Residence_Addresses_Zip?: string | number | boolean | null | undefined
  Residence_Addresses_ZipPlus4?: string | number | boolean | null | undefined
  Residence_Addresses_ExtraAddressLine?:
    | string
    | number
    | boolean
    | null
    | undefined
  VoterTelephones_CellPhoneFormatted?:
    | string
    | number
    | boolean
    | null
    | undefined
  VoterTelephones_LandlineFormatted?:
    | string
    | number
    | boolean
    | null
    | undefined
  Marital_Status?: string | number | boolean | null | undefined
  Presence_Of_Children?: string | number | boolean | null | undefined
  Veteran_Status?: string | number | boolean | null | undefined
  Homeowner_Probability_Model?: string | number | boolean | null | undefined
  Business_Owner?: string | number | boolean | null | undefined
  Education_Of_Person?: string | number | boolean | null | undefined
  EthnicGroups_EthnicGroup1Desc?: string | number | boolean | null | undefined
  Language_Code?: string | number | boolean | null | undefined
  Estimated_Income_Amount?: string | number | boolean | null | undefined
  Residence_Addresses_Latitude?: string | number | boolean | null | undefined
  Residence_Addresses_Longitude?: string | number | boolean | null | undefined
  LALVOTERID?: string | number | boolean | null | undefined
  State?: string | number | boolean | null | undefined
  MiddleName?: string | number | boolean | null | undefined
  NameSuffix?: string | number | boolean | null | undefined
  County?: string | number | boolean | null | undefined
  City?: string | number | boolean | null | undefined
  Precinct?: string | number | boolean | null | undefined
  [key: string]: unknown
}

export type PersonOutputFormat = {
  id?: string
  firstName: string
  lastName: string
  gender: 'Male' | 'Female' | 'Unknown'
  age: number | 'Unknown'
  politicalParty: 'Independent' | 'Democratic' | 'Republican' | 'Unknown'
  registeredVoter: 'Yes' | 'No' | 'Unknown'
  activeVoter: 'Unknown'
  voterStatus: string
  address: string
  cellPhone: string
  landline: string
  maritalStatus:
    | 'Likely Married'
    | 'Likely Single'
    | 'Married'
    | 'Single'
    | 'Unknown'
  hasChildrenUnder18: 'Yes' | 'No' | 'Unknown'
  veteranStatus: 'Yes' | 'Unknown'
  homeowner: 'Yes' | 'Likely' | 'No' | 'Unknown'
  businessOwner: 'Yes' | 'Unknown'
  levelOfEducation:
    | 'None'
    | 'High School Diploma'
    | 'Technical School'
    | 'Some College'
    | 'College Degree'
    | 'Graduate Degree'
    | 'Unknown'
  ethnicityGroup:
    | 'Asian'
    | 'European'
    | 'Hispanic'
    | 'African American'
    | 'Other'
    | 'Unknown'
  language: 'English' | 'Spanish' | 'Other'
  estimatedIncomeRange: string
  lat: string | null
  lng: string | null
  lalVoterId?: string | null
  state?: string | null
  middleName?: string | null
  nameSuffix?: string | null
  residenceAddressesExtraAddressLine?: string | null
  voterTelephonesLandlineFormatted?: string | null
  county?: string | null
  city?: string | null
  precinct?: string | null
}

export function transformToPersonOutput(
  person:
    | RawPerson
    | Record<string, string | number | boolean | null | undefined>,
): PersonOutputFormat {
  const firstName = String(person.FirstName || '')
  const lastName = String(person.LastName || '')
  const gender = mapGender(String(person.Gender || ''))
  const age =
    typeof person.Age_Int === 'number' && Number.isFinite(person.Age_Int)
      ? person.Age_Int
      : person.Age && Number.isFinite(parseInt(String(person.Age), 10))
        ? parseInt(String(person.Age), 10)
        : 'Unknown'
  const politicalParty = mapPoliticalParty(
    String(person.Parties_Description || ''),
  )
  const registeredVoter = 'Unknown'
  const activeVoter = 'Unknown'
  const voterStatus =
    person.Voter_Status && typeof person.Voter_Status === 'string'
      ? person.Voter_Status
      : 'Unknown'
  const zipPlus4 =
    person.Residence_Addresses_ZipPlus4 &&
    typeof person.Residence_Addresses_ZipPlus4 === 'string'
      ? `-${person.Residence_Addresses_ZipPlus4}`
      : ''
  const addressParts = [
    person.Residence_Addresses_AddressLine &&
    typeof person.Residence_Addresses_AddressLine === 'string'
      ? person.Residence_Addresses_AddressLine
      : null,
    [
      person.Residence_Addresses_City &&
      typeof person.Residence_Addresses_City === 'string'
        ? person.Residence_Addresses_City
        : null,
      person.Residence_Addresses_State &&
      typeof person.Residence_Addresses_State === 'string'
        ? person.Residence_Addresses_State
        : null,
    ]
      .filter((v) => Boolean(v))
      .join(', '),
    [
      person.Residence_Addresses_Zip &&
      typeof person.Residence_Addresses_Zip === 'string'
        ? person.Residence_Addresses_Zip
        : null,
      zipPlus4,
    ]
      .filter((v) => Boolean(v))
      .join(''),
  ].filter((v) => Boolean(v))
  const address = addressParts.length ? addressParts.join(', ') : 'Unknown'
  const cellPhone =
    person.VoterTelephones_CellPhoneFormatted &&
    typeof person.VoterTelephones_CellPhoneFormatted === 'string'
      ? person.VoterTelephones_CellPhoneFormatted
      : 'Unknown'
  const landline =
    person.VoterTelephones_LandlineFormatted &&
    typeof person.VoterTelephones_LandlineFormatted === 'string'
      ? person.VoterTelephones_LandlineFormatted
      : 'Unknown'
  const maritalStatus = mapMaritalStatus(String(person.Marital_Status || ''))
  const hasChildrenUnder18 = mapPresenceOfChildren(
    String(person.Presence_Of_Children || ''),
  )
  const veteranStatus = mapVeteranStatus(String(person.Veteran_Status || ''))
  const homeowner = mapHomeowner(
    String(person.Homeowner_Probability_Model || ''),
  )
  const businessOwner = mapBusinessOwner(String(person.Business_Owner || ''))
  const levelOfEducation = mapEducation(
    String(person.Education_Of_Person || ''),
  )
  const ethnicityGroup = mapEthnicity(
    String(person.EthnicGroups_EthnicGroup1Desc || ''),
  )
  const language = mapLanguage(String(person.Language_Code || ''))
  const estimatedIncomeRange =
    person.Estimated_Income_Amount &&
    typeof person.Estimated_Income_Amount === 'string'
      ? person.Estimated_Income_Amount
      : 'Unknown'
  const lat =
    person.Residence_Addresses_Latitude &&
    typeof person.Residence_Addresses_Latitude === 'string'
      ? person.Residence_Addresses_Latitude
      : null
  const lng =
    person.Residence_Addresses_Longitude &&
    typeof person.Residence_Addresses_Longitude === 'string'
      ? person.Residence_Addresses_Longitude
      : null

  return {
    id: person.id ? String(person.id) : undefined,
    firstName,
    lastName,
    gender,
    age,
    politicalParty,
    registeredVoter,
    activeVoter,
    voterStatus,
    address,
    cellPhone,
    landline,
    maritalStatus,
    hasChildrenUnder18,
    veteranStatus,
    homeowner,
    businessOwner,
    levelOfEducation,
    ethnicityGroup,
    language,
    estimatedIncomeRange,
    lat,
    lng,
    lalVoterId: person.LALVOTERID ? String(person.LALVOTERID) : null,
    state: person.State ? String(person.State) : null,
    middleName: person.MiddleName ? String(person.MiddleName) : null,
    nameSuffix: person.NameSuffix ? String(person.NameSuffix) : null,
    residenceAddressesExtraAddressLine:
      person.Residence_Addresses_ExtraAddressLine
        ? String(person.Residence_Addresses_ExtraAddressLine)
        : null,
    voterTelephonesLandlineFormatted: person.VoterTelephones_LandlineFormatted
      ? String(person.VoterTelephones_LandlineFormatted)
      : null,
    county: person.County ? String(person.County) : null,
    city: person.City ? String(person.City) : null,
    precinct: person.Precinct ? String(person.Precinct) : null,
  }
}

export function transformToPersonOutputArray(
  people:
    | RawPerson[]
    | Array<Record<string, string | number | boolean | null | undefined>>,
): PersonOutputFormat[] {
  return people.map(transformToPersonOutput)
}
