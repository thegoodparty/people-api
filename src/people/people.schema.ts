import { createZodDto } from 'nestjs-zod'
import { USState } from '@prisma/client'
import { z } from 'zod'

import { filtersSchema } from './schemas/filters.schema'

// ---- Shared atoms to keep schemas DRY ----
const stateSchema = z.preprocess(
  (v) => (typeof v === 'string' ? v.toUpperCase() : v),
  z.nativeEnum(USState),
)

export const listPeopleSchema = z.object({
  state: stateSchema,
  districtType: z.string().optional(),
  districtName: z.string().optional(),
  filters: filtersSchema,
  search: z.string().optional(),
  resultsPerPage: z.coerce.number().optional().default(50),
  page: z.coerce.number().optional().default(1),
})

export class ListPeopleDTO extends createZodDto(listPeopleSchema) {}

export const downloadPeopleSchema = z
  .object({
    state: stateSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    electionLocation: z.string().optional(),
    electionType: z.string().optional(),
    filters: filtersSchema,
  })
  .refine(
    (v) =>
      (!!v.districtType && !!v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName are required together',
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
    size: z.coerce.number().int().min(1).max(10000).optional().default(500),
    hasCellPhone: z.coerce.boolean().optional(),
    excludeIds: z.array(z.string().uuid()).optional(),
  })
  .refine(
    (v) =>
      (!!v.districtType && !!v.districtName) ||
      (!v.districtType && !v.districtName),
    'districtType and districtName are required together',
  )

export class SamplePeopleDTO extends createZodDto(samplePeopleSchema) {}

export class GetPersonParamsDTO extends createZodDto(
  z.object({
    id: z.string().uuid(),
  }),
) {}

export class GetPersonQueryDTO extends createZodDto(
  z
    .object({
      state: stateSchema,
      districtType: z.string().optional(),
      districtName: z.string().optional(),
    })
    .refine(
      (v) =>
        (!!v.districtType && !!v.districtName) ||
        (!v.districtType && !v.districtName),
      'districtType and districtName are required together',
    ),
) {}

export type ListPeopleSchema = z.infer<typeof listPeopleSchema>
export type DownloadPeopleSchema = z.infer<typeof downloadPeopleSchema>
