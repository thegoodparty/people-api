import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common'
import { Reflector } from '@nestjs/core'
import { IS_PUBLIC_KEY } from './public.decorator'
import jwt from 'jsonwebtoken'

/**
 * Server-to-server authentication guard.
 * Accepts a Bearer token signed with PEOPLE_API_S2S_SECRET by gp-api.
 * Allows localhost access if S2S_ALLOW_LOCALHOST is truthy (for dev only).
 */
@Injectable()
export class S2SAuthGuard implements CanActivate {
  constructor(private readonly reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC_KEY, [
      context.getHandler(),
      context.getClass(),
    ])
    if (isPublic) {
      return true
    }

    const request = context.switchToHttp().getRequest()

    // Optional localhost bypass for development/testing only
    if (
      process.env.S2S_ALLOW_LOCALHOST &&
      /^true|1|yes$/i.test(process.env.S2S_ALLOW_LOCALHOST) &&
      (request.ip === '127.0.0.1' ||
        request.ip === '::1' ||
        request.hostname === 'localhost')
    ) {
      return true
    }

    const authHeader: string | undefined = request.headers['authorization']
    if (!authHeader) {
      throw new UnauthorizedException('Missing Authorization header')
    }
    const [scheme, token] = authHeader.split(' ')
    if (!/^Bearer$/i.test(scheme) || !token) {
      throw new UnauthorizedException('Invalid Authorization format')
    }

    const secret = process.env.PEOPLE_API_S2S_SECRET
    if (!secret) {
      throw new UnauthorizedException('S2S secret not configured')
    }

    try {
      const payload = jwt.verify(token, secret)
      // Optionally, enforce issuer/audience if we later standardize
      // e.g., (payload as any).iss === 'gp-api'
      request.s2s = payload
      return true
    } catch (err) {
      throw new UnauthorizedException('Invalid or expired token')
    }
  }
}
