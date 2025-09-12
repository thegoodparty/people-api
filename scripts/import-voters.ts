/* eslint-disable no-console */
import 'dotenv/config'
import { createReadStream } from 'fs'
import { basename, resolve } from 'path'
import { PrismaClient, Prisma } from '@prisma/client'
import { parse } from 'csv-parse'
import { randomUUID } from 'crypto'

// Map CSV keys to Prisma Voter fields. Keys in CSV are mostly identical, with some prefixed labels.
// We normalize a subset we need to successfully insert minimally valid rows.
const CSV_TO_DB_FIELD: Record<string, keyof Prisma.VoterUncheckedCreateInput> = {
  LALVOTERID: 'LALVOTERID',
  Voters_StateVoterID: 'StateVoterID',
  Voters_CountyVoterID: 'CountyVoterID',
  Voters_Active: 'Active',
  VoterTelephones_LandlineFormatted: 'VoterTelephones_LandlineFormatted',
  VoterTelephones_LandlineConfidenceCode:
    'VoterTelephones_LandlineConfidenceCode',
  VoterTelephones_CellPhoneFormatted: 'VoterTelephones_CellPhoneFormatted',
  VoterTelephones_CellConfidenceCode: 'VoterTelephones_CellConfidenceCode',
  Voters_FirstName: 'FirstName',
  Voters_MiddleName: 'MiddleName',
  Voters_LastName: 'LastName',
  Voters_NameSuffix: 'NameSuffix',
  Residence_Addresses_AddressLine: 'Residence_Addresses_AddressLine',
  Residence_Addresses_ExtraAddressLine: 'Residence_Addresses_ExtraAddressLine',
  Residence_Addresses_City: 'Residence_Addresses_City',
  Residence_Addresses_State: 'Residence_Addresses_State',
  Residence_Addresses_Zip: 'Residence_Addresses_Zip',
  Residence_Addresses_ZipPlus4: 'Residence_Addresses_ZipPlus4',
  Residence_Addresses_DPBC: 'Residence_Addresses_DPBC',
  Residence_Addresses_CheckDigit: 'Residence_Addresses_CheckDigit',
  Residence_Addresses_HouseNumber: 'Residence_Addresses_HouseNumber',
  Residence_Addresses_PrefixDirection: 'Residence_Addresses_PrefixDirection',
  Residence_Addresses_StreetName: 'Residence_Addresses_StreetName',
  Residence_Addresses_Designator: 'Residence_Addresses_Designator',
  Residence_Addresses_SuffixDirection: 'Residence_Addresses_SuffixDirection',
  Residence_Addresses_ApartmentNum: 'Residence_Addresses_ApartmentNum',
  Residence_Addresses_ApartmentType: 'Residence_Addresses_ApartmentType',
  Residence_Addresses_CassErrStatCode: 'Residence_Addresses_CassErrStatCode',
  Voters_SequenceZigZag: 'SequenceZigZag',
  Voters_SequenceOddEven: 'SequenceOddEven',
  Residence_Addresses_Latitude: 'Residence_Addresses_Latitude',
  Residence_Addresses_Longitude: 'Residence_Addresses_Longitude',
  Residence_Addresses_GeoHash: 'Residence_Addresses_GeoHash',
  Residence_Addresses_LatLongAccuracy: 'Residence_Addresses_LatLongAccuracy',
  Residence_HHParties_Description: 'Residence_HHParties_Description',
  Mailing_Addresses_AddressLine: 'Mailing_Addresses_AddressLine',
  Mailing_Addresses_ExtraAddressLine: 'Mailing_Addresses_ExtraAddressLine',
  Mailing_Addresses_City: 'Mailing_Addresses_City',
  Mailing_Addresses_State: 'Mailing_Addresses_State',
  Mailing_Addresses_Zip: 'Mailing_Addresses_Zip',
  Mailing_Addresses_ZipPlus4: 'Mailing_Addresses_ZipPlus4',
  Mailing_Addresses_DPBC: 'Mailing_Addresses_DPBC',
  Mailing_Addresses_CheckDigit: 'Mailing_Addresses_CheckDigit',
  Mailing_Addresses_HouseNumber: 'Mailing_Addresses_HouseNumber',
  Mailing_Addresses_PrefixDirection: 'Mailing_Addresses_PrefixDirection',
  Mailing_Addresses_StreetName: 'Mailing_Addresses_StreetName',
  Mailing_Addresses_Designator: 'Mailing_Addresses_Designator',
  Mailing_Addresses_SuffixDirection: 'Mailing_Addresses_SuffixDirection',
  Mailing_Addresses_ApartmentNum: 'Mailing_Addresses_ApartmentNum',
  Mailing_Addresses_ApartmentType: 'Mailing_Addresses_ApartmentType',
  Mailing_Addresses_CassErrStatCode: 'Mailing_Addresses_CassErrStatCode',
  Mailing_Families_FamilyID: 'Mailing_Families_FamilyID',
  Mailing_Families_HHCount: 'Mailing_Families_HHCount',
  Mailing_HHGender_Description: 'Mailing_HHGender_Description',
  Mailing_HHParties_Description: 'Mailing_HHParties_Description',
  Voters_Age: 'Age',
  Voters_Gender: 'Gender',
  DateConfidence_Description: 'DateConfidence_Description',
  Parties_Description: 'Parties_Description',
  VoterParties_Change_Changed_Party: 'VoterParties_Change_Changed_Party',
  Ethnic_Description: 'Ethnic_Description',
  EthnicGroups_EthnicGroup1Desc: 'EthnicGroups_EthnicGroup1Desc',
  CountyEthnic_LALEthnicCode: 'CountyEthnic_LALEthnicCode',
  CountyEthnic_Description: 'CountyEthnic_Description',
  Religions_Description: 'Religions_Description',
  Voters_CalculatedRegDate: 'CalculatedRegDate',
  Voters_OfficialRegDate: 'OfficialRegDate',
  Voters_PlaceOfBirth: 'PlaceOfBirth',
  Languages_Description: 'Languages_Description',
  AbsenteeTypes_Description: 'AbsenteeTypes_Description',
  MilitaryStatus_Description: 'MilitaryStatus_Description',
  MaritalStatus_Description: 'MaritalStatus_Description',
  Voters_MovedFrom_State: 'MovedFrom_State',
  Voters_MovedFrom_Date: 'MovedFrom_Date',
  Voters_MovedFrom_Party_Description: 'MovedFrom_Party_Description',
  Voters_VotingPerformanceEvenYearGeneral:
    'VotingPerformanceEvenYearGeneral',
  Voters_VotingPerformanceEvenYearPrimary:
    'VotingPerformanceEvenYearPrimary',
  Voters_VotingPerformanceEvenYearGeneralAndPrimary:
    'VotingPerformanceEvenYearGeneralAndPrimary',
  Voters_VotingPerformanceMinorElection: 'VotingPerformanceMinorElection',
  General_2022: 'General_2022',
  Primary_2022: 'Primary_2022',
  OtherElection_2022: 'OtherElection_2022',
  AnyElection_2021: 'AnyElection_2021',
  General_2020: 'General_2020',
  Primary_2020: 'Primary_2020',
  PresidentialPrimary_2020: 'PresidentialPrimary_2020',
  OtherElection_2020: 'OtherElection_2020',
  AnyElection_2019: 'AnyElection_2019',
  General_2018: 'General_2018',
  Primary_2018: 'Primary_2018',
  OtherElection_2018: 'OtherElection_2018',
  AnyElection_2017: 'AnyElection_2017',
  General_2016: 'General_2016',
  Primary_2016: 'Primary_2016',
  PresidentialPrimary_2016: 'PresidentialPrimary_2016',
  OtherElection_2016: 'OtherElection_2016',
  US_Congressional_District: 'US_Congressional_District',
  AddressDistricts_Change_Changed_CD: 'AddressDistricts_Change_Changed_CD',
  State_Senate_District: 'State_Senate_District',
  AddressDistricts_Change_Changed_SD: 'AddressDistricts_Change_Changed_SD',
  State_House_District: 'State_House_District',
  AddressDistricts_Change_Changed_HD: 'AddressDistricts_Change_Changed_HD',
  State_Legislative_District: 'State_Legislative_District',
  AddressDistricts_Change_Changed_LD: 'AddressDistricts_Change_Changed_LD',
  County: 'County',
  Voters_FIPS: 'FIPS',
  AddressDistricts_Change_Changed_County:
    'AddressDistricts_Change_Changed_County',
  Precinct: 'Precinct',
  County_Legislative_District: 'County_Legislative_District',
  City: 'City',
  City_Council_Commissioner_District: 'City_Council_Commissioner_District',
  County_Commissioner_District: 'County_Commissioner_District',
  County_Supervisorial_District: 'County_Supervisorial_District',
  City_Mayoral_District: 'City_Mayoral_District',
  Town_District: 'Town_District',
  Town_Council: 'Town_Council',
  Village: 'Village',
  Township: 'Township',
  Borough: 'Borough',
  Hamlet_Community_Area: 'Hamlet_Community_Area',
  City_Ward: 'City_Ward',
  Town_Ward: 'Town_Ward',
  Township_Ward: 'Township_Ward',
  Village_Ward: 'Village_Ward',
  Borough_Ward: 'Borough_Ward',
  Board_of_Education_District: 'Board_of_Education_District',
  Board_of_Education_SubDistrict: 'Board_of_Education_SubDistrict',
  City_School_District: 'City_School_District',
  College_Board_District: 'College_Board_District',
  Community_College_Commissioner_District:
    'Community_College_Commissioner_District',
  Community_College_SubDistrict: 'Community_College_SubDistrict',
  County_Board_of_Education_District: 'County_Board_of_Education_District',
  County_Board_of_Education_SubDistrict:
    'County_Board_of_Education_SubDistrict',
  County_Community_College_District: 'County_Community_College_District',
  County_Superintendent_of_Schools_District:
    'County_Superintendent_of_Schools_District',
  County_Unified_School_District: 'County_Unified_School_District',
  District_Attorney: 'District_Attorney',
  Education_Commission_District: 'Education_Commission_District',
  Educational_Service_District: 'Educational_Service_District',
  Election_Commissioner_District: 'Election_Commissioner_District',
  Elementary_School_District: 'Elementary_School_District',
  Elementary_School_SubDistrict: 'Elementary_School_SubDistrict',
  Exempted_Village_School_District: 'Exempted_Village_School_District',
  High_School_District: 'High_School_District',
  High_School_SubDistrict: 'High_School_SubDistrict',
  Judicial_Appellate_District: 'Judicial_Appellate_District',
  Judicial_Circuit_Court_District: 'Judicial_Circuit_Court_District',
  Judicial_County_Board_of_Review_District:
    'Judicial_County_Board_of_Review_District',
  Judicial_County_Court_District: 'Judicial_County_Court_District',
  Judicial_District: 'Judicial_District',
  Judicial_District_Court_District: 'Judicial_District_Court_District',
  Judicial_Family_Court_District: 'Judicial_Family_Court_District',
  Judicial_Jury_District: 'Judicial_Jury_District',
  Judicial_Juvenile_Court_District: 'Judicial_Juvenile_Court_District',
  Judicial_Magistrate_Division: 'Judicial_Magistrate_Division',
  Judicial_Sub_Circuit_District: 'Judicial_Sub_Circuit_District',
  Judicial_Superior_Court_District: 'Judicial_Superior_Court_District',
  Judicial_Supreme_Court_District: 'Judicial_Supreme_Court_District',
  Middle_School_District: 'Middle_School_District',
  Municipal_Court_District: 'Municipal_Court_District',
  Proposed_City_Commissioner_District: 'Proposed_City_Commissioner_District',
  Proposed_Elementary_School_District: 'Proposed_Elementary_School_District',
  Proposed_Unified_School_District: 'Proposed_Unified_School_District',
  Regional_Office_of_Education_District: 'Regional_Office_of_Education_District',
  School_Board_District: 'School_Board_District',
  School_District: 'School_District',
  School_District_Vocational: 'School_District_Vocational',
  School_Facilities_Improvement_District: 'School_Facilities_Improvement_District',
  School_Subdistrict: 'School_Subdistrict',
  Service_Area_District: 'Service_Area_District',
  Superintendent_of_Schools_District: 'Superintendent_of_Schools_District',
  Unified_School_District: 'Unified_School_District',
  Unified_School_SubDistrict: 'Unified_School_SubDistrict',
  Coast_Water_District: 'Coast_Water_District',
  Consolidated_Water_District: 'Consolidated_Water_District',
  County_Water_District: 'County_Water_District',
  County_Water_Landowner_District: 'County_Water_Landowner_District',
  County_Water_SubDistrict: 'County_Water_SubDistrict',
  Metropolitan_Water_District: 'Metropolitan_Water_District',
  Mountain_Water_District: 'Mountain_Water_District',
  Municipal_Water_District: 'Municipal_Water_District',
  Municipal_Water_SubDistrict: 'Municipal_Water_SubDistrict',
  River_Water_District: 'River_Water_District',
  Water_Agency: 'Water_Agency',
  Water_Agency_SubDistrict: 'Water_Agency_SubDistrict',
  Water_Conservation_District: 'Water_Conservation_District',
  Water_Conservation_SubDistrict: 'Water_Conservation_SubDistrict',
  Water_Control__Water_Conservation: 'Water_Control__Water_Conservation',
  Water_Control__Water_Conservation_SubDistrict:
    'Water_Control__Water_Conservation_SubDistrict',
  Water_District: 'Water_District',
  Water_Public_Utility_District: 'Water_Public_Utility_District',
  Water_Public_Utility_Subdistrict: 'Water_Public_Utility_Subdistrict',
  Water_Replacement_District: 'Water_Replacement_District',
  Water_Replacement_SubDistrict: 'Water_Replacement_SubDistrict',
  Water_SubDistrict: 'Water_SubDistrict',
  County_Fire_District: 'County_Fire_District',
  Fire_District: 'Fire_District',
  Fire_Maintenance_District: 'Fire_Maintenance_District',
  Fire_Protection_District: 'Fire_Protection_District',
  Fire_Protection_SubDistrict: 'Fire_Protection_SubDistrict',
  Fire_Protection_Tax_Measure_District: 'Fire_Protection_Tax_Measure_District',
  Fire_Service_Area_District: 'Fire_Service_Area_District',
  Fire_SubDistrict: 'Fire_SubDistrict',
  Independent_Fire_District: 'Independent_Fire_District',
  Proposed_Fire_District: 'Proposed_Fire_District',
  Unprotected_Fire_District: 'Unprotected_Fire_District',
  Bay_Area_Rapid_Transit: 'Bay_Area_Rapid_Transit',
  Metro_Transit_District: 'Metro_Transit_District',
  Rapid_Transit_District: 'Rapid_Transit_District',
  Rapid_Transit_SubDistrict: 'Rapid_Transit_SubDistrict',
  Transit_District: 'Transit_District',
  Transit_SubDistrict: 'Transit_SubDistrict',
  Community_Service_District: 'Community_Service_District',
  Community_Service_SubDistrict: 'Community_Service_SubDistrict',
  County_Service_Area: 'County_Service_Area',
  County_Service_Area_SubDistrict: 'County_Service_Area_SubDistrict',
  TriCity_Service_District: 'TriCity_Service_District',
  Library_Services_District: 'Library_Services_District',
  Airport_District: 'Airport_District',
  Annexation_District: 'Annexation_District',
  Aquatic_Center_District: 'Aquatic_Center_District',
  Aquatic_District: 'Aquatic_District',
  Assessment_District: 'Assessment_District',
  Bonds_District: 'Bonds_District',
  Career_Center: 'Career_Center',
  Cemetery_District: 'Cemetery_District',
  Central_Committee_District: 'Central_Committee_District',
  Chemical_Control_District: 'Chemical_Control_District',
  Committee_Super_District: 'Committee_Super_District',
  Communications_District: 'Communications_District',
  Community_College_At_Large: 'Community_College_At_Large',
  Community_Council_District: 'Community_Council_District',
  Community_Council_SubDistrict: 'Community_Council_SubDistrict',
  Community_Facilities_District: 'Community_Facilities_District',
  Community_Facilities_SubDistrict: 'Community_Facilities_SubDistrict',
  Community_Hospital_District: 'Community_Hospital_District',
  Community_Planning_Area: 'Community_Planning_Area',
  Congressional_Township: 'Congressional_Township',
  Conservation_District: 'Conservation_District',
  Conservation_SubDistrict: 'Conservation_SubDistrict',
  Control_Zone_District: 'Control_Zone_District',
  Corrections_District: 'Corrections_District',
  County_Hospital_District: 'County_Hospital_District',
  County_Library_District: 'County_Library_District',
  County_Memorial_District: 'County_Memorial_District',
  County_Paramedic_District: 'County_Paramedic_District',
  County_Sewer_District: 'County_Sewer_District',
  Democratic_Convention_Member: 'Democratic_Convention_Member',
  Democratic_Zone: 'Democratic_Zone',
  Designated_Market_Area_DMA: 'Designated_Market_Area_DMA',
  Drainage_District: 'Drainage_District',
  Educational_Service_Subdistrict: 'Educational_Service_Subdistrict',
  Emergency_Communication_911_District: 'Emergency_Communication_911_District',
  Emergency_Communication_911_SubDistrict:
    'Emergency_Communication_911_SubDistrict',
  Enterprise_Zone_District: 'Enterprise_Zone_District',
  EXT_District: 'EXT_District',
  Facilities_Improvement_District: 'Facilities_Improvement_District',
  Flood_Control_Zone: 'Flood_Control_Zone',
  Forest_Preserve: 'Forest_Preserve',
  Garbage_District: 'Garbage_District',
  Geological_Hazard_Abatement_District:
    'Geological_Hazard_Abatement_District',
  Health_District: 'Health_District',
  Hospital_SubDistrict: 'Hospital_SubDistrict',
  Improvement_Landowner_District: 'Improvement_Landowner_District',
  Irrigation_District: 'Irrigation_District',
  Irrigation_SubDistrict: 'Irrigation_SubDistrict',
  Island: 'Island',
  Land_Commission: 'Land_Commission',
  Landscaping_And_Lighting_Assessment_Distric:
    'Landscaping_And_Lighting_Assessment_Distric',
  Law_Enforcement_District: 'Law_Enforcement_District',
  Learning_Community_Coordinating_Council_District:
    'Learning_Community_Coordinating_Council_District',
  Levee_District: 'Levee_District',
  Levee_Reconstruction_Assesment_District:
    'Levee_Reconstruction_Assesment_District',
  Library_District: 'Library_District',
  Library_SubDistrict: 'Library_SubDistrict',
  Lighting_District: 'Lighting_District',
  Local_Hospital_District: 'Local_Hospital_District',
  Local_Park_District: 'Local_Park_District',
  Maintenance_District: 'Maintenance_District',
  Master_Plan_District: 'Master_Plan_District',
  Memorial_District: 'Memorial_District',
  Metro_Service_District: 'Metro_Service_District',
  Metro_Service_Subdistrict: 'Metro_Service_Subdistrict',
  Mosquito_Abatement_District: 'Mosquito_Abatement_District',
  Multi_township_Assessor: 'Multi_township_Assessor',
  Municipal_Advisory_Council_District: 'Municipal_Advisory_Council_District',
  Municipal_Utility_District: 'Municipal_Utility_District',
  Municipal_Utility_SubDistrict: 'Municipal_Utility_SubDistrict',
  Museum_District: 'Museum_District',
  Northeast_Soil_and_Water_District: 'Northeast_Soil_and_Water_District',
  Open_Space_District: 'Open_Space_District',
  Open_Space_SubDistrict: 'Open_Space_SubDistrict',
  Other: 'Other',
  Paramedic_District: 'Paramedic_District',
  Park_Commissioner_District: 'Park_Commissioner_District',
  Park_District: 'Park_District',
  Park_SubDistrict: 'Park_SubDistrict',
  Planning_Area_District: 'Planning_Area_District',
  Police_District: 'Police_District',
  Port_District: 'Port_District',
  Port_SubDistrict: 'Port_SubDistrict',
  Power_District: 'Power_District',
  Proposed_City: 'Proposed_City',
  Proposed_Community_College: 'Proposed_Community_College',
  Proposed_District: 'Proposed_District',
  Public_Airport_District: 'Public_Airport_District',
  Public_Regulation_Commission: 'Public_Regulation_Commission',
  Public_Service_Commission_District: 'Public_Service_Commission_District',
  Public_Utility_District: 'Public_Utility_District',
  Public_Utility_SubDistrict: 'Public_Utility_SubDistrict',
  Reclamation_District: 'Reclamation_District',
  Recreation_District: 'Recreation_District',
  Recreational_SubDistrict: 'Recreational_SubDistrict',
  Republican_Area: 'Republican_Area',
  Republican_Convention_Member: 'Republican_Convention_Member',
  Resort_Improvement_District: 'Resort_Improvement_District',
  Resource_Conservation_District: 'Resource_Conservation_District',
  Road_Maintenance_District: 'Road_Maintenance_District',
  Rural_Service_District: 'Rural_Service_District',
  Sanitary_District: 'Sanitary_District',
  Sanitary_SubDistrict: 'Sanitary_SubDistrict',
  Sewer_District: 'Sewer_District',
  Sewer_Maintenance_District: 'Sewer_Maintenance_District',
  Sewer_SubDistrict: 'Sewer_SubDistrict',
  Snow_Removal_District: 'Snow_Removal_District',
  Soil_And_Water_District: 'Soil_And_Water_District',
  Soil_And_Water_District_At_Large: 'Soil_And_Water_District_At_Large',
  Special_Reporting_District: 'Special_Reporting_District',
  Special_Tax_District: 'Special_Tax_District',
  Storm_Water_District: 'Storm_Water_District',
  Street_Lighting_District: 'Street_Lighting_District',
  TV_Translator_District: 'TV_Translator_District',
  Unincorporated_District: 'Unincorporated_District',
  Unincorporated_Park_District: 'Unincorporated_Park_District',
  Ute_Creek_Soil_District: 'Ute_Creek_Soil_District',
  Vector_Control_District: 'Vector_Control_District',
  Vote_By_Mail_Area: 'Vote_By_Mail_Area',
  Wastewater_District: 'Wastewater_District',
  Weed_District: 'Weed_District',
}

