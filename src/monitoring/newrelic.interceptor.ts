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
  buildGpRequestContext,
  type GpLogContext,
  type JsonObject,
  type S2SPayload,
} from './request-context'

@Injectable()
export class NewRelicInterceptor implements NestInterceptor {
  intercept<T>(context: ExecutionContext, next: CallHandler<T>): Observable<T> {
    const httpCtx = context.switchToHttp()
    const req = httpCtx.getRequest<RequestWithGpContext>()
    const res = httpCtx.getResponse<{ statusCode?: number }>()

    const start = Date.now()

    const url = req?.url
    if (typeof url === 'string' && url.startsWith('/v1/health')) {
      return next.handle()
    }

    const controllerName = context.getClass().name
    const handlerName = context.getHandler().name

    const { apmAttributes, logContext } = buildGpRequestContext({
      controllerName,
      handlerName,
      body: req.body,
      query: req.query,
      params: req.params,
      s2s: req.s2s,
    })

    req.gpLogContext = logContext

    newrelic.addCustomAttributes(apmAttributes)
    newrelic.setTransactionName(`${controllerName}/${handlerName}`)

    const slowThresholdMs = Number(
      process.env.NR_SLOW_REQUEST_THRESHOLD_MS ?? 0,
    )
    return next.handle().pipe(
      finalize(() => {
        const durationMs = Date.now() - start
        if (!Number.isFinite(slowThresholdMs) || slowThresholdMs <= 0) {
          return
        }
        if (durationMs < slowThresholdMs) {
          return
        }

        newrelic.recordCustomEvent('PeopleApiSlowRequest', {
          ...apmAttributes,
          durationMs,
          statusCode:
            typeof res?.statusCode === 'number' ? res.statusCode : undefined,
        })
      }),
    )
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
