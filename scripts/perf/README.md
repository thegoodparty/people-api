# scripts/perf/

Performance tooling wrappers. Convenience scripts behind the canonical commands in [`ai-rules/performance-tools.md`](../../ai-rules/performance-tools.md).

These complement (not replace) the existing `perf/` directory and `npm run perf:*` scripts, which use **k6** for richer multi-scenario load tests. Use this directory for quick, single-purpose measurements; reach for `perf/` + k6 when you need a journey-style scenario or per-checkpoint stats.

| Script | What it does | Cookbook section | When to reach for it |
|---|---|---|---|
| `bench-endpoint.sh` | Single-endpoint HTTP load test (autocannon) | §1 | Quick "is endpoint X faster?" before/after |
| `profile-cpu.sh` | V8 CPU profile of any node command (writes `.cpuprofile`) | §3 | "Where is the CPU going?" |
| `explain.sh` | `EXPLAIN (ANALYZE, BUFFERS, VERBOSE)` against the configured DB | §5 | "Is this query hitting the right index?" |

For the multi-endpoint k6 scenarios already in this repo, see `perf/mixed.ts`, `perf/people-get.ts`, `perf/sample-get.ts`, `perf/stats-get.ts`, and the recorded plans in `perf/query-plans.md`.

## Prereqs

```bash
brew install hyperfine libpq           # libpq gives you psql
npm i -g autocannon                    # or run via npx autocannon
```

## Examples

```bash
# Quick health check load (defaults: 10 connections, 20s)
scripts/perf/bench-endpoint.sh /health

# Compare a single endpoint across two commits with hyperfine
hyperfine --warmup 1 --runs 5 \
  'git checkout main && scripts/perf/bench-endpoint.sh -c 10 -d 10 /v1/people | tail -1' \
  'git checkout my-branch && scripts/perf/bench-endpoint.sh -c 10 -d 10 /v1/people | tail -1'

# Profile the perf-local server while exercising it
# Terminal 1: start with the perf-local env AND CPU profiling
NODE_OPTIONS='--cpu-prof --cpu-prof-dir=./profiles' npm run start:perf-local
# Terminal 2:
scripts/perf/bench-endpoint.sh -c 50 -d 30 /v1/people
# Then ^C terminal 1 and inspect: npx flamebearer < profiles/CPU.*.cpuprofile

# Profile a one-off script
scripts/perf/profile-cpu.sh -- npx tsx some-job.ts

# EXPLAIN a slow query (reads DATABASE_URL from .env if not already exported)
scripts/perf/explain.sh 'SELECT * FROM "Voter" WHERE "State" = '\''CA'\'' LIMIT 10'
scripts/perf/explain.sh -f perf/some-query.sql

# Record a new query plan into perf/query-plans.md
scripts/perf/explain.sh -f perf/some-query.sql >> perf/query-plans.md
```

See the cookbook for the full menu of tools (k6, microbenchmarks, GC tracing, heap profiles, production telemetry).

## Critic tie-in

Per the [performance critic rules](../../ai-rules/performance.md), any PR that claims a performance improvement should include before/after numbers from one of these tools (or production telemetry). Without a measurement, the change is a refactor.
