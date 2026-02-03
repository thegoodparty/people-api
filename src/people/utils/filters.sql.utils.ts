import { Prisma } from '@prisma/client'
import { FilterData } from '../schemas/filters.schema'
import { FilterOperator } from '../schemas/filters.schema.utils'

export const buildVoterFiltersSql = (
  filterData: FilterData,
): Prisma.Sql | null => {
  const { filters, filterOperators } = filterData
  const andClauses: Prisma.Sql[] = []

  for (const filter of filters) {
    const op = filterOperators[filter]
    let sql: Prisma.Sql | null = null

    switch (filter) {
      case 'hasCellPhone':
        sql = buildBooleanFilter('VoterTelephones_CellPhoneFormatted', op)
        break
      case 'hasLandline':
        sql = buildBooleanFilter('VoterTelephones_LandlineFormatted', op)
        break
      case 'maritalStatus':
        sql = buildMappedFieldFilter(
          'Marital_Status',
          op,
          VALUE_MAPPERS.maritalStatus,
        )
        break
      case 'veteranStatus':
        sql = buildMappedFieldFilter(
          'Veteran_Status',
          op,
          VALUE_MAPPERS.veteranStatus,
        )
        break
      case 'educationLevel':
        sql = buildMappedFieldFilter(
          'Education_Of_Person',
          op,
          VALUE_MAPPERS.educationLevel,
        )
        break
      case 'ethnicity':
        sql = buildMappedFieldFilter(
          'EthnicGroups_EthnicGroup1Desc',
          op,
          VALUE_MAPPERS.ethnicity,
        )
        break
      case 'businessOwner':
        sql = buildBusinessOwnerFilter(op)
        break
      case 'presenceOfChildren':
        sql = buildMappedFieldFilter(
          'Presence_Of_Children',
          op,
          VALUE_MAPPERS.presenceOfChildren,
        )
        break
      case 'homeowner':
        sql = buildMappedFieldFilter(
          'Homeowner_Probability_Model',
          op,
          VALUE_MAPPERS.homeowner,
        )
        break
      case 'language':
        sql = buildLanguageFilter(op)
        break
      case 'estimatedIncomeAmount':
        sql = buildFieldFilter('Estimated_Income_Amount', op)
        break
      case 'estimatedIncomeAmountInt':
        sql = buildNumericFilter('Estimated_Income_Amount_Int', op)
        break
      case 'voterStatus':
        sql = buildFieldFilter('Voter_Status', op)
        break
      case 'politicalParty':
        sql = buildMappedFieldFilter(
          'Parties_Description',
          op,
          VALUE_MAPPERS.politicalParty,
        )
        break
      case 'gender':
        sql = buildMappedFieldFilter('Gender', op, VALUE_MAPPERS.gender)
        break
      case 'ageInt':
        sql = buildNumericFilter('Age_Int', op)
        break
    }

    if (sql) {
      andClauses.push(sql)
    }
  }

  if (andClauses.length === 0) return null
  return Prisma.sql`${Prisma.join(andClauses, ' AND ')}`
}

