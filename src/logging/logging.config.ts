import { IncomingMessage } from 'http'
import { Params } from 'nestjs-pino'
import { ServerResponse } from 'http'

const REQUEST_LOGGED_HEADERS = ['user-agent', 'origin']
const RESPONSE_LOGGED_HEADERS = ['content-type', 'content-length']

export const loggingConfig: Params = {
  pinoHttp: {
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
    customProps: (req: IncomingMessage) => ({
      requestId: req.id,
    }),
  },
}
