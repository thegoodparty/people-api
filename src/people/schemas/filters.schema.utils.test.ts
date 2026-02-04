import { describe, expect, it } from 'vitest'
import { transformFilters } from './filters.schema.utils'

const mockSchemaShape = {
  estimatedIncomeAmountInt: {},
  ageInt: {},
  gender: {},
}

describe('transformFilters', () => {
  describe('_or operator', () => {
    it('transforms _or with multiple ranges into or operator', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: 0, lte: 24999 }, { gte: 200000 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filters).toContain('estimatedIncomeAmountInt')
      expect(result.filterOperators.estimatedIncomeAmountInt).toEqual({
        operator: 'or',
        orRanges: [
          { gte: 0, lte: 24999 },
          { gte: 200000, lte: undefined },
        ],
        includeNull: false,
      })
    })

    it('transforms _or with _includeNull', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [
            { gte: 0, lte: 24999 },
            { gte: 50000, lte: 74999 },
          ],
          _includeNull: true,
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt).toEqual({
        operator: 'or',
        orRanges: [
          { gte: 0, lte: 24999 },
          { gte: 50000, lte: 74999 },
        ],
        includeNull: true,
      })
    })

    it('transforms _or with single range', () => {
      const filters = {
        ageInt: {
          _or: [{ gte: 18, lte: 25 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.ageInt).toEqual({
        operator: 'or',
        orRanges: [{ gte: 18, lte: 25 }],
        includeNull: false,
      })
    })

    it('transforms _or with lte-only range', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ lte: 24999 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt).toEqual({
        operator: 'or',
        orRanges: [{ gte: undefined, lte: 24999 }],
        includeNull: false,
      })
    })
  })

  describe('_or edge cases', () => {
    it('handles empty _or array', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt).toEqual({
        operator: 'or',
        orRanges: [],
        includeNull: false,
      })
    })

    it('handles _or with undefined gte/lte values', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: undefined, lte: 24999 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.orRanges).toEqual([
        { gte: undefined, lte: 24999 },
      ])
    })

    it('handles _or with null values (filters them out like regular ranges)', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: null, lte: 24999 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.orRanges).toEqual([
        { gte: undefined, lte: 24999 },
      ])
    })

    it('handles _or with zero values', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: 0, lte: 0 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.orRanges).toEqual([
        { gte: 0, lte: 0 },
      ])
    })

    it('handles _or with negative values', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: -100, lte: -1 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.orRanges).toEqual([
        { gte: -100, lte: -1 },
      ])
    })

    it('handles _or taking precedence over gte/lte at same level', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: 0, lte: 24999 }],
          gte: 50000,
          lte: 74999,
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.operator).toBe(
        'or',
      )
    })

    it('handles is operator taking precedence over _or', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          is: 'null',
          _or: [{ gte: 0, lte: 24999 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.operator).toBe('is')
      expect(result.filterOperators.estimatedIncomeAmountInt.value).toBe('null')
    })

    it('ignores _includeNull when false', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [{ gte: 0, lte: 24999 }],
          _includeNull: false,
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt.includeNull).toBe(
        false,
      )
    })

    it('handles large number of ranges', () => {
      const filters = {
        estimatedIncomeAmountInt: {
          _or: [
            { gte: 0, lte: 24999 },
            { gte: 25000, lte: 34999 },
            { gte: 35000, lte: 49999 },
            { gte: 50000, lte: 74999 },
            { gte: 75000, lte: 99999 },
            { gte: 100000, lte: 124999 },
            { gte: 125000, lte: 149999 },
            { gte: 150000, lte: 199999 },
            { gte: 200000 },
          ],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(
        result.filterOperators.estimatedIncomeAmountInt.orRanges,
      ).toHaveLength(9)
    })

    it('skips filters not in schema shape', () => {
      const filters = {
        unknownField: {
          _or: [{ gte: 0, lte: 100 }],
        },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filters).not.toContain('unknownField')
      expect(result.filterOperators.unknownField).toBeUndefined()
    })
  })

  describe('existing operators still work', () => {
    it('transforms gte/lte range', () => {
      const filters = {
        ageInt: { gte: 18, lte: 25 },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.ageInt).toEqual({
        operator: 'range',
        gte: 18,
        lte: 25,
        includeNull: false,
      })
    })

    it('transforms gte only', () => {
      const filters = {
        ageInt: { gte: 50 },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.ageInt).toEqual({
        operator: 'gte',
        value: 50,
        includeNull: false,
      })
    })

    it('transforms in operator', () => {
      const filters = {
        gender: { in: ['M', 'F'] },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.gender).toEqual({
        operator: 'in',
        values: ['M', 'F'],
        includeNull: false,
      })
    })

    it('transforms is null operator', () => {
      const filters = {
        estimatedIncomeAmountInt: { is: 'null' },
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.estimatedIncomeAmountInt).toEqual({
        operator: 'is',
        value: 'null',
      })
    })

    it('transforms boolean true', () => {
      const filters = {
        gender: true,
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.gender).toEqual({
        operator: 'is',
        value: 'not_null',
      })
    })

    it('transforms boolean false', () => {
      const filters = {
        gender: false,
      }

      const result = transformFilters(filters, mockSchemaShape)

      expect(result.filterOperators.gender).toEqual({
        operator: 'is',
        value: 'null',
      })
    })
  })
})
