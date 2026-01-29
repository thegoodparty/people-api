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
  ENDPOINT_GROUP_PEOPLE,
  getProp,
  GP_ATTR_ENDPOINT_GROUP,
  GP_ATTR_OPERATION,
  OP_LIST,
  OP_SAMPLE,
  OP_STATS,
  REQ_KEY_FILTERS,
  type GpLogContext,
  type JsonObject,
  type S2SPayload,
} from './request-context'

const HEALTH_PATH_PREFIX = '/v1/health'
const SLOW_REQUEST_EVENT_NAME = 'PeopleApiSlowRequest'
const TRANSACTION_NAME_SEPARATOR = '/'

const THRESHOLD_MS_LIST_NO_FILTERS = 2000
const THRESHOLD_MS_LIST_WITH_FILTERS = 5000
const THRESHOLD_MS_SAMPLE = 30000
const THRESHOLD_MS_STATS = 400

@Injectable()
export class NewRelicInterceptor implements NestInterceptor {
  intercept<T>(context: ExecutionContext, next: CallHandler<T>): Observable<T> {
    const httpCtx = context.switchToHttp()
    const req = httpCtx.getRequest<RequestWithGpContext>()

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

    const slowThresholdMs = getSlowThresholdMs({
      endpointGroup: apmAttributes[GP_ATTR_ENDPOINT_GROUP],
      operation: apmAttributes[GP_ATTR_OPERATION],
      body: req.body,
      query: req.query,
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

        const res = httpCtx.getResponse<{ statusCode?: number }>()
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

function hasFilters(
  body: JsonObject | undefined,
  query: JsonObject | undefined,
): boolean {
  const filters =
    getProp(body, REQ_KEY_FILTERS) ?? getProp(query, REQ_KEY_FILTERS)
  return (
    typeof filters === 'object' &&
    filters !== null &&
    !Array.isArray(filters) &&
    Object.keys(filters).length > 0
  )
}

function getSlowThresholdMs(input: {
  endpointGroup: string | undefined
  operation: string | undefined
  body: JsonObject | undefined
  query: JsonObject | undefined
}): number | undefined {
  if (input.endpointGroup !== ENDPOINT_GROUP_PEOPLE || !input.operation) {
    return undefined
  }

  switch (input.operation) {
    case OP_SAMPLE:
      return THRESHOLD_MS_SAMPLE
    case OP_STATS:
      return THRESHOLD_MS_STATS
    case OP_LIST:
      return hasFilters(input.body, input.query)
        ? THRESHOLD_MS_LIST_WITH_FILTERS
        : THRESHOLD_MS_LIST_NO_FILTERS
    default:
      return undefined
  }
}

type RequestWithGpContext = {
  url?: string
  body?: JsonObject
  query?: JsonObject
  params?: JsonObject
  s2s?: S2SPayload
  gpLogContext?: GpLogContext
}
