import { Prisma } from '../../generated/prisma'
import { describe, expect, it } from 'vitest'
import { inlinePrismaSql } from './inlinePrismaSql.utils'

const mockClient = {
  escapeLiteral: (raw: string) => `'${raw.replace(/'/g, "''")}'`,
}

describe('inlinePrismaSql', () => {
  it('inlines a plain string value via escapeLiteral', () => {
    const sql = Prisma.sql`SELECT * FROM t WHERE name = ${'alice'}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT * FROM t WHERE name = 'alice'`,
    )
  })

  it('inlines numeric values without quotes', () => {
    const sql = Prisma.sql`SELECT * FROM t WHERE age = ${42}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT * FROM t WHERE age = 42`,
    )
  })

  it('inlines null as NULL', () => {
    const sql = Prisma.sql`SELECT * FROM t WHERE name = ${null}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT * FROM t WHERE name = NULL`,
    )
  })

  it('inlines booleans as TRUE/FALSE', () => {
    const sql = Prisma.sql`SELECT * FROM t WHERE active = ${true} OR muted = ${false}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT * FROM t WHERE active = TRUE OR muted = FALSE`,
    )
  })

  it('handles joined Prisma.Sql fragments (in / array)', () => {
    const values = ['English', 'Spanish']
    const sql = Prisma.sql`SELECT * FROM t WHERE lang = ANY(ARRAY[${Prisma.join(
      values.map((v) => Prisma.sql`${v}`),
      ', ',
    )}]::text[])`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT * FROM t WHERE lang = ANY(ARRAY['English', 'Spanish']::text[])`,
    )
  })

  it('handles integer arrays from Prisma.join', () => {
    const values = [1, 2, 3]
    const sql = Prisma.sql`v."Age_Int" = ANY(ARRAY[${Prisma.join(
      values.map((v) => Prisma.sql`${Number(v)}`),
      ', ',
    )}]::integer[])`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `v."Age_Int" = ANY(ARRAY[1, 2, 3]::integer[])`,
    )
  })

  it('escapes single quotes in string values to prevent SQL injection', () => {
    const malicious = `Robert'); DROP TABLE Students;--`
    const sql = Prisma.sql`SELECT * FROM t WHERE name = ${malicious}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT * FROM t WHERE name = 'Robert''); DROP TABLE Students;--'`,
    )
  })

  it('preserves Prisma.raw fragments (zero values, no quoting)', () => {
    const sql = Prisma.sql`SELECT v."${Prisma.raw('FirstName')}" FROM t WHERE id = ${'x'}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `SELECT v."FirstName" FROM t WHERE id = 'x'`,
    )
  })

  it('inlines nested AND clauses joined with Prisma.join', () => {
    const parts = [
      Prisma.sql`a = ${1}`,
      Prisma.sql`b = ${'x'}`,
      Prisma.sql`c IS NULL`,
    ]
    const sql = Prisma.sql`WHERE ${Prisma.join(parts, ' AND ')}`
    expect(inlinePrismaSql(sql, mockClient)).toBe(
      `WHERE a = 1 AND b = 'x' AND c IS NULL`,
    )
  })

  it('falls back to a safe default escape when no client is provided', () => {
    const sql = Prisma.sql`SELECT * FROM t WHERE name = ${"O'Brien"}`
    expect(inlinePrismaSql(sql, null)).toBe(
      `SELECT * FROM t WHERE name = 'O''Brien'`,
    )
  })

  it('throws on non-finite numbers', () => {
    const sql = Prisma.sql`SELECT ${Number.POSITIVE_INFINITY}`
    expect(() => inlinePrismaSql(sql, mockClient)).toThrow(
      /Cannot inline non-finite number/,
    )
  })
})
