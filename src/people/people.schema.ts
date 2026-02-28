import { createZodDto } from 'nestjs-zod'
import { USState } from '@prisma/client'
import { z } from 'zod'

import { filtersSchema } from './schemas/filters.schema'

export const STATE_DISTRICT_TYPE = 'State'

const stateSchema = z.preprocess(
  (v) => (typeof v === 'string' ? v.toUpperCase() : v),
  z.nativeEnum(USState),
)

const districtIdSchema = z.string().uuid().optional()

const districtEitherRefine = (v: {
  districtId?: string
  state?: string
  districtType?: string
  districtName?: string
}) =>
  (!!v.districtId && !v.districtType && !v.districtName) ||
  (!!v.state && !!v.districtType && !!v.districtName) ||
  (!!v.state && !v.districtId && !v.districtType && !v.districtName)

const districtEitherMessage =
  'Either districtId only, or state + districtType + districtName, or state only'

const districtStateNameRefine = (v: {
  districtType?: string
  districtName?: string
  state?: string
}) =>
  v.districtType !== STATE_DISTRICT_TYPE ||
  (v.districtName != null &&
    v.state != null &&
    v.districtName.toUpperCase() === v.state.toUpperCase())

const districtStateNameMessage =
  'When districtType is State, districtName must equal state'

const statsDistrictRefine = (v: {
  districtId?: string
  state?: string
  districtType?: string
  districtName?: string
}) =>
  (!!v.districtId && !v.districtType && !v.districtName) ||
  (!!v.state && !!v.districtType && !!v.districtName)

const statsDistrictMessage =
  'Either districtId only, or state + districtType + districtName'

export const listPeopleSchema = z
  .object({
    state: stateSchema.optional(),
    districtId: districtIdSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    filters: filtersSchema,
    search: z.string().optional(),
    resultsPerPage: z.coerce.number().optional().default(50),
    page: z.coerce.number().optional().default(1),
  })
  .refine(districtEitherRefine, districtEitherMessage)
  .refine(districtStateNameRefine, districtStateNameMessage)

export class ListPeopleDTO extends createZodDto(listPeopleSchema) {}

export const downloadPeopleSchema = z
  .object({
    state: stateSchema.optional(),
    districtId: districtIdSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    electionLocation: z.string().optional(),
    electionType: z.string().optional(),
    filters: filtersSchema,
  })
  .refine(districtEitherRefine, districtEitherMessage)
  .refine(districtStateNameRefine, districtStateNameMessage)

export class DownloadPeopleDTO extends createZodDto(downloadPeopleSchema) {}

export class StatsDTO extends createZodDto(
  z
    .object({
      state: stateSchema.optional(),
      districtId: districtIdSchema,
      districtType: z.string().optional(),
      districtName: z.string().optional(),
    })
    .refine(statsDistrictRefine, statsDistrictMessage)
    .refine(districtStateNameRefine, districtStateNameMessage),
) {}

export const samplePeopleSchema = z
  .object({
    state: stateSchema.optional(),
    districtId: districtIdSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
    size: z.coerce.number().int().min(1).max(10000).optional().default(500),
    hasCellPhone: z.coerce.boolean().optional(),
    excludeIds: z.array(z.string().uuid()).optional(),
  })
  .refine(districtEitherRefine, districtEitherMessage)
  .refine(districtStateNameRefine, districtStateNameMessage)

export class SamplePeopleDTO extends createZodDto(samplePeopleSchema) {}

export class GetPersonParamsDTO extends createZodDto(
  z.object({
    id: z.string().uuid(),
  }),
) {}

export const getPersonQuerySchema = z
  .object({
    state: stateSchema.optional(),
    districtId: districtIdSchema,
    districtType: z.string().optional(),
    districtName: z.string().optional(),
  })
  .refine(districtEitherRefine, districtEitherMessage)
  .refine(districtStateNameRefine, districtStateNameMessage)

export class GetPersonQueryDTO extends createZodDto(getPersonQuerySchema) {}

export type ListPeopleSchema = z.infer<typeof listPeopleSchema>
export type DownloadPeopleSchema = z.infer<typeof downloadPeopleSchema>
