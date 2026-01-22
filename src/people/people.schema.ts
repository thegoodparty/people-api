import { createZodDto } from 'nestjs-zod'
import { USState } from '@prisma/client'
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
      } catch { }
    }
    return s ? [s] : []
  }
  return v != null ? [v] : []
}
import { filtersSchema } from './schemas/filters.schema'

// ---- Shared atoms to keep schemas DRY ----
const stateSchema = z.preprocess(
  (v) => (typeof v === 'string' ? v.toUpperCase() : v),
  z.nativeEnum(USState),
)

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

export const listPeopleSchema = z.object({
  state: stateSchema,
  districtType: z.string().optional(),
  districtName: z.string().optional(),
  electionYear: electionYearSchema,
  filters: filtersSchema,
  full: booleanDefault(true),
  resultsPerPage: z.coerce.number().optional().default(50),
  page: z.coerce.number().optional().default(1),
})

export class ListPeopleDTO extends createZodDto(listPeopleSchema) { }

export const downloadPeopleSchema = z.object({
  state: stateSchema,
  // Support both naming conventions; aliases are optional
  districtType: z.string(),
  districtName: z.string(),
  electionLocation: z.string().optional(),
  electionType: z.string().optional(),
  electionYear: electionYearSchema,
  filters: filtersSchema,
  full: booleanDefault(true),
})

export class DownloadPeopleDTO extends createZodDto(downloadPeopleSchema) { }

export const searchPeopleSchema = z
  .object({
    state: stateSchema,
    districtType: z.string(),
    districtName: z.string(),
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

export class SearchPeopleDTO extends createZodDto(searchPeopleSchema) { }

export class StatsDTO extends createZodDto(
  z.object({
    state: stateSchema,
    districtType: z.string(),
    districtName: z.string(),
  }),
) { }

export const samplePeopleSchema = z
  .object({
    state: stateSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    electionYear: electionYearSchema,
    size: z.coerce.number().int().min(1).max(10000).optional().default(500),
    full: booleanDefault(true),
    hasCellPhone: z.coerce.boolean().optional(),
    excludeIds: z.array(z.string()).optional(),
  })
  .refine(
    (v) =>
      (!!v.districtType && !!v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName are required together unless a valid statewide claim is present',
  )

export class SamplePeopleDTO extends createZodDto(samplePeopleSchema) { }

export type ListPeopleSchema = z.infer<typeof listPeopleSchema>
export type DownloadPeopleSchema = z.infer<typeof downloadPeopleSchema>
