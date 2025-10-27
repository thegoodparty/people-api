import { faker } from '@faker-js/faker'
import { Voter } from '@prisma/client'
import { generateFactory } from './generate'

// we need to match the seed to the people-api office seed
const states = ['NC']
const electionLocation = 'HENDERSONVILLE CITY'

const US_STATES = states
const residenceCity = electionLocation

const PARTIES = [
  'Democratic',
  'Republican',
  'Independent',
  'Libertarian',
  'Green',
  'No Party Affiliation',
  'Other',
]

const GENDERS = ['M', 'F']

const VOTER_STATUSES = ['Unlikely', 'First Time', 'Likely', 'Super', 'Unknown']

const ETHNIC_GROUPS = [
  'European',
  'Hispanic and Portuguese',
  'East and South Asian',
  'African American',
  'Other',
  'Unknown',
]

const EDUCATION_LEVELS = [
  'High School',
  'Some College',
  'Bachelors Degree',
  'Graduate Degree',
  'Unknown',
]

const INCOME_RANGES = [
  '0-25000',
  '25000-50000',
  '50000-75000',
  '75000-100000',
  '100000-150000',
  '150000+',
  'Unknown',
]

const MARITAL_STATUSES = [
  'Married',
  'Single',
  'Inferred Married',
  'Inferred Single',
  'Unknown',
]

const HOMEOWNER_STATUSES = ['Home Owner', 'Probable Home Owner', 'Renter']

