export const INCOME_FILTERS = [
  'income1kTo15k',
  'income15kTo25k',
  'income25kTo35k',
  'income35kTo50k',
  'income50kTo75k',
  'income75kTo100k',
  'income100kTo125k',
  'income125kTo150k',
  'income150kTo175k',
  'income175kTo200k',
  'income200kTo250k',
  'income250kPlus',
  'incomeUnknown',
] as const

export type IncomeFilter = (typeof INCOME_FILTERS)[number]
