import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from "@nestjs/common";
import { Observable } from "rxjs";


@Injectable()
export class NewRelicInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    const httpCtx = context.switchToHttp()
    const req = httpCtx.getRequest()
    const res = httpCtx.getResponse()

    const start = Date.now()
  }
}