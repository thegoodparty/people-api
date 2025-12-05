'use strict'
if (!process.env.NEW_RELIC_APP_NAME || !process.env.NEW_RELIC_LICENSE_KEY) {
  console.warn(
    'New Relic disabled: Missing NEW_RELIC_APP_NAME or NEW_RELIC_LICENSE_KEY',
  )
  module.exports = {}
} else {
  exports.config = {
    app_name: [process.env.NEW_RELIC_APP_NAME || 'people-api'],
    license_key: process.env.NEW_RELIC_LICENSE_KEY,
    logging: {
      level: process.env.NEW_RELIC_LOG_LEVEL || 'warn',
      filepath: 'stdout',
    },
    distributed_tracing: { enabled: true },
    application_logging: {
      enabled: true,
      forwarding: { enabled: false },
      metrics: { enabled: true },
      local_decorating: { enabled: true },
    },
    error_collector: {
      enabled: true,
      ignore_status_codes: [401],
    },
    transaction_tracer: {
      enabled: true,
      record_sql: 'raw',
      explain_threshold: 200 // ms
    },
    slow_sql: {
      enabled: true
    },
    allow_all_headers: true,
    attributes: {
      exclude: [
        'request.headers.cookie',
        'request.headers.authorization',
        'request.headers.proxyAuthorization',
        'request.headers.setCookie*',
        'request.headers.x*',
        'response.headers.cookie',
        'response.headers.authorization',
        'response.headers.proxyAuthorization',
        'response.headers.setCookie*',
        'response.headers.x*',
      ],
    },
    rules: {
      ignore: ['^/v1/health$'],
    },
  }
}
