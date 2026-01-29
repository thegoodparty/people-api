export type GpApmAttributes = Partial<{
  'gp.state': string
  'gp.districtType': string
  'gp.endpointGroup': string
  'gp.operation': string
}>

export type GpLogContext = Partial<{
  districtName: string
  filtersKeys: string[]
  filtersOperators: string[]
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

const GP_ATTR_STATE = 'gp.state' as const
const GP_ATTR_DISTRICT_TYPE = 'gp.districtType' as const
const GP_ATTR_ENDPOINT_GROUP = 'gp.endpointGroup' as const
const GP_ATTR_OPERATION = 'gp.operation' as const

const REQ_KEY_STATE = 'state' as const
const REQ_KEY_DISTRICT_TYPE = 'districtType' as const
const REQ_KEY_DISTRICT_NAME = 'districtName' as const
const REQ_KEY_EXCLUDE_IDS = 'excludeIds' as const
const REQ_KEY_FILTERS = 'filters' as const
const REQ_KEY_PAGE = 'page' as const
const REQ_KEY_RESULTS_PER_PAGE = 'resultsPerPage' as const
const REQ_KEY_ELECTION_YEAR = 'electionYear' as const

const CONTROLLER_SUFFIX = 'Controller' as const
const PEOPLE_CONTROLLER_BASE = 'People' as const
const HANDLER_SAMPLE_POST = 'samplePeoplePost' as const
const HANDLER_SAMPLE_GET = 'samplePeople' as const
const OP_SAMPLE = 'sample' as const

const HANDLER_LIST = 'listPeople' as const
const HANDLER_STATS = 'getStats' as const
const OP_LIST = 'list' as const
const OP_STATS = 'stats' as const

const MAX_FILTER_SUMMARY_LENGTH = 500
const TRUNCATION_SENTINEL = '…' as const

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

function asString(value: JsonValue): string | undefined {
  return typeof value === 'string' ? value : undefined
}

function asNumber(value: JsonValue): number | undefined {
  return typeof value === 'number' ? value : undefined
}

function getObjectKey(obj: JsonObject, key: string): JsonValue | undefined {
  return Object.prototype.hasOwnProperty.call(obj, key) ? obj[key] : undefined
}

// Reduces how much we're logging by producing a summary
function extractFiltersSummary(
  filters: JsonValue,
): Pick<GpLogContext, 'filtersKeys' | 'filtersOperators' | 'filtersSummary'> {
  if (filters === undefined) {
    return {}
  }

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
  const { controllerName, handlerName } = input
  const { endpointGroup, operation } = normalizeOperationName(
    controllerName,
    handlerName,
  )

  const body = input.body ?? {}
  const query = input.query ?? {}
  const params = input.params ?? {}

  const state =
    asString(getObjectKey(body, REQ_KEY_STATE)) ??
    asString(getObjectKey(query, REQ_KEY_STATE)) ??
    asString(getObjectKey(params, REQ_KEY_STATE))

  const districtType =
    asString(getObjectKey(body, REQ_KEY_DISTRICT_TYPE)) ??
    asString(getObjectKey(query, REQ_KEY_DISTRICT_TYPE))

  return {
    [GP_ATTR_ENDPOINT_GROUP]: endpointGroup,
    [GP_ATTR_OPERATION]: operation,
    ...(state ? { [GP_ATTR_STATE]: state } : {}),
    ...(districtType ? { [GP_ATTR_DISTRICT_TYPE]: districtType } : {}),
  }
}

export function buildGpLogContext(input: {
  query?: JsonObject
  body?: JsonObject
}): GpLogContext {
  const body = input.body ?? {}
  const query = input.query ?? {}

  const districtName =
    asString(getObjectKey(body, REQ_KEY_DISTRICT_NAME)) ??
    asString(getObjectKey(query, REQ_KEY_DISTRICT_NAME))

  const excludeIds = getObjectKey(body, REQ_KEY_EXCLUDE_IDS)
  const excludeIdsCount = Array.isArray(excludeIds)
    ? excludeIds.length
    : undefined

  const filtersFromBody = getObjectKey(body, REQ_KEY_FILTERS)
  const filtersFromQuery = getObjectKey(query, REQ_KEY_FILTERS)
  const { filtersKeys, filtersOperators, filtersSummary } =
    extractFiltersSummary(filtersFromBody ?? filtersFromQuery)

  return {
    ...(districtName ? { districtName } : {}),
    ...(filtersKeys ? { filtersKeys } : {}),
    ...(filtersOperators ? { filtersOperators } : {}),
    ...(filtersSummary ? { filtersSummary } : {}),
    ...(excludeIdsCount !== undefined ? { excludeIdsCount } : {}),
    ...(asNumber(getObjectKey(query, REQ_KEY_PAGE)) !== undefined
      ? { page: asNumber(getObjectKey(query, REQ_KEY_PAGE)) as number }
      : {}),
    ...(asNumber(getObjectKey(query, REQ_KEY_RESULTS_PER_PAGE)) !== undefined
      ? {
          resultsPerPage: asNumber(
            getObjectKey(query, REQ_KEY_RESULTS_PER_PAGE),
          ) as number,
        }
      : {}),
    ...(asNumber(getObjectKey(body, REQ_KEY_ELECTION_YEAR)) !== undefined
      ? {
          electionYear: asNumber(
            getObjectKey(body, REQ_KEY_ELECTION_YEAR),
          ) as number,
        }
      : {}),
  }
}
