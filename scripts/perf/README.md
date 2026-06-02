# scripts/perf/

Performance tooling wrappers. Convenience scripts behind the canonical commands in [`ai-rules/performance-tools.md`](../../ai-rules/performance-tools.md).

These complement (not replace) the existing `perf/` directory and `npm run perf:*` scripts, which use **k6** for richer multi-scenario load tests. Use this directory for quick, single-purpose measurements; reach for `perf/` + k6 when you need a journey-style scenario or per-checkpoint stats.

| Script | What it does | Cookbook section | When to reach for it |
|---|---|---|---|
| `setup-check.sh` | Audit the local env — what can/can't be measured right now | §11.6 | Always run first |
| `bench-endpoint.sh` | Single-endpoint HTTP load test (autocannon) | §1 | Quick "is endpoint X faster?" before/after |
| `profile-cpu.sh` | V8 CPU profile of any node command (writes `.cpuprofile`) | §3 | "Where is the CPU going?" |
| `explain.sh` | `EXPLAIN (ANALYZE, BUFFERS, VERBOSE)` against the configured DB | §5 | "Is this query hitting the right index?" |

For the multi-endpoint k6 scenarios already in this repo, see `perf/mixed.ts`, `perf/people-get.ts`, `perf/sample-get.ts`, `perf/stats-get.ts`, and the recorded plans in `perf/query-plans.md`.

Every script supports `-h` / `--help` and prints its prerequisites at the top of the help block.

## Quick start

```bash
# What's available locally?
scripts/perf/setup-check.sh
```

If `setup-check.sh` is clean, the rest will work. If something is ✗, the script tells you the install command for your platform (or the no-install fallback).

## Prereqs

The scripts try hard not to require global installs:

- **autocannon** — `npx --yes autocannon` fallback is automatic when not installed globally.
- **psql** — when not on PATH but Postgres is in Docker, `docker exec <container> psql` is used automatically. Override the container with `PG_DOCKER_CONTAINER=<name>`.
- **hyperfine** — no convenient `npx` equivalent; install if you want statistical comparison runs:
  ```bash
  brew install hyperfine        # mac
  cargo install hyperfine       # linux / cross-platform
  ```
- **k6** — for multi-endpoint scenarios (this repo's existing `perf/*.ts`). Install: `brew install k6` (mac) or `apt install k6` (linux, Grafana repo) or `docker run --rm grafana/k6`.

For agents working in a fresh `git worktree`, also see `ai-rules/performance-tools.md` §11.6 — `.env` and the `ai-rules` submodule are common first-time stumbling blocks.

## Examples

```bash
# Quick health check load (defaults: 10 connections, 20s; npx fallback if no global)
scripts/perf/bench-endpoint.sh /health

# Compare a single endpoint across two commits with hyperfine
hyperfine --warmup 1 --runs 5 \
  'git checkout main && scripts/perf/bench-endpoint.sh -c 10 -d 10 /v1/people | tail -1' \
  'git checkout my-branch && scripts/perf/bench-endpoint.sh -c 10 -d 10 /v1/people | tail -1'

# Profile a one-off script (exits naturally)
scripts/perf/profile-cpu.sh -- node dist/scripts/some-job.js
scripts/perf/profile-cpu.sh -- tsx some-job.ts

# Profile the running server — note: npm-script / nest-start indirection is NOT supported.
# Profile the built JS directly:
scripts/perf/profile-cpu.sh -- node dist/main.js
# In another terminal: drive load through it, then ^C the server.
# Open the .cpuprofile in Chrome DevTools (Performance > Load profile)
# or: npx flamebearer < profiles/CPU.*.cpuprofile

# EXPLAIN a slow query (auto-uses docker exec if host psql missing)
scripts/perf/explain.sh 'SELECT * FROM "Voter" WHERE "State" = '\''CA'\'' LIMIT 10'
scripts/perf/explain.sh -f perf/some-query.sql

# Record a new query plan into perf/query-plans.md
scripts/perf/explain.sh -f perf/some-query.sql >> perf/query-plans.md
```

See the cookbook for the full menu of tools (k6, microbenchmarks, GC tracing, heap profiles, production telemetry).

## Critic tie-in

Per the [performance critic rules](../../ai-rules/performance.md), any PR that claims a performance improvement should include before/after numbers from one of these tools (or production telemetry). Without a measurement, the change is a refactor.

When the critic itself is an agent with shell access, it should run `setup-check.sh` first, then use any GREEN tool it has the prerequisites for (see the readiness table in `performance-tools.md`). It should never fabricate measurements.
