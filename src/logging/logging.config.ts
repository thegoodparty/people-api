import { IncomingMessage } from 'http'
import { Params } from 'nestjs-pino'
import { ServerResponse } from 'http'
import type { GpLogContext } from 'src/monitoring/request-context'

const REQUEST_LOGGED_HEADERS = ['user-agent', 'origin']
const RESPONSE_LOGGED_HEADERS = ['content-type', 'content-length']

type RequestWithGpContext = IncomingMessage & {
  id?: string | number
  gpLogContext?: GpLogContext
}

export const loggingConfig: Params = {
  pinoHttp: {
    level: process.env.LOG_LEVEL,
    customErrorMessage: () => 'Sending HTTP response',
    customSuccessMessage: () => 'Sending HTTP response',
    customReceivedMessage: () => 'HTTP request received',
    customAttributeKeys: {
      req: 'request',
      res: 'response',
      err: 'error',
      responseTime: 'responseTimeMs',
    },
    serializers: {
      req: (req: IncomingMessage) => ({
        method: req.method,
        url: req.url,
        headers: Object.fromEntries(
          Object.entries(req.headers).filter(([key]) =>
            REQUEST_LOGGED_HEADERS.includes(key),
          ),
        ),
      }),
      res: (res: ServerResponse) => ({
        statusCode: res.statusCode,
        headers: Object.fromEntries(
          Object.entries(
            // @ts-expect-error - res.headers is not typed
            res.headers,
          ).filter(([key]) => RESPONSE_LOGGED_HEADERS.includes(key)),
        ),
      }),
    },
    customProps: (req: IncomingMessage) => {
      const request = req as RequestWithGpContext
      const requestId =
        request.id !== undefined ? String(request.id) : undefined
      return {
        ...(requestId ? { requestId } : {}),
        ...(request.gpLogContext ? { gp: request.gpLogContext } : {}),
      }
    },
  },
}
