export type CountRow = { label: string; count: number }

export const computePercent = (count: number, total: number): number => {
  if (!total) return 0
  return Math.round((count / total) * 1000) / 1000
}

export const mergeTopNWithOther = (
  rows: CountRow[],
  topN: number,
): { top: CountRow[]; other: number } => {
  const sorted = [...rows].sort((a, b) => b.count - a.count)
  const top = sorted.slice(0, Math.max(0, topN))
  const other = sorted.slice(top.length).reduce((acc, r) => acc + r.count, 0)
  return { top, other }
}

export const normalizeHomeowner = (
  value: string | null | undefined,
): 'Homeowner' | 'Renter' | 'Unknown' => {
  const v = (value || '').trim()
  if (!v) return 'Unknown'
  const lower = v.toLowerCase()
  if (lower === 'home owner' || lower === 'probable home owner')
    return 'Homeowner'
  if (lower === 'renter') return 'Renter'
  return 'Unknown'
}

export const normalizeChildrenPresence = (
  value: string | null | undefined,
): 'Yes' | 'No' | 'Unknown' => {
  const v = (value || '').trim().toLowerCase()
  if (!v) return 'Unknown'
  if (v === 'y' || v === 'yes' || v === 'true') return 'Yes'
  if (v === 'n' || v === 'no' || v === 'false') return 'No'
  return 'Unknown'
}

export const normalizeIncomeBucket = (
  value: string | null | undefined,
):
  | '<$25k'
  | '$25k-$50k'
  | '$50k-$75k'
  | '$75k-$100k'
  | '$100k-$150k'
  | '$150k+'
  | 'Unknown' => {
  const v = (value || '').replace(/[,\s]/g, '').toLowerCase()
  if (!v) return 'Unknown'
  // Examples: "under25k", "25k-50k", "50000-74999", "75-100k", "150kplus"
  if (/under?\s*25k|^<\$?25/.test(v)) return '<$25k'
  if (/(25|25000)[k\d]*[-to]*(50|50000)/.test(v)) return '$25k-$50k'
  if (/(50|50000)[k\d]*[-to]*(75|75000)/.test(v)) return '$50k-$75k'
  if (/(75|75000)[k\d]*[-to]*(100|100000)/.test(v)) return '$75k-$100k'
  if (/(100|100000)[k\d]*[-to]*(150|150000)/.test(v)) return '$100k-$150k'
  if (/(150|150000)k?\+?|over\s*150k|150k\s*\+/.test(v)) return '$150k+'
  return 'Unknown'
}

export const normalizeEducationBucket = (
  value: string | null | undefined,
):
  | 'HS or less'
  | 'Some college/Assoc'
  | "Bachelor's"
  | 'Graduate+'
  | 'Unknown' => {
  const v = (value || '').trim().toLowerCase()
  if (!v) return 'Unknown'
  if (/less than high|some high|hs|high school/.test(v)) return 'HS or less'
  if (/some college|associate|assoc|aa|as/.test(v)) return 'Some college/Assoc'
  if (/college grad|bachelor|ba|bs|b\.s\.|b\.a\./.test(v)) return "Bachelor's"
  if (/graduate|post grad|masters|ms|ma|mba|phd|doctorate|jd|md/.test(v))
    return 'Graduate+'
  return 'Unknown'
}

export const isTruthyYes = (v: unknown): boolean => {
  if (typeof v === 'boolean') return v
  if (typeof v === 'string') {
    const s = v.trim().toLowerCase()
    return s === 'true' || s === 'yes' || s === 'y'
  }
  return false
}
