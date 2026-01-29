import {
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
} from '@nestjs/common'
import newrelic from 'newrelic'
import { Observable } from 'rxjs'
import { finalize } from 'rxjs/operators'
import {
  buildGpApmAttributes,
  buildGpLogContext,
  type GpLogContext,
  type JsonValue,
  type JsonObject,
  type S2SPayload,
} from './request-context'

const HEALTH_PATH_PREFIX = '/v1/health' as const
const SLOW_REQUEST_EVENT_NAME = 'PeopleApiSlowRequest' as const
const TRANSACTION_NAME_SEPARATOR = '/' as const

const GP_ATTR_ENDPOINT_GROUP = 'gp.endpointGroup' as const
const GP_ATTR_OPERATION = 'gp.operation' as const

const ENDPOINT_GROUP_PEOPLE = 'people' as const
const OP_LIST = 'list' as const
const OP_SAMPLE = 'sample' as const
const OP_STATS = 'stats' as const

const THRESHOLD_MS_LIST_NO_FILTERS = 2000 as const
const THRESHOLD_MS_LIST_WITH_FILTERS = 5000 as const
const THRESHOLD_MS_SAMPLE = 30000 as const
const THRESHOLD_MS_STATS = 400 as const
const REQ_KEY_FILTERS = 'filters' as const

@Injectable()
export class NewRelicInterceptor implements NestInterceptor {
  intercept<T>(context: ExecutionContext, next: CallHandler<T>): Observable<T> {
    const httpCtx = context.switchToHttp()
    const req = httpCtx.getRequest<RequestWithGpContext>()
    const res = httpCtx.getResponse<{ statusCode?: number }>()

    const start = Date.now()

    const url = req?.url
    if (typeof url === 'string' && url.startsWith(HEALTH_PATH_PREFIX)) {
      return next.handle()
    }

    const controllerName = context.getClass().name
    const handlerName = context.getHandler().name

    const apmAttributes = buildGpApmAttributes({
      controllerName,
      handlerName,
      body: req.body,
      query: req.query,
      params: req.params,
      s2s: req.s2s,
    })

    newrelic.addCustomAttributes(apmAttributes)
    newrelic.setTransactionName(
      `${controllerName}${TRANSACTION_NAME_SEPARATOR}${handlerName}`,
    )

    const filtersValue: JsonValue | undefined =
      (req.body ? req.body[REQ_KEY_FILTERS] : undefined) ??
      (req.query ? req.query[REQ_KEY_FILTERS] : undefined)
    const hasFilters = hasAnyFilters(filtersValue)

    const slowThresholdMs = getSlowThresholdMs({
      endpointGroup: apmAttributes[GP_ATTR_ENDPOINT_GROUP],
      operation: apmAttributes[GP_ATTR_OPERATION],
      hasFilters,
    })
    return next.handle().pipe(
      finalize(() => {
        const durationMs = Date.now() - start
        if (slowThresholdMs === undefined) {
          return
        }
        if (durationMs < slowThresholdMs) {
          return
        }

        const logContext = buildGpLogContext({
          body: req.body,
          query: req.query,
        })
        req.gpLogContext = logContext

        newrelic.recordCustomEvent(SLOW_REQUEST_EVENT_NAME, {
          ...apmAttributes,
          ...logContext,
          durationMs,
          thresholdMs: slowThresholdMs,
          statusCode:
            typeof res?.statusCode === 'number' ? res.statusCode : undefined,
        })
      }),
    )
  }
}

function getSlowThresholdMs(input: {
  endpointGroup: string | undefined
  operation: string | undefined
  hasFilters: boolean
}): number | undefined {
  if (input.endpointGroup !== ENDPOINT_GROUP_PEOPLE || !input.operation) {
    return undefined
  }

  if (input.operation === OP_LIST) {
    return input.hasFilters
      ? THRESHOLD_MS_LIST_WITH_FILTERS
      : THRESHOLD_MS_LIST_NO_FILTERS
  }

  if (input.operation === OP_SAMPLE) {
    return THRESHOLD_MS_SAMPLE
  }

  return input.operation === OP_STATS ? THRESHOLD_MS_STATS : undefined
}

function isJsonObject(value: JsonValue | undefined): value is JsonObject {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function hasAnyFilters(filters: JsonValue | undefined): boolean {
  if (!isJsonObject(filters)) {
    return false
  }

  for (const key in filters) {
    if (Object.prototype.hasOwnProperty.call(filters, key)) {
      return true
    }
  }

  return false
}

type RequestWithGpContext = {
  url?: string
  body?: JsonObject
  query?: JsonObject
  params?: JsonObject
  s2s?: S2SPayload
  gpLogContext?: GpLogContext
}
