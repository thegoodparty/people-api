import http from 'k6/http'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { buildUrl, recordMetrics, buildHeaders } = require('./common.js')

const DISTRICT_SMALL =
  __ENV.DISTRICT_SMALL || '22f911d1-8262-ec9d-257f-7bb0ccb563c1'
const DISTRICT_LARGE =
  __ENV.DISTRICT_LARGE || '7e38d7a0-bb29-99bc-74c6-cadd54f1afc7'
const DISTRICT_SMALL_FILTERS =
  __ENV.DISTRICT_SMALL_FILTERS || '0d04f04f-ace2-e4e4-c056-de86c8f4f377'
const DISTRICT_LARGE_FILTERS =
  __ENV.DISTRICT_LARGE_FILTERS || 'fed71a30-f074-37bf-bb9d-8e2acda1bd1c'

const baseScenarios = {
  small: { executor: 'constant-vus', vus: 3, duration: '30s', exec: 'small' },
  large: {
    executor: 'constant-vus',
    vus: 3,
    duration: '30s',
    startTime: '35s',
    exec: 'large',
  },
  small_full_filters: {
    executor: 'constant-vus',
    vus: 3,
    duration: '30s',
    startTime: '70s',
    exec: 'small_full_filters',
  },
  large_full_filters: {
    executor: 'constant-vus',
    vus: 3,
    duration: '30s',
    startTime: '105s',
    exec: 'large_full_filters',
  },
} as const

export const options =
  (__ENV && __ENV.ONLY) === 'small'
    ? { scenarios: { small: { ...baseScenarios.small, startTime: '0s' } } }
    : (__ENV && __ENV.ONLY) === 'large'
      ? { scenarios: { large: { ...baseScenarios.large, startTime: '0s' } } }
      : (__ENV && __ENV.ONLY) === 'small_full_filters'
        ? {
            scenarios: {
              small_full_filters: {
                ...baseScenarios.small_full_filters,
                startTime: '0s',
              },
            },
          }
        : (__ENV && __ENV.ONLY) === 'large_full_filters'
          ? {
              scenarios: {
                large_full_filters: {
                  ...baseScenarios.large_full_filters,
                  startTime: '0s',
                },
              },
            }
          : { scenarios: baseScenarios }

export function small() {
  const url = buildUrl('/people')
  const body = JSON.stringify({
    districtId: DISTRICT_SMALL,
    filters: {
      gender: { is: 'not_null' },
      educationLevel: { is: 'not_null' },
    },
  })
  const res = http.post(url, body, {
    headers: {
      ...buildHeaders('perf:people small'),
      'Content-Type': 'application/json',
    },
  })
  recordMetrics(res)
}

export function large() {
  const url = buildUrl('/people')
  const body = JSON.stringify({
    districtId: DISTRICT_LARGE,
    filters: {
      gender: { is: 'not_null' },
      educationLevel: { is: 'not_null' },
    },
  })
  const res = http.post(url, body, {
    headers: {
      ...buildHeaders('perf:people large'),
      'Content-Type': 'application/json',
    },
  })
  recordMetrics(res)
}

export function small_full_filters() {
  const url = buildUrl('/people')
  const body = JSON.stringify({
    districtId: DISTRICT_SMALL_FILTERS,
    filters: {
      hasCellPhone: true,
      hasLandline: false,
      voterStatus: { in: ['Super', 'Likely'] },
      politicalParty: { eq: 'Democratic' },
      maritalStatus: { eq: 'Married' },
      veteranStatus: { eq: 'Yes' },
      educationLevel: { eq: 'College Degree' },
      ethnicity: { eq: 'Hispanic' },
      businessOwner: { eq: 'Yes' },
      presenceOfChildren: { in: ['Yes', 'No'] },
      homeowner: { in: ['Yes', 'Likely'] },
      gender: { in: ['M', 'F'] },
      language: { in: ['English', 'Spanish'] },
      estimatedIncomeAmountInt: { gte: 25000, lte: 75000 },
      ageInt: { gte: 18, lte: 65 },
    },
  })
  const res = http.post(url, body, {
    headers: {
      ...buildHeaders('perf:people small full filters'),
      'Content-Type': 'application/json',
    },
  })
  recordMetrics(res)
}

export function large_full_filters() {
  const url = buildUrl('/people')
  const body = JSON.stringify({
    districtId: DISTRICT_LARGE_FILTERS,
    filters: {
      hasCellPhone: true,
      hasLandline: false,
      voterStatus: { in: ['Super', 'Likely'] },
      politicalParty: { eq: 'Democratic' },
      maritalStatus: { eq: 'Married' },
      veteranStatus: { eq: 'Yes' },
      educationLevel: { eq: 'College Degree' },
      ethnicity: { eq: 'Hispanic' },
      businessOwner: { eq: 'Yes' },
      presenceOfChildren: { in: ['Yes', 'No'] },
      homeowner: { in: ['Yes', 'Likely'] },
      gender: { in: ['M', 'F'] },
      language: { in: ['English', 'Spanish'] },
      estimatedIncomeAmountInt: { gte: 25000, lte: 75000 },
      ageInt: { gte: 18, lte: 65 },
    },
  })
  const res = http.post(url, body, {
    headers: {
      ...buildHeaders('perf:people large full filters'),
      'Content-Type': 'application/json',
    },
  })
  recordMetrics(res)
}