export const voterFactory = generateFactory<Voter>(() => {
  const firstName = faker.person.firstName()
  const middleName = faker.helpers.maybe(() => faker.person.middleName(), {
    probability: 0.6,
  })
  const lastName = faker.person.lastName()
  const state = faker.helpers.arrayElement(US_STATES)
  const birthYear = faker.number.int({ min: 1940, max: 2006 })
  const currentYear = new Date().getFullYear()
  const age = currentYear - birthYear
  const regDate = faker.date.between({
    from: new Date(birthYear + 18, 0, 1),
    to: new Date(),
  })

  const residenceHouseNumber = faker.location.buildingNumber()
  const residenceStreetName = faker.location.street()
  const residenceZip = faker.location.zipCode()
  const residenceLat = faker.location.latitude().toString()
  const residenceLong = faker.location.longitude().toString()

  const useMailingAddress = faker.datatype.boolean({ probability: 0.3 })

  const incomeRange = faker.helpers.arrayElement(INCOME_RANGES)
  let incomeInt: number | null = null
  if (incomeRange !== 'Unknown') {
    const ranges: Record<string, [number, number]> = {
      '0-25000': [0, 25000],
      '25000-50000': [25000, 50000],
      '50000-75000': [50000, 75000],
      '75000-100000': [75000, 100000],
      '100000-150000': [100000, 150000],
      '150000+': [150000, 250000],
    }
    const range = ranges[incomeRange]
    if (range) {
      incomeInt = faker.number.int({ min: range[0], max: range[1] })
    }
  }

  return {
    id: faker.string.uuid(),
    createdAt: new Date(),
    updatedAt: new Date(),
    LALVOTERID: faker.string.alphanumeric({ length: 12, casing: 'upper' }),
    State: state,
    AbsenteeTypes_Description:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement([
          'Military',
          'Long Term',
          'In State',
          'Out of State',
          'Permanent Out of Country',
          'Mail Precinct',
          'Special',
          'Temporary',
          'Permanent U.S.',
          'Federal',
        ]),
      ) || null,
    Active: faker.helpers.arrayElement(['Active', 'Inactive']),
    Age: age.toString(),
    Age_Int: age,
    FirstName: firstName,
    MiddleName: middleName || null,
    LastName: lastName,
    Gender: faker.helpers.arrayElement(GENDERS),

    Business_Owner:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    CalculatedRegDate: regDate,
    CountyEthnic_Description:
      faker.helpers.maybe(() => faker.helpers.arrayElement(ETHNIC_GROUPS)) ||
      null,
    CountyEthnic_LALEthnicCode:
      faker.helpers.maybe(() =>
        faker.string.alphanumeric({ length: 3, casing: 'upper' }),
      ) || null,
    CountyVoterID:
      faker.helpers.maybe(() =>
        faker.string.alphanumeric({ length: 10, casing: 'upper' }),
      ) || null,
    Education_Of_Person:
      faker.helpers.maybe(() => faker.helpers.arrayElement(EDUCATION_LEVELS)) ||
      null,
    Estimated_Income_Amount: incomeRange !== 'Unknown' ? incomeRange : null,
    Estimated_Income_Amount_Int: incomeInt,
    EthnicGroups_EthnicGroup1Desc:
      faker.helpers.maybe(() => faker.helpers.arrayElement(ETHNIC_GROUPS)) ||
      null,
    Ethnic_Description: faker.helpers.arrayElement(ETHNIC_GROUPS),
    Homeowner_Probability_Model:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(HOMEOWNER_STATUSES),
      ) || null,
    Language_Code:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(['eng', 'spa', 'chi', 'fre']),
      ) || null,

    Mailing_Addresses_AddressLine: useMailingAddress
      ? `${faker.location.buildingNumber()} ${faker.location.street()}`
      : null,
    Mailing_Addresses_ApartmentNum: useMailingAddress
      ? faker.helpers.maybe(() => faker.location.secondaryAddress()) || null
      : null,
    Mailing_Addresses_ApartmentType: useMailingAddress
      ? faker.helpers.maybe(() =>
          faker.helpers.arrayElement(['Apt', 'Unit', 'Suite']),
        ) || null
      : null,
    Mailing_Addresses_CassErrStatCode: null,
    Mailing_Addresses_CheckDigit: null,
    Mailing_Addresses_City: useMailingAddress ? faker.location.city() : null,
    Mailing_Addresses_Designator: null,
    Mailing_Addresses_DPBC: null,
    Mailing_Addresses_ExtraAddressLine: null,
    Mailing_Addresses_HouseNumber: useMailingAddress
      ? faker.location.buildingNumber()
      : null,
    Mailing_Addresses_PrefixDirection: null,
    Mailing_Addresses_State: useMailingAddress ? state : null,
    Mailing_Addresses_StreetName: useMailingAddress
      ? faker.location.street()
      : null,
    Mailing_Addresses_SuffixDirection: null,
    Mailing_Addresses_Zip: useMailingAddress ? faker.location.zipCode() : null,
    Mailing_Addresses_ZipPlus4: null,
    Mailing_Families_FamilyID:
      faker.helpers.maybe(
        () => 'M' + faker.string.alphanumeric({ length: 10, casing: 'upper' }),
      ) || null,
    Mailing_HHGender_Description:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement([
          'Cannot Determine',
          'Female Only Household',
          'Male Only Household',
          'Mixed Gender Household',
        ]),
      ) || null,
    Marital_Status:
      faker.helpers.maybe(() => faker.helpers.arrayElement(MARITAL_STATUSES)) ||
      null,
    MovedFrom_Date:
      faker.helpers.maybe(() => faker.date.past({ years: 5 })) || null,
    MovedFrom_Party_Description:
      faker.helpers.maybe(() => faker.helpers.arrayElement(PARTIES)) || null,
    MovedFrom_State:
      faker.helpers.maybe(() => faker.helpers.arrayElement(US_STATES)) || null,
    NameSuffix:
      faker.helpers.maybe(() => faker.person.suffix(), {
        probability: 0.1,
      }) || null,
    OfficialRegDate: regDate.toISOString().split('T')[0],
    Parties_Description: faker.helpers.arrayElement(PARTIES),
    PlaceOfBirth: faker.helpers.maybe(() => faker.location.city()) || null,
    Presence_Of_Children:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(['Yes', 'No', 'Unknown']),
      ) || null,

    Residence_Addresses_AddressLine: `${residenceHouseNumber} ${residenceStreetName}`,
    Residence_Addresses_ApartmentNum:
      faker.helpers.maybe(() => faker.location.secondaryAddress()) || null,
    Residence_Addresses_ApartmentType:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(['Apt', 'Unit', 'Suite']),
      ) || null,
    Residence_Addresses_CassErrStatCode: null,
    Residence_Addresses_CheckDigit: null,
    Residence_Addresses_City: residenceCity,
    Residence_Addresses_Designator: null,
    Residence_Addresses_DPBC: null,
    Residence_Addresses_ExtraAddressLine: null,
    Residence_Addresses_HouseNumber: residenceHouseNumber,
    Residence_Addresses_LatLongAccuracy: faker.helpers.arrayElement([
      'Rooftop',
      'Street',
      'Zipcode',
    ]),
    Residence_Addresses_Latitude: residenceLat,
    Residence_Addresses_Longitude: residenceLong,
    Residence_Addresses_PrefixDirection: null,
    Residence_Addresses_State: state,
    Residence_Addresses_StreetName: residenceStreetName,
    Residence_Addresses_SuffixDirection: null,
    Residence_Addresses_Zip: residenceZip,
    Residence_Addresses_ZipPlus4: null,
    Residence_HHParties_Description:
      faker.helpers.maybe(() => faker.helpers.arrayElement(PARTIES)) || null,
    Registered_Voter: true,
    SequenceOddEven: null,
    SequenceZigZag: null,
    StateVoterID:
      faker.helpers.maybe(() =>
        faker.string.alphanumeric({ length: 12, casing: 'upper' }),
      ) || null,
    Veteran_Status:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    VoterParties_Change_Changed_Party:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Voter_Status: faker.helpers.arrayElement(VOTER_STATUSES),
    Voter_Status_UpdatedAt:
      faker.helpers.maybe(() => faker.date.recent({ days: 90 })) || null,
    VoterTelephones_CellConfidenceCode:
      faker.helpers.maybe(() => faker.number.int({ min: 1, max: 5 })) || null,
    VoterTelephones_CellPhoneFormatted:
      faker.helpers.maybe(() => faker.phone.number({ style: 'national' })) ||
      null,
    VoterTelephones_LandlineConfidenceCode:
      faker.helpers.maybe(() => faker.number.int({ min: 1, max: 5 })) || null,
    VoterTelephones_LandlineFormatted:
      faker.helpers.maybe(() => faker.phone.number({ style: 'national' })) ||
      null,

    AnyElection_2017:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AnyElection_2019:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AnyElection_2021:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AnyElection_2023:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AnyElection_2025:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    General_2016:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    General_2018:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    General_2020:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    General_2022:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    General_2024:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    General_2026: null,
    OtherElection_2016:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    OtherElection_2018:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    OtherElection_2020:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    OtherElection_2022:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    OtherElection_2024:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    OtherElection_2026: null,
    PresidentialPrimary_2016:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    PresidentialPrimary_2020:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    PresidentialPrimary_2024:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Primary_2016:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Primary_2018:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Primary_2020:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Primary_2022:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Primary_2024:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Primary_2026: null,
    VotingPerformanceEvenYearGeneral:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(['0/5', '1/5', '2/5', '3/5', '4/5', '5/5']),
      ) || null,
    VotingPerformanceEvenYearGeneralAndPrimary:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement([
          '0/10',
          '2/10',
          '4/10',
          '6/10',
          '8/10',
          '10/10',
        ]),
      ) || null,
    VotingPerformanceEvenYearPrimary:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(['0/5', '1/5', '2/5', '3/5', '4/5', '5/5']),
      ) || null,
    VotingPerformanceMinorElection:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement(['0/5', '1/5', '2/5', '3/5', '4/5', '5/5']),
      ) || null,

    AddressDistricts_Change_Changed_CD:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AddressDistricts_Change_Changed_County:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AddressDistricts_Change_Changed_HD:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AddressDistricts_Change_Changed_LD:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    AddressDistricts_Change_Changed_SD:
      faker.helpers.maybe(() => faker.datatype.boolean().toString()) || null,
    Airport_District: null,
    Annexation_District: null,
    Aquatic_Center_District: null,
    Aquatic_District: null,
    Assessment_District: null,
    Bay_Area_Rapid_Transit: null,
    Board_of_Education_District: null,
    Board_of_Education_SubDistrict: null,
    Bonds_District: null,
    Borough: null,
    Borough_Ward: null,
    Career_Center: null,
    Cemetery_District: null,
    Central_Committee_District: null,
    Chemical_Control_District: null,
    Committee_Super_District: null,
    City: faker.helpers.maybe(() => residenceCity) || null,
    City_Council_Commissioner_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 15 }).toString(),
      ) || null,
    City_Mayoral_District: null,
    City_School_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 10 }).toString(),
      ) || null,
    City_Ward:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 20 }).toString(),
      ) || null,
    Coast_Water_District: null,
    College_Board_District: null,
    Communications_District: null,
    Community_College_At_Large: null,
    Community_College_Commissioner_District: null,
    Community_College_SubDistrict: null,
    Community_Council_District: null,
    Community_Council_SubDistrict: null,
    Community_Facilities_District: null,
    Community_Facilities_SubDistrict: null,
    Community_Hospital_District: null,
    Community_Planning_Area: null,
    Community_Service_District: null,
    Community_Service_SubDistrict: null,
    Congressional_Township: null,
    Conservation_District: null,
    Conservation_SubDistrict: null,
    Consolidated_Water_District: null,
    Control_Zone_District: null,
    Corrections_District: null,
    County: faker.helpers.maybe(() => faker.location.county()) || null,
    County_Board_of_Education_District: null,
    County_Board_of_Education_SubDistrict: null,
    County_Community_College_District: null,
    County_Commissioner_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 10 }).toString(),
      ) || null,
    County_Fire_District: null,
    County_Hospital_District: null,
    County_Legislative_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 25 }).toString(),
      ) || null,
    County_Library_District: null,
    County_Memorial_District: null,
    County_Paramedic_District: null,
    County_Service_Area: null,
    County_Service_Area_SubDistrict: null,
    County_Sewer_District: null,
    County_Superintendent_of_Schools_District: null,
    County_Supervisorial_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 10 }).toString(),
      ) || null,
    County_Unified_School_District: null,
    County_Water_District: null,
    County_Water_Landowner_District: null,
    County_Water_SubDistrict: null,
    Democratic_Convention_Member: null,
    Democratic_Zone: null,
    Designated_Market_Area_DMA:
      faker.helpers.maybe(() =>
        faker.helpers.arrayElement([
          'New York',
          'Los Angeles',
          'Chicago',
          'Philadelphia',
          'Dallas',
        ]),
      ) || null,
    District_Attorney:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 5 }).toString(),
      ) || null,
    Drainage_District: null,
    Education_Commission_District: null,
    Educational_Service_District: null,
    Educational_Service_Subdistrict: null,
    Election_Commissioner_District: null,
    Elementary_School_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 50 }).toString(),
      ) || null,
    Elementary_School_SubDistrict: null,
    Emergency_Communication_911_District: null,
    Emergency_Communication_911_SubDistrict: null,
    Enterprise_Zone_District: null,
    EXT_District: null,
    Exempted_Village_School_District: null,
    Facilities_Improvement_District: null,
    FIPS:
      faker.helpers.maybe(() => faker.string.numeric({ length: 5 })) || null,
    Fire_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 20 }).toString(),
      ) || null,
    Fire_Maintenance_District: null,
    Fire_Protection_District: null,
    Fire_Protection_SubDistrict: null,
    Fire_Protection_Tax_Measure_District: null,
    Fire_Service_Area_District: null,
    Fire_SubDistrict: null,
    Flood_Control_Zone: null,
    Forest_Preserve: null,
    Garbage_District: null,
    Geological_Hazard_Abatement_District: null,
    Hamlet_Community_Area: null,
    Health_District: null,
    High_School_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 30 }).toString(),
      ) || null,
    High_School_SubDistrict: null,
    Hospital_SubDistrict: null,
    Improvement_Landowner_District: null,
    Independent_Fire_District: null,
    Irrigation_District: null,
    Irrigation_SubDistrict: null,
    Island: null,
    Judicial_Appellate_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 5 }).toString(),
      ) || null,
    Judicial_Circuit_Court_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 20 }).toString(),
      ) || null,
    Judicial_County_Board_of_Review_District: null,
    Judicial_County_Court_District: null,
    Judicial_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 50 }).toString(),
      ) || null,
    Judicial_District_Court_District: null,
    Judicial_Family_Court_District: null,
    Judicial_Jury_District: null,
    Judicial_Juvenile_Court_District: null,
    Judicial_Magistrate_Division: null,
    Judicial_Municipal_Court_District: null,
    Judicial_Sub_Circuit_District: null,
    Judicial_Superior_Court_District: null,
    Judicial_Supreme_Court_District: null,
    Landscaping_and_Lighting_Assessment_District: null,
    Land_Commission: null,
    Law_Enforcement_District: null,
    Learning_Community_Coordinating_Council_District: null,
    Levee_District: null,
    Levee_Reconstruction_Assesment_District: null,
    Library_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 10 }).toString(),
      ) || null,
    Library_Services_District: null,
    Library_SubDistrict: null,
    Lighting_District: null,
    Local_Hospital_District: null,
    Local_Park_District: null,
    Maintenance_District: null,
    Master_Plan_District: null,
    Memorial_District: null,
    Metro_Service_District: null,
    Metro_Service_Subdistrict: null,
    Metro_Transit_District: null,
    Metropolitan_Water_District: null,
    Middle_School_District: null,
    Mosquito_Abatement_District: null,
    Mountain_Water_District: null,
    Multi_township_Assessor: null,
    Municipal_Advisory_Council_District: null,
    Municipal_Utility_District: null,
    Municipal_Utility_SubDistrict: null,
    Municipal_Water_District: null,
    Municipal_Water_SubDistrict: null,
    Museum_District: null,
    Northeast_Soil_and_Water_District: null,
    Open_Space_District: null,
    Open_Space_SubDistrict: null,
    Other: null,
    Paramedic_District: null,
    Park_Commissioner_District: null,
    Park_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 15 }).toString(),
      ) || null,
    Park_SubDistrict: null,
    Planning_Area_District: null,
    Police_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 25 }).toString(),
      ) || null,
    Port_District: null,
    Port_SubDistrict: null,
    Power_District: null,
    Precinct:
      faker.helpers.maybe(() => faker.string.numeric({ length: 4 })) || null,
    Proposed_City: null,
    Proposed_City_Commissioner_District: null,
    Proposed_Community_College: null,
    Proposed_District: null,
    Proposed_Elementary_School_District: null,
    Proposed_Fire_District: null,
    Proposed_Unified_School_District: null,
    Public_Airport_District: null,
    Public_Regulation_Commission: null,
    Public_Service_Commission_District: null,
    Public_Utility_District: null,
    Public_Utility_SubDistrict: null,
    Rapid_Transit_District: null,
    Rapid_Transit_SubDistrict: null,
    Reclamation_District: null,
    Recreation_District: null,
    Recreational_SubDistrict: null,
    Regional_Office_of_Education_District: null,
    Republican_Area: null,
    Republican_Convention_Member: null,
    Resort_Improvement_District: null,
    Resource_Conservation_District: null,
    River_Water_District: null,
    Road_Maintenance_District: null,
    Rural_Service_District: null,
    Sanitary_District: null,
    Sanitary_SubDistrict: null,
    School_Board_District: null,
    School_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 100 }).toString(),
      ) || null,
    School_District_Vocational: null,
    School_Facilities_Improvement_District: null,
    School_Subdistrict: null,
    Service_Area_District: null,
    Sewer_District: null,
    Sewer_Maintenance_District: null,
    Sewer_SubDistrict: null,
    Snow_Removal_District: null,
    Special_Reporting_District: null,
    Special_Tax_District: null,
    State_House_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 150 }).toString(),
      ) || null,
    State_Legislative_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 100 }).toString(),
      ) || null,
    State_Senate_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 60 }).toString(),
      ) || null,
    Storm_Water_District: null,
    Street_Lighting_District: null,
    Superintendent_of_Schools_District: null,
    TV_Translator_District: null,
    Town_Council: null,
    Town_District: null,
    Town_Ward: null,
    Township: faker.helpers.maybe(() => faker.location.county()) || null,
    Township_Ward: null,
    Transit_District: null,
    Transit_SubDistrict: null,
    TriCity_Service_District: null,
    US_Congressional_District:
      faker.helpers.maybe(() =>
        faker.number.int({ min: 1, max: 53 }).toString(),
      ) || null,
    Unified_School_District: null,
    Unified_School_SubDistrict: null,
    Unincorporated_District: null,
    Unincorporated_Park_District: null,
    Unprotected_Fire_District: null,
    Ute_Creek_Soil_District: null,
    Vector_Control_District: null,
    Village: null,
    Village_Ward: null,
    Vote_By_Mail_Area: null,
    Wastewater_District: null,
    Water_Agency: null,
    Water_Agency_SubDistrict: null,
    Water_Conservation_District: null,
    Water_Conservation_SubDistrict: null,
    Water_Control_Water_Conservation: null,
    Water_Control_Water_Conservation_SubDistrict: null,
    Water_District: null,
    Water_Public_Utility_District: null,
    Water_Public_Utility_Subdistrict: null,
    Water_Replacement_District: null,
    Water_Replacement_SubDistrict: null,
    Water_SubDistrict: null,
    Weed_District: null,
  }
})
