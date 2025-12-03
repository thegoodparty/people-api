'use strict'
if (process.env.NODE_ENV === 'perf-local') {
  console.error('Migrations are disabled when NODE_ENV=perf-local')
  process.exit(1)
}
