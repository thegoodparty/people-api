/**
 * Filter Schema for People API
 *
 * Example JSON structure:
 * {
 *   "hasCellPhone": true,                          // Boolean filter (true = IS NOT NULL)
 *   "voterStatus": { "in": ["Super", "Likely"] }, // Enum filter with 'in' operator
 *   "politicalParty": { "eq": "Democratic" }, // Enum filter with 'eq' operator
 *   "maritalStatus": { "is": "not_null" },        // Enum filter with 'is' operator
 *   "gender": { "in": ["M", "F"] },               // Enum filter with multiple values
 *   "language": { "in": ["English", "Spanish"] }, // Enum filter with 'in' operator
 *   "estimatedIncomeAmount": { "is": "null" },    // String filter with 'is' operator
 *   "estimatedIncomeAmountInt": { "gte": 25000, "lte": 50000 }, // Numeric filter with range
 *   "estimatedIncomeAmountInt": { "in": [25000, 50000, 75000] }, // Numeric filter with 'in' operator
 *   "ageInt": { "gte": 18, "lte": 65 },            // Numeric filter with range
 *   "ageInt": { "in": [25, 30, 35] },             // Numeric filter with 'in' operator
 *   "ageInt": { "eq": 30 }                         // Numeric filter with 'eq' operator
 * }
 *
 * Filter Types:
 * - Boolean filters: hasCellPhone, hasLandline (true = IS NOT NULL, false = IS NULL)
 * - Enum filters: voterStatus, politicalParty, maritalStatus, veteranStatus, educationLevel,
 *   ethnicity, businessOwner, presenceOfChildren, homeowner, gender
 *   Operators: { in: string[] }, { eq: string }, { is: "not_null" | "null" }
 * - Enum filters: language (uses enum values from FILTER_VALUE_ENUMS.language)
 *   Operators: { in: string[] }, { eq: string }, { is: "not_null" | "null" }
 * - String filters: estimatedIncomeAmount
 *   Operators: { in: string[] }, { eq: string }, { is: "not_null" | "null" }
 * - Numeric filters: ageInt, estimatedIncomeAmountInt
 *   Operators: { in: number[] }, { eq: number }, { gte: number }, { lte: number }, { is: "not_null" | "null" }
 */

import { z } from 'zod'
import {
  createEnumFilterSchema,
  createNumericFilterSchema,
  createStringFilterSchema,
  transformFilters,
  type TransformFiltersResult,
} from './filters.schema.utils'

export const FILTER_VALUE_ENUMS = {
  voterStatus: [
    'Super',
    'Likely',
    'Unreliable',
    'Unlikely',
    'First Time',
    'Unknown',
  ] as const,
  politicalParty: [
    'Independent',
    'Democratic',
    'Republican',
    'Unknown',
  ] as const,
  maritalStatus: [
    'Inferred Married',
    'Inferred Single',
    'Married',
    'Single',
    'Unknown',
  ] as const,
  veteranStatus: ['Yes', 'Unknown'] as const,
  educationLevel: [
    'None',
    'High School Diploma',
    'Technical School',
    'Some College',
    'College Degree',
    'Graduate Degree',
    'Unknown',
  ] as const,
  ethnicity: [
    'Asian',
    'European',
    'Hispanic',
    'African American',
    'Other',
    'Unknown',
  ] as const,
  businessOwner: ['Yes', 'Unknown'] as const,
  presenceOfChildren: ['Yes', 'No', 'Unknown'] as const,
  homeowner: ['Yes', 'Likely', 'No', 'Unknown'] as const,
  gender: ['M', 'F'] as const,
  language: ['English', 'Spanish', 'Other'] as const,
} as const

const filtersSchemaObject = z.object({
  hasCellPhone: z.boolean().optional(),
  hasLandline: z.boolean().optional(),
  maritalStatus: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.maritalStatus,
  ).optional(),
  veteranStatus: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.veteranStatus,
  ).optional(),
  educationLevel: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.educationLevel,
  ).optional(),
  ethnicity: createEnumFilterSchema(FILTER_VALUE_ENUMS.ethnicity).optional(),
  businessOwner: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.businessOwner,
  ).optional(),
  presenceOfChildren: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.presenceOfChildren,
  ).optional(),
  homeowner: createEnumFilterSchema(FILTER_VALUE_ENUMS.homeowner).optional(),
  gender: createEnumFilterSchema(FILTER_VALUE_ENUMS.gender).optional(),
  voterStatus: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.voterStatus,
  ).optional(),
  politicalParty: createEnumFilterSchema(
    FILTER_VALUE_ENUMS.politicalParty,
  ).optional(),
  language: createEnumFilterSchema(FILTER_VALUE_ENUMS.language).optional(),
  estimatedIncomeAmount: createStringFilterSchema().optional(),
  estimatedIncomeAmountInt: createNumericFilterSchema().optional(),
  ageInt: createNumericFilterSchema().optional(),
})

export type AllowedFilter = keyof z.infer<typeof filtersSchemaObject>

export const filtersSchema = filtersSchemaObject
  .optional()
  .default({})
  .transform((filters) =>
    transformFilters<AllowedFilter>(filters, filtersSchemaObject.shape),
  )

export type { FilterOperator } from './filters.schema.utils'

export type FilterData = TransformFiltersResult<AllowedFilter>
