import { createZodDto } from 'nestjs-zod'
import { STATE_CODES } from 'src/shared/constants/states'
import { z } from 'zod'

const allowedFilters = [
  'audience_superVoters',
  'audience_likelyVoters',
  'audience_unreliableVoters',
  'audience_unlikelyVoters',
  'audience_firstTimeVoters',
  'party_independent',
  'party_democrat',
  'party_republican',
  'age_18_25',
  'age_25_35',
  'age_35_50',
  'age_50_plus',
  'gender_male',
  'gender_female',
  'gender_unknown',
  'audience_request',
] as const

export const listPeopleSchema = z.object({
  state: z
    .string()
    .transform((v) => v.toUpperCase())
    .refine((v) => STATE_CODES.includes(v), 'Invalid state code'),
  districtType: z.string(),
  districtName: z.string(),
  filters: z
    .preprocess(
      (v) => (Array.isArray(v) ? v : v ? [v] : []),
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
