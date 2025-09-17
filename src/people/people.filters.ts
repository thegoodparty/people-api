import { Prisma } from '@prisma/client'

export type FilterFieldType = 'string' | 'boolean'

export type FilterFieldMetadata = {
  prismaField: keyof Prisma.VoterWhereInput
  type: FilterFieldType
}

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
  registeredVoter: { prismaField: 'Registered_Voter', type: 'boolean' },
  veteranStatus: { prismaField: 'Veteran_Status', type: 'string' },
  voterStatus: { prismaField: 'Voter_Status', type: 'string' },
}

export type FilterIsOperator = 'null' | 'not_null'

export type FieldFilterOps = {
  eq?: unknown
  in?: unknown[] | unknown
  is?: FilterIsOperator
}

export type DemographicFilter = Record<string, FieldFilterOps>
