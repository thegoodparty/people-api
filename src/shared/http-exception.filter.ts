import { ArgumentsHost, Catch, Logger } from '@nestjs/common'
import { BaseExceptionFilter, HttpAdapterHost } from '@nestjs/core'
import { serializeError } from './logging.util'

@Catch()
export class AllExceptionsFilter extends BaseExceptionFilter {
  private readonly logger = new Logger('Exceptions')

  constructor(httpAdapterHost: HttpAdapterHost) {
    super(httpAdapterHost.httpAdapter)
  }

  catch(exception: unknown, host: ArgumentsHost): void {
    this.logger.error('Caught exception in AllExceptionsFilter', {
      err: exception,
      error: serializeError(exception),
    })
    super.catch(exception, host)
  }
}
