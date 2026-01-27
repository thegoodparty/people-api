import { Prisma } from '@prisma/client'
import {
  AnyElectionYearKey,
  GeneralYearKey,
  OtherElectionYearKey,
  PresidentialPrimaryYearKey,
  PrimaryYearKey,
  YearSelectKey,
} from './people.types'
import { DEMOGRAPHIC_FILTER_FIELDS } from './people.demographics'

export function buildVoterSelect(
  full: boolean,
  electionYear: number,
): Prisma.VoterSelect {
  const isEvenYear = electionYear % 2 === 0
  if (full) {
    const select: Prisma.VoterSelect = {
      id: true,
      LALVOTERID: true,
      State: true,
      FirstName: true,
      MiddleName: true,
      LastName: true,
      NameSuffix: true,
      Residence_Addresses_AddressLine: true,
      Residence_Addresses_ExtraAddressLine: true,
      Residence_Addresses_City: true,
      Residence_Addresses_State: true,
      Residence_Addresses_Zip: true,
      Residence_Addresses_ZipPlus4: true,
      Mailing_Addresses_AddressLine: true,
      Mailing_Addresses_ExtraAddressLine: true,
      Mailing_Addresses_City: true,
      Mailing_Addresses_State: true,
      Mailing_Addresses_Zip: true,
      Mailing_Addresses_ZipPlus4: true,
      VoterTelephones_LandlineFormatted: true,
      VoterTelephones_CellPhoneFormatted: true,
      Age: true,
      Gender: true,
      Parties_Description: true,
    }

    if (isEvenYear) {
      ;(select as Record<YearSelectKey, boolean>)[
        `General_${electionYear}` as GeneralYearKey
      ] = true
      ;(select as Record<YearSelectKey, boolean>)[
        `Primary_${electionYear}` as PrimaryYearKey
      ] = true
      ;(select as Record<YearSelectKey, boolean>)[
        `OtherElection_${electionYear}` as OtherElectionYearKey
      ] = true
      if (electionYear % 4 === 0) {
        ;(select as Record<YearSelectKey, boolean>)[
          `PresidentialPrimary_${electionYear}` as PresidentialPrimaryYearKey
        ] = true
      }
    } else {
      ;(select as Record<YearSelectKey, boolean>)[
        `AnyElection_${electionYear}` as AnyElectionYearKey
      ] = true
    }

    // TODO: I'm not sure if we should change what columns are returned based on the demographic filter, you decide @Stephen
    addAllDemographicColumnsToSelect(select)
    return select
  }

  const minimal: Prisma.VoterSelect = {
    LALVOTERID: true,
    State: true,
    FirstName: true,
    LastName: true,
    Residence_Addresses_City: true,
    Residence_Addresses_State: true,
    Residence_Addresses_Zip: true,
  }
  addAllDemographicColumnsToSelect(minimal)
  return minimal
}

export function addAllDemographicColumnsToSelect(
  select: Prisma.VoterSelect,
): void {
  for (const spec of Object.values(DEMOGRAPHIC_FILTER_FIELDS)) {
    ;(select as Record<string, boolean>)[spec.prismaField as string] = true
  }
}

export function buildVoterSelectSql(
  full: boolean,
  electionYear: number,
  tableAlias = '"Voter"',
): Prisma.Sql {
  const isEvenYear = electionYear % 2 === 0
  const baseFull = [
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
    'VoterTelephones_LandlineFormatted',
    'VoterTelephones_CellPhoneFormatted',
    'Age',
    'Gender',
    'Parties_Description',
  ]
  const baseMinimal = [
    'LALVOTERID',
    'State',
    'FirstName',
    'LastName',
    'Residence_Addresses_City',
    'Residence_Addresses_State',
    'Residence_Addresses_Zip',
  ]
  const fields = new Set<string>(full ? baseFull : baseMinimal)
  if (isEvenYear) {
    fields.add(`General_${electionYear}`)
    fields.add(`Primary_${electionYear}`)
    fields.add(`OtherElection_${electionYear}`)
    if (electionYear % 4 === 0) {
      fields.add(`PresidentialPrimary_${electionYear}`)
    }
  } else {
    fields.add(`AnyElection_${electionYear}`)
  }
  for (const spec of Object.values(DEMOGRAPHIC_FILTER_FIELDS)) {
    fields.add(spec.prismaField as string)
  }
  const quoteIdent = (id: string) => `"${id.replace(/"/g, '""')}"`
  const cols = Array.from(fields).map((f) => {
    return Prisma.sql`${Prisma.raw(
      `${tableAlias}.${quoteIdent(f)} AS ${quoteIdent(f)}`,
    )}`
  })
  return Prisma.sql`SELECT ${Prisma.join(cols, ', ')}`
}
