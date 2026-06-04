import type { Prisma } from '../../generated/prisma'
import type { PoolClient } from 'pg'

/**
 * Converts a `Prisma.Sql` parameterized statement into a fully inlined SQL
 * string suitable for use inside `COPY (...) TO STDOUT`. PostgreSQL does not
 * accept bind parameters inside `COPY`, so we must embed every value
 * literally and rely on `pg`'s `escapeLiteral` for SQL-injection safety.
 *
 * This depends on `Prisma.Sql` exposing `.strings` and `.values` (stable in
 * `@prisma/client` 5/6). The `inlinePrismaSql` unit tests will fail loudly
 * if Prisma changes this contract.
 *
 * Pass `null` for `client` when escaping for tests; a minimal escape using
 * single-quote doubling will be used as a fallback. Production callers must
 * pass a real `PoolClient` so that the official `pg` escape is used.
 */
export function inlinePrismaSql(
  s: Prisma.Sql,
  client: Pick<PoolClient, 'escapeLiteral'> | null,
): string {
  const escape = (raw: string): string =>
    client?.escapeLiteral
      ? client.escapeLiteral(raw)
      : `'${raw.replace(/'/g, "''")}'`

  const { strings, values } = s
  let out = ''
  for (let i = 0; i < strings.length; i++) {
    out += strings[i]
    if (i < values.length) {
      out += formatValue(values[i], escape)
    }
  }
  return out
}

function formatValue(value: unknown, escape: (raw: string) => string): string {
  if (value === null || value === undefined) {
    return 'NULL'
  }
  if (typeof value === 'boolean') {
    return value ? 'TRUE' : 'FALSE'
  }
  if (typeof value === 'number') {
    if (!Number.isFinite(value)) {
      throw new Error(`Cannot inline non-finite number: ${String(value)}`)
    }
    return String(value)
  }
  if (typeof value === 'bigint') {
    return value.toString()
  }
  if (value instanceof Date) {
    return escape(value.toISOString())
  }
  if (Buffer.isBuffer(value)) {
    return `'\\x${value.toString('hex')}'::bytea`
  }
  if (Array.isArray(value)) {
    const items = value.map((v) => formatValue(v, escape)).join(', ')
    return `ARRAY[${items}]`
  }
  if (isPrismaSqlLike(value)) {
    return inlineNestedSql(value, escape)
  }
  return escape(String(value))
}

function isPrismaSqlLike(
  value: unknown,
): value is { strings: readonly string[]; values: readonly unknown[] } {
  if (typeof value !== 'object' || value === null) return false
  const v = value as { strings?: unknown; values?: unknown }
  return Array.isArray(v.strings) && Array.isArray(v.values)
}

function inlineNestedSql(
  s: { strings: readonly string[]; values: readonly unknown[] },
  escape: (raw: string) => string,
): string {
  const { strings, values } = s
  let out = ''
  for (let i = 0; i < strings.length; i++) {
    out += strings[i]
    if (i < values.length) {
      out += formatValue(values[i], escape)
    }
  }
  return out
}