function deriveStateFromLALVOTERID(lalvoterId: string | null | undefined): string {
  if (!lalvoterId) return ''
  // LALVOTERID format seems to include 2-letter state at positions 4-5 (e.g., LALNC...) in sample
  const match = /^LAL([A-Z]{2})/.exec(lalvoterId)
  if (match) return match[1]
  // Fallback: last known state might be in Residence_Addresses_State; handled separately
  return ''
}

function coerceValue(
  key: keyof Prisma.VoterUncheckedCreateInput,
  value: string | null,
): any {
  if (value === null || value === '' || value === 'NULL' || value === 'null')
    return null
  // Integer columns list - align with schema
  const integerKeys: Array<keyof Prisma.VoterUncheckedCreateInput> = [
    'VoterTelephones_LandlineConfidenceCode',
    'VoterTelephones_CellConfidenceCode',
    'Residence_Addresses_CheckDigit',
    'Mailing_Addresses_CheckDigit',
    'Mailing_Families_HHCount',
    'Age_Int',
    'Residence_Addresses_PrefixDirection',
    'Residence_Addresses_SuffixDirection',
  ]
  if (integerKeys.includes(key)) return Number(value)

  // Date columns - in CSV we have ISO or mm/dd/yyyy; Prisma accepts Date
  const dateKeys: Array<keyof Prisma.VoterUncheckedCreateInput> = [
    'CalculatedRegDate',
    'MovedFrom_Date',
  ]
  if (dateKeys.includes(key)) return new Date(value)

  return value
}

