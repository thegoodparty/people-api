import { Prisma, Voter } from '@prisma/client'

const VOTER_SELECT_COLUMNS = [
  'id',
  'LALVOTERID',
  'State',
  'FirstName',
  'MiddleName',
  'LastName',
  'NameSuffix',
  'Residence_Addresses_AddressLine',
  'Residence_Addresses_ExtraAddressLine',
  'Residence_Addresses_City',
  'Residence_Addresses_State',
  'Residence_Addresses_Zip',
  'Residence_Addresses_ZipPlus4',
  'Mailing_Addresses_AddressLine',
  'Mailing_Addresses_ExtraAddressLine',
  'Mailing_Addresses_City',
  'Mailing_Addresses_State',
  'Mailing_Addresses_Zip',
  'Mailing_Addresses_ZipPlus4',
  'Residence_Addresses_Latitude',
  'Residence_Addresses_Longitude',
  'VoterTelephones_LandlineFormatted',
  'VoterTelephones_CellPhoneFormatted',
  'Age',
  'Gender',
  'Parties_Description',
  'Business_Owner',
  'Education_Of_Person',
  'Estimated_Income_Amount_Int',
  'Homeowner_Probability_Model',
  'Language_Code',
  'Marital_Status',
  'Presence_Of_Children',
  'Veteran_Status',
  'Voter_Status',
  'EthnicGroups_EthnicGroup1Desc',
  'Age_Int',
  'VotingPerformanceEvenYearGeneral',
  'VotingPerformanceMinorElection',
] as const satisfies (keyof Voter)[]

export type BaseSelectedField = (typeof VOTER_SELECT_COLUMNS)[number]

export type ExtraSelectedField = Exclude<keyof Voter, BaseSelectedField>

export function buildVoterSelectSql(extraFields: ExtraSelectedField[] = []) {
  const columnNames = Array.from(
    new Set([...VOTER_SELECT_COLUMNS, ...extraFields]),
  )
  const quoteIdent = (id: string) => `"${id.replace(/"/g, '""')}"`
  const cols = columnNames.map((f) => {
    return Prisma.sql`${Prisma.raw(`v.${quoteIdent(f)} AS ${quoteIdent(f)}`)}`
  })

  return {
    columnNames,
    sql: Prisma.sql`SELECT ${Prisma.join(cols, ', ')}`,
  }
}

export type BaseDbPerson = Pick<Voter, BaseSelectedField>
