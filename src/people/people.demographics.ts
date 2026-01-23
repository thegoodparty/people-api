import { Prisma } from '@prisma/client'

export type FilterFieldType = 'string' | 'boolean'

export type FilterFieldMetadata = {
  prismaField: keyof Prisma.VoterWhereInput
  type: FilterFieldType
}

// TODO: Delete all of this and update our SELECT logic
// Whitelist of filterable demographic fields (camelCase API → Prisma field)
export const DEMOGRAPHIC_FILTER_FIELDS: Record<string, FilterFieldMetadata> = {
  businessOwner: { prismaField: 'Business_Owner', type: 'string' },
  educationOfPerson: { prismaField: 'Education_Of_Person', type: 'string' },
  estimatedIncomeAmount: {
    prismaField: 'Estimated_Income_Amount',
    type: 'string',
  },
  homeownerProbabilityModel: {
    prismaField: 'Homeowner_Probability_Model',
    type: 'string',
  },
  languageCode: { prismaField: 'Language_Code', type: 'string' },
  maritalStatus: { prismaField: 'Marital_Status', type: 'string' },
  presenceOfChildren: { prismaField: 'Presence_Of_Children', type: 'string' },
  veteranStatus: { prismaField: 'Veteran_Status', type: 'string' },
  voterStatus: { prismaField: 'Voter_Status', type: 'string' },
  // Ethnic group description
  ethnicGroupsEthnicGroup1Desc: {
    prismaField: 'EthnicGroups_EthnicGroup1Desc',
    type: 'string',
  },
  // Fields from the legacy filters approach
  gender: { prismaField: 'Gender', type: 'string' },
  partiesDescription: { prismaField: 'Parties_Description', type: 'string' },
  ageInt: { prismaField: 'Age_Int', type: 'string' },
  voterTelephonesCellPhoneFormatted: {
    prismaField: 'VoterTelephones_CellPhoneFormatted',
    type: 'string',
  },
  voterTelephonesLandlineFormatted: {
    prismaField: 'VoterTelephones_LandlineFormatted',
    type: 'string',
  },
  votingPerformanceEvenYearGeneral: {
    prismaField: 'VotingPerformanceEvenYearGeneral',
    type: 'string',
  },
  votingPerformanceMinorElection: {
    prismaField: 'VotingPerformanceMinorElection',
    type: 'string',
  },
}
