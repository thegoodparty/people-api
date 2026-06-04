import { Prisma } from '../../generated/prisma'
import { FilterData } from '../schemas/filters.schema'
import { buildVoterFiltersSql } from './filters.sql.utils'

export const getNormalizedPhoneNumber = (phone: string): string | null => {
  if (!/^\d+$/.test(phone)) {
    return null
  }

  if (![11, 10].includes(phone.length)) {
    return null
  }

  const digits =
    phone.length === 11 && phone.startsWith('1') ? phone.slice(1) : phone

  const area = digits.slice(0, 3)
  const prefix = digits.slice(3, 6)
  const line = digits.slice(6)
  return `(${area}) ${prefix}-${line}`
}

/**
 * Build the WHERE clause shared by the people list, count, and CSV-download
 * SQL. Returns `Prisma.empty` when there are no predicates.
 *
 * When `districtId` is set the caller is expected to have joined
 * `green."DistrictVoter" dv ON v."State" = dv."State" AND v."id" = dv."voter_id"`.
 */
export const buildVoterWhereSql = (args: {
  state: string
  districtId?: string | null
  filters: FilterData
  search?: string
}): Prisma.Sql => {
  const { state, districtId } = args

  const parts: Prisma.Sql[] = []
  parts.push(Prisma.sql`v."State" = CAST(${state}::text AS "public"."USState")`)
  if (districtId) {
    parts.push(
      Prisma.sql`dv."State" = CAST(${state}::text AS "public"."USState")`,
    )
    parts.push(Prisma.sql`dv."district_id" = ${districtId}::uuid`)
    parts.push(Prisma.sql`dv."voter_id" IS NOT NULL`)
  }
  const search = args.search?.trim()
  if (search) {
    const phone = getNormalizedPhoneNumber(search)
    if (phone) {
      parts.push(
        Prisma.sql`(v."VoterTelephones_CellPhoneFormatted" = ${phone} OR v."VoterTelephones_LandlineFormatted" = ${phone})`,
      )
    } else {
      const tokens = search.split(/\s+/).filter(Boolean)
      if (tokens.length === 1) {
        parts.push(
          Prisma.sql`(v."FirstName" = ${tokens[0]} OR v."LastName" = ${tokens[0]})`,
        )
      } else if (tokens.length >= 2) {
        parts.push(
          Prisma.sql`(v."FirstName" = ${tokens[0]} AND v."LastName" = ${tokens[1]})`,
        )
      }
    }
  }
  const voterFiltersSql = buildVoterFiltersSql(args.filters)
  if (voterFiltersSql) {
    parts.push(voterFiltersSql)
  }
  return parts.length
    ? Prisma.sql`WHERE ${Prisma.join(parts, ' AND ')}`
    : Prisma.empty
}
