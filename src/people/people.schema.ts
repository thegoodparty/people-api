import { createZodDto } from 'nestjs-zod'
import { USState } from '@prisma/client'
import { z } from 'zod'

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
  search: z.string().optional(),
  full: booleanDefault(true),
  resultsPerPage: z.coerce.number().optional().default(50),
  page: z.coerce.number().optional().default(1),
})

export class ListPeopleDTO extends createZodDto(listPeopleSchema) {}

export const downloadPeopleSchema = z
  .object({
    state: stateSchema,
    // Support both naming conventions; aliases are optional
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    electionLocation: z.string().optional(),
    electionType: z.string().optional(),
    electionYear: electionYearSchema,
    filters: filtersSchema,
    full: booleanDefault(true),
  })
  .refine(
    (v) =>
      (!!v.districtType && !!v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName are required together unless a valid statewide claim is present',
  )

export class DownloadPeopleDTO extends createZodDto(downloadPeopleSchema) {}

export class StatsDTO extends createZodDto(
  z.object({
    state: stateSchema,
    districtType: z.string(),
    districtName: z.string(),
  }),
) {}

export const samplePeopleSchema = z
  .object({
    state: stateSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    electionYear: electionYearSchema,
    size: z.coerce.number().int().min(1).max(10000).optional().default(500),
    full: booleanDefault(true),
    hasCellPhone: z.coerce.boolean().optional(),
    excludeIds: z.array(z.string().uuid()).optional(),
  })
  .refine(
    (v) =>
      (!!v.districtType && !!v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName are required together unless a valid statewide claim is present',
  )

export class SamplePeopleDTO extends createZodDto(samplePeopleSchema) {}

const getPersonParamsSchema = z.object({
  id: z.string().uuid(),
})

export class GetPersonParamsDTO extends createZodDto(getPersonParamsSchema) {}

export class GetPersonQueryDTO extends createZodDto(
  z.object({
    state: stateSchema,
  }),
) {}

export type ListPeopleSchema = z.infer<typeof listPeopleSchema>
export type DownloadPeopleSchema = z.infer<typeof downloadPeopleSchema>
