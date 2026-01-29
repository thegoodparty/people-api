import http from 'k6/http'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { buildUrl, recordMetrics, buildHeaders } = require('./common.js')

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
    state: 'WY',
    districtType: 'County_Commissioner_District',
    districtName: 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)',
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
    state: 'TX',
    districtType: 'City',
    districtName: 'DALLAS CITY (EST.)',
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
    state: 'NH',
    districtType: 'City',
    districtName: 'CONCORD CITY',
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
      estimatedIncomeAmount: { is: 'not_null' },
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
    state: 'OH',
    districtType: 'City',
    districtName: 'COLUMBUS CITY (EST.)',
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
      estimatedIncomeAmount: { is: 'not_null' },
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
