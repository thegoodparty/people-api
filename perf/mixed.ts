import http from 'k6/http'
import { Trend, Rate } from 'k6/metrics'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const { buildUrl, buildHeaders } = require('./common.js')

export const options = {
  scenarios: {
    mixed: {
      executor: 'ramping-arrival-rate',
      startRate: 50,
      timeUnit: '1s',
      preAllocatedVUs: 300,
      maxVUs: 600,
      stages: [{ target: 300, duration: '5m' }],
      exec: 'runMixed',
    },
  },
}

// Cohort-specific metrics (time-aware trends for proper units)
const duration_people_small = new Trend('duration_people_small', true)
const duration_people_large = new Trend('duration_people_large', true)
const duration_stats_large = new Trend('duration_stats_large', true)
const duration_sample_small = new Trend('duration_sample_small', true)

const error_rate_people_small = new Rate('error_rate_people_small')
const error_rate_people_large = new Rate('error_rate_people_large')
const error_rate_stats_large = new Rate('error_rate_stats_large')
const error_rate_sample_small = new Rate('error_rate_sample_small')

const cold_first_hit_people_small = new Trend('cold_first_hit_people_small', true)
const cold_first_hit_people_large = new Trend('cold_first_hit_people_large', true)
const cold_first_hit_stats_large = new Trend('cold_first_hit_stats_large', true)
const cold_first_hit_sample_small = new Trend('cold_first_hit_sample_small', true)

const firstHitRecorded: Record<string, boolean> = {}

function recordMetricsFor(cohort: string, res: { status: number; timings: { duration: number } }) {
  const failed = res.status === 0 || res.status >= 400
  switch (cohort) {
    case 'people_small':
      duration_people_small.add(res.timings.duration)
      error_rate_people_small.add(failed ? 1 : 0)
      if (!firstHitRecorded[cohort]) {
        firstHitRecorded[cohort] = true
        cold_first_hit_people_small.add(res.timings.duration)
      }
      break
    case 'people_large':
      duration_people_large.add(res.timings.duration)
      error_rate_people_large.add(failed ? 1 : 0)
      if (!firstHitRecorded[cohort]) {
        firstHitRecorded[cohort] = true
        cold_first_hit_people_large.add(res.timings.duration)
      }
      break
    case 'stats_large':
      duration_stats_large.add(res.timings.duration)
      error_rate_stats_large.add(failed ? 1 : 0)
      if (!firstHitRecorded[cohort]) {
        firstHitRecorded[cohort] = true
        cold_first_hit_stats_large.add(res.timings.duration)
      }
      break
    case 'sample_small':
      duration_sample_small.add(res.timings.duration)
      error_rate_sample_small.add(failed ? 1 : 0)
      if (!firstHitRecorded[cohort]) {
        firstHitRecorded[cohort] = true
        cold_first_hit_sample_small.add(res.timings.duration)
      }
      break
  }
}

function pickCohort(): 'people_small' | 'people_large' | 'stats_large' | 'sample_small' {
  // Mix A:
  // People small 60%, People large 20%, Stats large 15%, Sample small 5%
  const r = Math.random() * 100
  if (r < 60) return 'people_small'
  if (r < 80) return 'people_large'
  if (r < 95) return 'stats_large'
  return 'sample_small'
}

export function runMixed() {
  const cohort = pickCohort()
  let url = ''
  let headers: Record<string, string> = {}

  if (cohort === 'people_small') {
    url = buildUrl('/people', {
      state: 'WY',
      districtType: 'County_Commissioner_District',
      districtName: 'SWEETWATER CNTY-ROCK SPRINGS NORTH CCD (EST.)',
      'filter[gender][is]': 'not_null',
      'filter[educationOfPerson][is]': 'not_null',
    })
    headers = buildHeaders('perf:mixed people small')
  } else if (cohort === 'people_large') {
    url = buildUrl('/people', {
      state: 'TX',
      districtType: 'City',
      districtName: 'DALLAS CITY (EST.)',
      'filter[gender][is]': 'not_null',
      'filter[educationOfPerson][is]': 'not_null',
    })
    headers = buildHeaders('perf:mixed people large')
  } else if (cohort === 'stats_large') {
    url = buildUrl('/people/stats', {
      state: 'WI',
      districtType: 'City',
      districtName: 'MILWAUKEE CITY',
    })
    headers = buildHeaders('perf:mixed stats large')
  } else {
    url = buildUrl('/people/sample', {
      state: 'FL',
      districtType: 'City',
      districtName: 'NICEVILLE CITY (EST.)',
      size: 1000,
    })
    headers = buildHeaders('perf:mixed sample small')
  }

  const res = http.get(url, { headers })
  recordMetricsFor(cohort, res)
}

