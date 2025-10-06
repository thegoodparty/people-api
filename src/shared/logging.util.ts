import { Prisma } from '@prisma/client'

function isPrismaKnownRequestError(
  error: unknown,
): error is Prisma.PrismaClientKnownRequestError {
  return error instanceof Prisma.PrismaClientKnownRequestError
}

function buildLogObject(error: unknown): Record<string, unknown> {
  if (error instanceof Error) {
    const base: Record<string, unknown> = {
      name: error.name,
      message: error.message,
      stack: error.stack,
    }

    if (isPrismaKnownRequestError(error)) {
      base.code = error.code
      base.clientVersion = error.clientVersion
      base.meta = error.meta
    }

    const cause = (error as Error & { cause?: unknown }).cause
    if (cause !== undefined) {
      base.cause = buildLogObject(cause)
    }

    return base
  }

  return { value: error }
}

function getSafeReplacer() {
  const seen = new WeakSet<object>()
  return (_key: string, value: unknown) => {
    if (typeof value === 'object' && value !== null) {
      if (seen.has(value as object)) {
        return '[Circular]'
      }
      seen.add(value as object)
    }
    return value
  }
}

export function serializeError(error: unknown): string {
  return JSON.stringify(buildLogObject(error), getSafeReplacer())
}

export function errorToLogObject(error: unknown): Record<string, unknown> {
  return buildLogObject(error)
}
