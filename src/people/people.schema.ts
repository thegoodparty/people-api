import { createZodDto } from 'nestjs-zod'
import { z } from 'zod'

import { filtersSchema } from './schemas/filters.schema'

const withDistrictInput = <T extends z.ZodRawShape>(shape: T) =>
  z.object({ districtId: z.string().uuid() }).extend(shape)

export const listPeopleSchema = withDistrictInput({
  filters: filtersSchema,
  search: z.string().optional(),
  resultsPerPage: z.coerce.number().optional().default(50),
  page: z.coerce.number().optional().default(1),
})

export class ListPeopleDTO extends createZodDto(listPeopleSchema) {}

export const downloadPeopleSchema = withDistrictInput({
  filters: filtersSchema,
})

export class DownloadPeopleDTO extends createZodDto(downloadPeopleSchema) {}

export class StatsDTO extends createZodDto(withDistrictInput({})) {}

export const samplePeopleSchema = withDistrictInput({
  size: z.coerce.number().int().min(1).max(10000).optional().default(500),
  hasCellPhone: z.coerce.boolean().optional(),
  excludeIds: z.array(z.string().uuid()).optional(),
})

export class SamplePeopleDTO extends createZodDto(samplePeopleSchema) {}

export class GetPersonParamsDTO extends createZodDto(
  z.object({
    id: z.string().uuid(),
  }),
) {}

export const getPersonQuerySchema = withDistrictInput({})

export class GetPersonQueryDTO extends createZodDto(getPersonQuerySchema) {}

export type ListPeopleSchema = z.infer<typeof listPeopleSchema>
export type DownloadPeopleSchema = z.infer<typeof downloadPeopleSchema>
