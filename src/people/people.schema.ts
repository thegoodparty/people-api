import { createZodDto } from 'nestjs-zod'
import { STATE_CODES } from 'src/shared/constants/states'
import { z } from 'zod'

const allowedFilters = [
  'audienceSuperVoters',
  'audienceLikelyVoters',
  'audienceUnreliableVoters',
  'audienceUnlikelyVoters',
  'audienceFirstTimeVoters',
  'partyIndependent',
  'partyDemocrat',
  'partyRepublican',
  'age18_25',
  'age25_35',
  'age35_50',
  'age50Plus',
  'genderMale',
  'genderFemale',
  'genderUnknown',
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

export const listPeopleSchema = z.object({
  state: z
    .string()
    .transform((v) => v.toUpperCase())
    .refine((v) => STATE_CODES.includes(v), 'Invalid state code'),
  districtType: z.string(),
  districtName: z.string(),
  electionYear: z
    .preprocess(
      (v) => (v === undefined ? new Date().getFullYear() : v),
      z.coerce.number().int(),
    )
    .optional()
    .default(new Date().getFullYear()),
  filters: z
    .preprocess(
      (v) => {
        const values = coerceArray(v)
        const legacyToCamel: Record<string, (typeof allowedFilters)[number]> = {
          audience_superVoters: 'audienceSuperVoters',
          audience_likelyVoters: 'audienceLikelyVoters',
          audience_unreliableVoters: 'audienceUnreliableVoters',
          audience_unlikelyVoters: 'audienceUnlikelyVoters',
          audience_firstTimeVoters: 'audienceFirstTimeVoters',
          party_independent: 'partyIndependent',
          party_democrat: 'partyDemocrat',
          party_republican: 'partyRepublican',
          age_18_25: 'age18_25',
          age_25_35: 'age25_35',
          age_35_50: 'age35_50',
          age_50_plus: 'age50Plus',
          gender_male: 'genderMale',
          gender_female: 'genderFemale',
          gender_unknown: 'genderUnknown',
          audience_request: 'audienceRequest',
          voterTelephones_CellPhoneFormatted: 'cellPhoneFormatted',
          voterTelephones_LandlineFormatted: 'landlineFormatted',
        }
        return values.map((raw) => {
          const s = String(raw)
          return (
            (legacyToCamel[s] as (typeof allowedFilters)[number]) ??
            (s as unknown)
          )
        })
      },
      z.array(z.enum(allowedFilters)),
    )
    .optional()
    .default([]),
  full: z
    .preprocess((v) => (v === undefined ? true : v), z.coerce.boolean())
    .optional()
    .default(true),
  resultsPerPage: z.coerce.number().optional().default(50),
  page: z.coerce.number().optional().default(1),
})

export class ListPeopleDTO extends createZodDto(listPeopleSchema) {}

export const downloadPeopleSchema = z.object({
  state: z
    .string()
    .transform((v) => v.toUpperCase())
    .refine((v) => STATE_CODES.includes(v), 'Invalid state code'),
  // Support both naming conventions; aliases are optional
  districtType: z.string().optional(),
  districtName: z.string().optional(),
  electionLocation: z.string().optional(),
  electionType: z.string().optional(),
  electionYear: z
    .preprocess(
      (v) => (v === undefined ? new Date().getFullYear() : v),
      z.coerce.number().int(),
    )
    .optional()
    .default(new Date().getFullYear()),
  filters: z
    .preprocess(
      (v) => {
        const values = coerceArray(v)
        const legacyToCamel: Record<string, (typeof allowedFilters)[number]> = {
          audience_superVoters: 'audienceSuperVoters',
          audience_likelyVoters: 'audienceLikelyVoters',
          audience_unreliableVoters: 'audienceUnreliableVoters',
          audience_unlikelyVoters: 'audienceUnlikelyVoters',
          audience_firstTimeVoters: 'audienceFirstTimeVoters',
          party_independent: 'partyIndependent',
          party_democrat: 'partyDemocrat',
          party_republican: 'partyRepublican',
          age_18_25: 'age18_25',
          age_25_35: 'age25_35',
          age_35_50: 'age35_50',
          age_50_plus: 'age50Plus',
          gender_male: 'genderMale',
          gender_female: 'genderFemale',
          gender_unknown: 'genderUnknown',
          audience_request: 'audienceRequest',
          voterTelephones_CellPhoneFormatted: 'cellPhoneFormatted',
          voterTelephones_LandlineFormatted: 'landlineFormatted',
        }
        return values.map((raw) => {
          const s = String(raw)
          return (
            (legacyToCamel[s] as (typeof allowedFilters)[number]) ??
            (s as unknown)
          )
        })
      },
      z.array(z.enum(allowedFilters)),
    )
    .optional()
    .default([]),
  full: z
    .preprocess((v) => (v === undefined ? true : v), z.coerce.boolean())
    .optional()
    .default(true),
})

export class DownloadPeopleDTO extends createZodDto(downloadPeopleSchema) {}
