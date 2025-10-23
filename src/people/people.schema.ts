import { createZodDto } from 'nestjs-zod'
import { STATE_CODES } from 'src/shared/constants/states'
import { z } from 'zod'

const allowedFilters = [
  'audienceSuperVoters',
  'audienceLikelyVoters',
  // TODO: remove this once gp-api change is deployed.
  'audienceUnreliableVoters',
  'audienceUnlikelyVoters',
  'audienceFirstTimeVoters',
  'audienceUnknown',
  'partyIndependent',
  'partyDemocrat',
  'partyRepublican',
  'partyUnknown',
  'age18_25',
  'age25_35',
  'age35_50',
  'age50Plus',
  'ageUnknown',
  'genderMale',
  'genderFemale',
  'genderUnknown',
  'registeredVoterUnknown',
  'incomeUnknown',
  'audienceRequest',
  'cellPhoneFormatted',
  'landlineFormatted',
] as const

// Accepts: array values, single value, or a JSON-like array string
// Example supported strings: "[\"a\",\"b\"]" or "['a','b']"
const coerceArray = (v: unknown): unknown[] => {
  if (Array.isArray(v)) return v
  if (typeof v === 'string') {
    const s = v.trim()
    if (s.startsWith('[') && s.endsWith(']')) {
      try {
        const normalized = s.replace(/'/g, '"')
        const parsed = JSON.parse(normalized)
        if (Array.isArray(parsed)) return parsed
      } catch {}
    }
    return s ? [s] : []
  }
  return v != null ? [v] : []
}

// ---- Shared atoms to keep schemas DRY ----
const stateSchema = z
  .string()
  .transform((v) => v.toUpperCase())
  .refine((v) => STATE_CODES.includes(v), 'Invalid state code')

const electionYearSchema = z
  .preprocess(
    (v) => (v === undefined ? new Date().getFullYear() : v),
    z.coerce.number().int(),
  )
  .optional()
  .default(new Date().getFullYear())

const booleanDefault = (def: boolean) =>
  z
    .preprocess((v) => (v === undefined ? def : v), z.coerce.boolean())
    .optional()
    .default(def)

const legacyToCamel: Record<string, (typeof allowedFilters)[number]> = {
  audience_superVoters: 'audienceSuperVoters',
  audience_likelyVoters: 'audienceLikelyVoters',
  audience_unreliableVoters: 'audienceUnreliableVoters',
  audience_unlikelyVoters: 'audienceUnlikelyVoters',
  audience_firstTimeVoters: 'audienceFirstTimeVoters',
  audience_unknown: 'audienceUnknown',
  party_independent: 'partyIndependent',
  party_democrat: 'partyDemocrat',
  party_republican: 'partyRepublican',
  party_unknown: 'partyUnknown',
  age_18_25: 'age18_25',
  age_25_35: 'age25_35',
  age_35_50: 'age35_50',
  age_50_plus: 'age50Plus',
  age_unknown: 'ageUnknown',
  gender_male: 'genderMale',
  gender_female: 'genderFemale',
  gender_unknown: 'genderUnknown',
  registered_voter_unknown: 'registeredVoterUnknown',
  income_unknown: 'incomeUnknown',
  audience_request: 'audienceRequest',
  voterTelephones_CellPhoneFormatted: 'cellPhoneFormatted',
  voterTelephones_LandlineFormatted: 'landlineFormatted',
}

const preprocessFilters = (v: unknown) => {
  const values = coerceArray(v)
  return values.map((raw) => {
    const s = String(raw)
    return (
      (legacyToCamel[s] as (typeof allowedFilters)[number]) ?? (s as unknown)
    )
  })
}

const filtersSchema = z
  .preprocess(preprocessFilters, z.array(z.enum(allowedFilters)))
  .optional()
  .default([])

const fieldOpsSchema = z.object({
  eq: z.union([z.string(), z.boolean()]).optional(),
  in: z
    .preprocess(
      (v) => coerceArray(v),
      z.array(z.union([z.string(), z.boolean()])),
    )
    .optional(),
  is: z.enum(['null', 'not_null']).optional(),
})

const demographicFilterSchema = z.record(fieldOpsSchema)

export const listPeopleSchema = z
  .object({
    state: stateSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    electionYear: electionYearSchema,
    filters: filtersSchema,
    full: booleanDefault(true),
    resultsPerPage: z.coerce.number().optional().default(50),
    page: z.coerce.number().optional().default(1),
    filter: demographicFilterSchema.optional().default({}),
  })
  .refine(
    (v) =>
      (v.districtType && v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName must be provided together',
  )

export class ListPeopleDTO extends createZodDto(listPeopleSchema) {}

export const downloadPeopleSchema = z.object({
  state: stateSchema,
  // Support both naming conventions; aliases are optional
  districtType: z.string().optional(),
  districtName: z.string().optional(),
  electionLocation: z.string().optional(),
  electionType: z.string().optional(),
  electionYear: electionYearSchema,
  filters: filtersSchema,
  full: booleanDefault(true),
  filter: demographicFilterSchema.optional().default({}),
})

export class DownloadPeopleDTO extends createZodDto(downloadPeopleSchema) {}

export const searchPeopleSchema = z
  .object({
    state: stateSchema.optional(),
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    phone: z.string().optional(),
    name: z.string().optional(),
    firstName: z.string().optional(),
    lastName: z.string().optional(),
    resultsPerPage: z.coerce
      .number()
      .int()
      .min(1)
      .max(50)
      .optional()
      .default(25),
    page: z.coerce.number().int().min(1).optional().default(1),
  })
  .refine(
    (v) => !!(v.phone || v.name || v.firstName || v.lastName),
    'Provide phone or name to search',
  )
  .refine(
    (v) =>
      (v.districtType && v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName must be provided together',
  )

export class SearchPeopleDTO extends createZodDto(searchPeopleSchema) {}

export const statsSchema = z.object({
  state: stateSchema,
  districtType: z.string().optional(),
  districtName: z.string().optional(),
  electionYear: electionYearSchema,
})

export class StatsDTO extends createZodDto(statsSchema) {}

export const samplePeopleSchema = z.object({
  state: stateSchema,
  districtType: z.string().optional(),
  districtName: z.string().optional(),
  electionYear: electionYearSchema,
  size: z.coerce.number().int().min(1).max(5000).optional().default(500),
  full: booleanDefault(true),
  hasCellPhone: z.coerce.boolean().optional(),
})

export class SamplePeopleDTO extends createZodDto(samplePeopleSchema) {}