async function main() {
  const prisma = new PrismaClient()
  const inputPath = resolve(process.cwd(), process.argv[2] ?? 'data-1757244389892.csv')
  console.log(`Importing voters from ${basename(inputPath)} ...`)

  const parser = createReadStream(inputPath).pipe(
    parse({
      columns: true,
      bom: true,
      trim: true,
      skip_empty_lines: true,
      relax_column_count: true,
      relax_quotes: true,
    }),
  )

  const batch: Prisma.VoterCreateManyInput[] = []
  const BATCH_SIZE = 1000
  let count = 0

  for await (const record of parser as AsyncIterable<Record<string, string | null>>) {
    const data: Record<string, any> = {}

    // Map CSV fields we know about
    for (const [csvKey, dbKey] of Object.entries(CSV_TO_DB_FIELD)) {
      const value = (record as any)[csvKey]
      if (value !== undefined) {
        data[dbKey] = coerceValue(dbKey as keyof Prisma.VoterUncheckedCreateInput, value)
      }
    }

    // Required columns
    const lal = (record as any)['LALVOTERID'] as string | null
    if (!lal) continue
    data.LALVOTERID = String(lal)

    // Required primary key id
    data.id = randomUUID()

    // State: prefer Residence_Addresses_State; fallback to derive from LALVOTERID
    const stateCsv = (record as any)['Residence_Addresses_State'] as string | null
    const derivedState = deriveStateFromLALVOTERID(lal)
    const chosenState = stateCsv && stateCsv.length === 2 ? stateCsv : derivedState
    data.State = chosenState ? chosenState.toUpperCase() : ''
    if (!data.State) {
      // Skip if we cannot determine state; table is partitioned by state
      continue
    }

    // Optional: Age_Int from Voters_Age if numeric
    const ageStr = (record as any)['Voters_Age'] as string | null
    if (ageStr && /^(\d+)$/.test(ageStr)) {
      data.Age_Int = Number(ageStr)
    }

    // Insert createMany input
    batch.push(data as Prisma.VoterCreateManyInput)
    if (batch.length >= BATCH_SIZE) {
      await prisma.voter.createMany({ data: batch, skipDuplicates: true })
      count += batch.length
      console.log(`Inserted ${count} rows...`)
      batch.length = 0
    }
  }

  if (batch.length) {
    await prisma.voter.createMany({ data: batch, skipDuplicates: true })
    count += batch.length
  }

  console.log(`Done. Inserted ${count} rows.`)
  await prisma.$disconnect()
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})