const VALUE_MAPPERS = {
  ethnicity: (value: string): string | null => {
    switch (value) {
      case 'Asian':
        return 'East and South Asian'
      case 'European':
        return 'European'
      case 'Hispanic':
        return 'Hispanic and Portuguese'
      case 'African American':
        return 'Likely African-American'
      case 'Other':
        return 'Other'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
  presenceOfChildren: (value: string): string | null => {
    switch (value) {
      case 'Yes':
        return 'Y'
      case 'No':
        return 'N'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
  homeowner: (value: string): string | null => {
    switch (value) {
      case 'Yes':
        return 'Home Owner'
      case 'Likely':
        return 'Probable Home Owner'
      case 'No':
        return 'Renter'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
  politicalParty: (value: string): string => {
    switch (value) {
      case 'Democratic':
        return 'Democratic'
      case 'Republican':
        return 'Republican'
      case 'Independent':
        return 'Non-Partisan'
      case 'Unknown':
        return 'Unknown'
      default:
        return value
    }
  },
  educationLevel: (value: string): string | null => {
    switch (value) {
      case 'None':
        return 'Did Not Complete High School Likely'
      case 'High School Diploma':
        return 'Completed High School Likely'
      case 'Technical School':
        return 'Attended Vocational/Technical School Likely'
      case 'Some College':
        return 'Attended But Did Not Complete College Likely'
      case 'College Degree':
        return 'Completed College Likely'
      case 'Graduate Degree':
        return 'Completed Graduate School Likely'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
  gender: (value: string): string | null => {
    switch (value) {
      case 'M':
        return 'M'
      case 'F':
        return 'F'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
  veteranStatus: (value: string): string | null => {
    switch (value) {
      case 'Yes':
        return 'Yes'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
  maritalStatus: (value: string): string | null => {
    switch (value) {
      case 'Inferred Married':
        return 'Inferred Married'
      case 'Inferred Single':
        return 'Inferred Single'
      case 'Married':
        return 'Married'
      case 'Single':
        return 'Single'
      case 'Unknown':
        return null
      default:
        return value
    }
  },
} as const

const buildBusinessOwnerFilter = (
  op: FilterOperator | undefined,
): Prisma.Sql | null => {
  if (!op) return null

  if (op.operator === 'eq' && op.value === 'Yes') {
    return Prisma.sql`v."Business_Owner" IS NOT NULL`
  } else if (op.operator === 'eq' && op.value === 'Unknown') {
    return Prisma.sql`v."Business_Owner" IS NULL`
  } else if (op.operator === 'in' && op.values && op.values.length > 0) {
    const values = op.values as string[]
    const hasYes = values.includes('Yes')
    const hasUnknown = values.includes('Unknown')

    if (hasYes && hasUnknown) {
      return null
    } else if (hasYes) {
      return Prisma.sql`v."Business_Owner" IS NOT NULL`
    } else if (hasUnknown) {
      return Prisma.sql`v."Business_Owner" IS NULL`
    }
  } else if (op.operator === 'is' && op.value === 'not_null') {
    return Prisma.sql`v."Business_Owner" IS NOT NULL`
  } else if (op.operator === 'is' && op.value === 'null') {
    return Prisma.sql`v."Business_Owner" IS NULL`
  }

  return null
}

const buildLanguageFilter = (
  op: FilterOperator | undefined,
): Prisma.Sql | null => {
  if (!op) return null

  if (op.operator === 'is' && op.value === 'not_null') {
    return Prisma.sql`v."Language_Code" IS NOT NULL`
  } else if (op.operator === 'is' && op.value === 'null') {
    return Prisma.sql`v."Language_Code" IS NULL`
  }

  const languageValues =
    op.operator === 'in' && op.values
      ? (op.values as string[])
      : op.operator === 'eq' && op.value
        ? [String(op.value)]
        : []

  if (languageValues.length === 0) return null

  const hasEnglish = languageValues.includes('English')
  const hasSpanish = languageValues.includes('Spanish')
  const hasOther = languageValues.includes('Other')

  if (hasEnglish && hasSpanish && hasOther) {
    return null
  }
  const conditions: Prisma.Sql[] = []
  if (hasEnglish) {
    conditions.push(Prisma.sql`v."Language_Code" = 'English'`)
  }
  if (hasSpanish) {
    conditions.push(Prisma.sql`v."Language_Code" = 'Spanish'`)
  }
  if (hasOther) {
    conditions.push(
      Prisma.sql`(v."Language_Code" != ALL(ARRAY['English', 'Spanish']::text[]) OR v."Language_Code" IS NULL)`,
    )
  }

  return Prisma.sql`(${Prisma.join(conditions, ' OR ')})`
}

const buildBooleanFilter = (
  fieldName: string,
  op: FilterOperator | undefined,
): Prisma.Sql | null => {
  if (!op) return null
  if (op.operator === 'is' && op.value === 'not_null') {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NOT NULL`
  } else if (op.operator === 'is' && op.value === 'null') {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NULL`
  }
  return null
}

const buildFieldFilter = (
  fieldName: string,
  op: FilterOperator | undefined,
): Prisma.Sql | null => {
  if (!op) return null
  if (op.operator === 'in' && op.values && op.values.length > 0) {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" = ANY(ARRAY[${Prisma.join(
      op.values.map((f) => Prisma.sql`${String(f)}`),
      ', ',
    )}]::text[])`
  } else if (op.operator === 'eq' && op.value !== undefined) {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" = ${String(op.value)}`
  } else if (op.operator === 'is' && op.value === 'not_null') {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NOT NULL`
  } else if (op.operator === 'is' && op.value === 'null') {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NULL`
  }
  return null
}

const buildNumericFilter = (
  fieldName: string,
  op: FilterOperator | undefined,
): Prisma.Sql | null => {
  if (!op) return null

  let baseSql: Prisma.Sql | null = null

  if (op.operator === 'in' && op.values && op.values.length > 0) {
    baseSql = Prisma.sql`v."${Prisma.raw(fieldName)}" = ANY(ARRAY[${Prisma.join(
      op.values.map((f) => Prisma.sql`${Number(f)}`),
      ', ',
    )}]::integer[])`
  } else if (op.operator === 'eq' && op.value !== undefined) {
    baseSql = Prisma.sql`v."${Prisma.raw(fieldName)}" = ${Number(op.value)}`
  } else if (
    op.operator === 'range' &&
    op.gte !== undefined &&
    op.lte !== undefined
  ) {
    baseSql = Prisma.sql`v."${Prisma.raw(fieldName)}" >= ${Number(op.gte)} AND v."${Prisma.raw(fieldName)}" <= ${Number(op.lte)}`
  } else if (op.operator === 'gte' && op.value !== undefined) {
    baseSql = Prisma.sql`v."${Prisma.raw(fieldName)}" >= ${Number(op.value)}`
  } else if (op.operator === 'lte' && op.value !== undefined) {
    baseSql = Prisma.sql`v."${Prisma.raw(fieldName)}" <= ${Number(op.value)}`
  } else if (op.operator === 'is' && op.value === 'not_null') {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NOT NULL`
  } else if (op.operator === 'is' && op.value === 'null') {
    return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NULL`
  }

  if (baseSql && op.includeNull) {
    return Prisma.sql`(${baseSql} OR v."${Prisma.raw(fieldName)}" IS NULL)`
  }

  return baseSql
}

const buildMappedFieldFilter = (
  fieldName: string,
  op: FilterOperator | undefined,
  mapValue: (value: string) => string | null,
): Prisma.Sql | null => {
  if (!op) return null

  if (op.operator === 'eq' && op.value) {
    const mappedValue = mapValue(String(op.value))
    if (mappedValue === null) {
      return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NULL`
    }
    return buildFieldFilter(fieldName, { ...op, value: mappedValue })
  }

  if (op.operator === 'in' && op.values && op.values.length > 0) {
    const originalValues = op.values as string[]
    const mappedValues = originalValues
      .map(mapValue)
      .filter((v): v is string => v !== null)
    const hasNull = originalValues.some((v) => mapValue(v) === null)

    if (hasNull && mappedValues.length > 0) {
      const sql = buildFieldFilter(fieldName, { ...op, values: mappedValues })
      if (sql) {
        return Prisma.sql`(${sql} OR v."${Prisma.raw(fieldName)}" IS NULL)`
      }
    } else if (hasNull) {
      return Prisma.sql`v."${Prisma.raw(fieldName)}" IS NULL`
    } else if (mappedValues.length > 0) {
      return buildFieldFilter(fieldName, { ...op, values: mappedValues })
    }
  }

  return buildFieldFilter(fieldName, op)
}
