#!/usr/bin/env bash
set -euo pipefail

STATS="avg,med,p(50),p(95),p(99),min,max"

k6 run --summary-trend-stats "$STATS" --env ONLY=small perf/people-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=large perf/people-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=small_full_filters perf/people-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=large_full_filters perf/people-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=small perf/stats-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=large perf/stats-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=small perf/sample-get.ts || true
k6 run --summary-trend-stats "$STATS" --env ONLY=large perf/sample-get.ts || true
