export type GpApmAttributes = Partial<{
  'gp.state': string
  'gp.districtType': string
  'gp.endpointGroup': string
  'gp.operation': string
}>

export type GpLogContext = Partial<{
  districtName: string
  filtersSummary: string
  excludeIdsCount: number
  page: number
  resultsPerPage: number
  electionYear: number
}>

export type Primitive = string | number | boolean | null | undefined
export type JsonValue = Primitive | JsonObject | JsonValue[]
export type JsonObject = { [key: string]: JsonValue }

export type S2SPayload = {
  allowStatewide?: boolean
  state?: string
}

const GP_ATTR_STATE = 'gp.state'
const GP_ATTR_DISTRICT_TYPE = 'gp.districtType'
export const GP_ATTR_ENDPOINT_GROUP = 'gp.endpointGroup'
export const GP_ATTR_OPERATION = 'gp.operation'

const REQ_KEY_STATE = 'state'
const REQ_KEY_DISTRICT_TYPE = 'districtType'
const REQ_KEY_DISTRICT_NAME = 'districtName'
const REQ_KEY_EXCLUDE_IDS = 'excludeIds'
export const REQ_KEY_FILTERS = 'filters'
const REQ_KEY_PAGE = 'page'
const REQ_KEY_RESULTS_PER_PAGE = 'resultsPerPage'
const REQ_KEY_ELECTION_YEAR = 'electionYear'

const CONTROLLER_SUFFIX = 'Controller'
const PEOPLE_CONTROLLER_BASE = 'People'
const HANDLER_SAMPLE_POST = 'samplePeoplePost'
const HANDLER_SAMPLE_GET = 'samplePeople'
export const OP_SAMPLE = 'sample'

const HANDLER_LIST = 'listPeople'
const HANDLER_STATS = 'getStats'
export const OP_LIST = 'list'
export const OP_STATS = 'stats'
export const ENDPOINT_GROUP_PEOPLE = 'people'

const MAX_FILTER_SUMMARY_LENGTH = 500
const TRUNCATION_SENTINEL = '…'

export function getProp(obj: JsonObject | undefined, key: string): JsonValue {
  return obj !== undefined && key in obj ? obj[key] : undefined
}

function getFirstString(
  key: string,
  ...sources: (JsonObject | undefined)[]
): string | undefined {
  for (const src of sources) {
    const val = getProp(src, key)
    if (typeof val === 'string') return val
  }
  return undefined
}

function safeStringify(value: JsonValue): string {
  try {
    return JSON.stringify(value) ?? ''
  } catch {
    return ''
  }
}

function truncateString(value: string, maxLength: number): string {
  return value.length > maxLength
    ? `${value.slice(0, Math.max(0, maxLength - TRUNCATION_SENTINEL.length))}${TRUNCATION_SENTINEL}`
    : value
}

function extractFiltersSummary(filters: JsonValue): {
  filtersSummary?: string
} {
  if (filters === undefined) return {}
  const filtersSummary = truncateString(
    safeStringify(filters),
    MAX_FILTER_SUMMARY_LENGTH,
  )
  return filtersSummary ? { filtersSummary } : {}
}

function normalizeOperationName(
  controllerName: string,
  handlerName: string,
): { endpointGroup: string; operation: string } {
  const endpointGroup = controllerName.endsWith(CONTROLLER_SUFFIX)
    ? controllerName.slice(0, -CONTROLLER_SUFFIX.length)
    : controllerName

  const operation =
    endpointGroup === PEOPLE_CONTROLLER_BASE &&
    (handlerName === HANDLER_SAMPLE_POST || handlerName === HANDLER_SAMPLE_GET)
      ? OP_SAMPLE
      : endpointGroup === PEOPLE_CONTROLLER_BASE && handlerName === HANDLER_LIST
        ? OP_LIST
        : endpointGroup === PEOPLE_CONTROLLER_BASE &&
            handlerName === HANDLER_STATS
          ? OP_STATS
          : handlerName

  return { endpointGroup: endpointGroup.toLowerCase(), operation }
}

export function buildGpApmAttributes(input: {
  controllerName: string
  handlerName: string
  query?: JsonObject
  body?: JsonObject
  params?: JsonObject
  s2s?: S2SPayload
}): GpApmAttributes {
  const { endpointGroup, operation } = normalizeOperationName(
    input.controllerName,
    input.handlerName,
  )

  const state = getFirstString(
    REQ_KEY_STATE,
    input.body,
    input.query,
    input.params,
  )
  const districtType = getFirstString(
    REQ_KEY_DISTRICT_TYPE,
    input.body,
    input.query,
  )

  const result: GpApmAttributes = {
    [GP_ATTR_ENDPOINT_GROUP]: endpointGroup,
    [GP_ATTR_OPERATION]: operation,
  }
  if (state) result[GP_ATTR_STATE] = state
  if (districtType) result[GP_ATTR_DISTRICT_TYPE] = districtType
  return result
}

export function buildGpLogContext(input: {
  query?: JsonObject
  body?: JsonObject
}): GpLogContext {
  const { body, query } = input

  const districtName = getFirstString(REQ_KEY_DISTRICT_NAME, body, query)
  const excludeIds = getProp(body, REQ_KEY_EXCLUDE_IDS)
  const filters =
    getProp(body, REQ_KEY_FILTERS) ?? getProp(query, REQ_KEY_FILTERS)
  const { filtersSummary } = extractFiltersSummary(filters)
  const pageValue = getProp(query, REQ_KEY_PAGE)
  const resultsPerPageValue = getProp(query, REQ_KEY_RESULTS_PER_PAGE)
  const electionYearValue = getProp(body, REQ_KEY_ELECTION_YEAR)

  const result: GpLogContext = {}
  if (districtName) result.districtName = districtName
  if (filtersSummary) result.filtersSummary = filtersSummary
  if (Array.isArray(excludeIds)) result.excludeIdsCount = excludeIds.length
  if (typeof pageValue === 'number') result.page = pageValue
  if (typeof resultsPerPageValue === 'number')
    result.resultsPerPage = resultsPerPageValue
  if (typeof electionYearValue === 'number')
    result.electionYear = electionYearValue
  return result
}
