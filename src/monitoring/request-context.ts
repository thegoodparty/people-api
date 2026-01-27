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

const MAX_FILTER_KEYS = 50
const MAX_FILTER_OPERATORS = 25
const MAX_FILTER_SUMMARY_LENGTH = 500

function isJsonObject(value: JsonValue): value is JsonObject {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
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
  if (!isJsonObject(filters)) {
    return {}
  }

  const keys = Object.keys(filters).slice(0, MAX_FILTER_KEYS)
  const operatorSet = new Set<string>()
  const parts: string[] = []

  for (const key of keys) {
    const value = getObjectKey(filters, key)
    if (typeof value === 'boolean') {
      parts.push(`${key}:boolean`)
      continue
    }

    if (!isJsonObject(value)) {
      parts.push(`${key}:invalid`)
      continue
    }

    const ops = Object.keys(value)
    for (const op of ops) {
      operatorSet.size < MAX_FILTER_OPERATORS ? operatorSet.add(op) : undefined
    }

    const inVal = getObjectKey(value, 'in')
    const inCount = Array.isArray(inVal) ? inVal.length : undefined
    const eqVal = getObjectKey(value, 'eq')
    const hasEq = eqVal !== undefined
    const gteVal = getObjectKey(value, 'gte')
    const hasGte = gteVal !== undefined
    const lteVal = getObjectKey(value, 'lte')
    const hasLte = lteVal !== undefined
    const isVal = getObjectKey(value, 'is')
    const hasIs = typeof isVal === 'string'

    const fragment = [
      'in' in value && inCount !== undefined ? `in(${inCount})` : undefined,
      hasEq ? 'eq' : undefined,
      hasGte ? 'gte' : undefined,
      hasLte ? 'lte' : undefined,
      hasIs ? 'is' : undefined,
    ]
      .filter((v): v is string => v !== undefined)
      .join(',')

    parts.push(fragment ? `${key}:${fragment}` : `${key}:object`)
  }

  const filtersSummary = parts.join('|').slice(0, MAX_FILTER_SUMMARY_LENGTH)
  const filtersOperators = Array.from(operatorSet)

  return { filtersKeys: keys, filtersOperators, filtersSummary }
}

function normalizeOperationName(
  controllerName: string,
  handlerName: string,
): { endpointGroup: string; operation: string } {
  const endpointGroup = controllerName.endsWith('Controller')
    ? controllerName.slice(0, -'Controller'.length)
    : controllerName

  const operation =
    endpointGroup === 'People' &&
    (handlerName === 'samplePeoplePost' || handlerName === 'samplePeople')
      ? 'sample'
      : handlerName

  return { endpointGroup: endpointGroup.toLowerCase(), operation }
}

export function buildGpRequestContext(input: {
  controllerName: string
  handlerName: string
  query?: JsonObject
  body?: JsonObject
  params?: JsonObject
  s2s?: S2SPayload
}): { apmAttributes: GpApmAttributes; logContext: GpLogContext } {
  const { endpointGroup, operation } = normalizeOperationName(
    input.controllerName,
    input.handlerName,
  )

  const body = input.body ?? {}
  const query = input.query ?? {}
  const params = input.params ?? {}

  const state =
    asString(getObjectKey(body, 'state')) ??
    asString(getObjectKey(query, 'state')) ??
    asString(getObjectKey(params, 'state'))

  const districtType =
    asString(getObjectKey(body, 'districtType')) ??
    asString(getObjectKey(query, 'districtType'))

  const districtName =
    asString(getObjectKey(body, 'districtName')) ??
    asString(getObjectKey(query, 'districtName'))

  const apmAttributes: GpApmAttributes = {
    'gp.endpointGroup': endpointGroup,
    'gp.operation': operation,
    ...(state ? { 'gp.state': state } : {}),
    ...(districtType ? { 'gp.districtType': districtType } : {}),
  }

  const excludeIdsCount = Array.isArray(getObjectKey(body, 'excludeIds'))
    ? (getObjectKey(body, 'excludeIds') as JsonValue[]).length
    : undefined

  const filtersFromBody = getObjectKey(body, 'filters')
  const filtersFromQuery = getObjectKey(query, 'filters')
  const { filtersKeys, filtersOperators, filtersSummary } =
    extractFiltersSummary(filtersFromBody ?? filtersFromQuery)

  const logContext: GpLogContext = {
    ...(districtName ? { districtName } : {}),
    ...(filtersKeys ? { filtersKeys } : {}),
    ...(filtersOperators ? { filtersOperators } : {}),
    ...(filtersSummary ? { filtersSummary } : {}),
    ...(excludeIdsCount !== undefined ? { excludeIdsCount } : {}),
    ...(asNumber(getObjectKey(query, 'page')) !== undefined
      ? { page: asNumber(getObjectKey(query, 'page')) as number }
      : {}),
    ...(asNumber(getObjectKey(query, 'resultsPerPage')) !== undefined
      ? {
          resultsPerPage: asNumber(
            getObjectKey(query, 'resultsPerPage'),
          ) as number,
        }
      : {}),
    ...(asNumber(getObjectKey(body, 'electionYear')) !== undefined
      ? { electionYear: asNumber(getObjectKey(body, 'electionYear')) as number }
      : {}),
  }

  return { apmAttributes, logContext }
}
