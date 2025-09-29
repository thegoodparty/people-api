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

export const normalizeBusinessOwner = (
  value: string | null | undefined,
): 'Yes' | 'No' | 'Unknown' => {
  const v = (value || '').trim().toLowerCase()
  if (!v) return 'Unknown'
  // If the data vendor ever provides explicit negatives, treat them as No
  if (v === 'n' || v === 'no' || v === 'false') return 'No'
  // Any other non-empty value indicates some form of ownership/employment
  return 'Yes'
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
  | 'None'
  | 'High School Diploma'
  | 'Technical School'
  | 'Some College'
  | 'College Degree'
  | 'Graduate Degree'
  | 'Unknown' => {
  const v = (value || '').trim().toLowerCase()
  if (!v) return 'Unknown'
  if (v.includes('did not complete high school')) return 'None'
  if (v.includes('completed high school')) return 'High School Diploma'
  if (v.includes('attended vocational') || v.includes('technical school'))
    return 'Technical School'
  if (v.includes('attended but did not complete college')) return 'Some College'
  if (v.includes('completed college')) return 'College Degree'
  if (v.includes('completed grad school')) return 'Graduate Degree'
  if (v === 'unknown') return 'Unknown'
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
