import { Prisma } from '@prisma/client'
import {
  AnyElectionYearKey,
  GeneralYearKey,
  OtherElectionYearKey,
  PresidentialPrimaryYearKey,
  PrimaryYearKey,
  YearSelectKey,
} from './people.types'
import { DEMOGRAPHIC_FILTER_FIELDS, DemographicFilter } from './people.filters'

export function buildVoterSelect(
  full: boolean,
  electionYear: number,
  _demographicFilter: DemographicFilter,
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
