# Data Pipeline

How voter data gets in, lives, and flows out of `people-api`. **Ingestion happens outside this repo** — `people-api` is read-only from the application's perspective. The model files in `prisma/schema/` describe what the API queries; they do not describe how rows are loaded.

## Source

Voter rows come from **L2** (a commercial voter-data vendor). L2 ships per-state files with ~100+ columns covering voter identity, address, demographics, voting history, and consumer-data overlays.

The README at the repo root references `npm run download` and `npm run load` scripts; those scripts are no longer wired into `package.json` and **are not the current ingestion path**. Treat the README's "Run the downloader / Run the loader" section as historical until it's updated. Current ingestion is operated externally — coordinate with the data team if you need a refresh.

## Storage

Two PostgreSQL schemas configured in `prisma/schema/schema.prisma`:

- **`green`** — all tables (`Voter`, `District`, `DistrictVoter`, `DistrictStats`)
- **`public`** — enums (`USState`, …)

Splitting enums into `public` lets cross-schema casts and partition-pruning hints work cleanly (see migration `20251209090000_add_usstate_cross_schema_casts`).

### Tables

| Table | Purpose | Notes |
|-------|---------|-------|
| `Voter` | One row per registered voter. ~100+ L2 columns. | Natively **partitioned by `State`** at the Postgres level. Prisma sees one table; the planner prunes partitions by the `State` predicate. Migrations under `prisma/migrations/` add partition-aware indexes (e.g., `Voter_last_first_id_idx`). |
| `District` | Geographic / political districts. | Small lookup table; queried via Prisma ORM. |
| `DistrictVoter` | Join: which voters belong to which district. | Composite PK `(districtId, voterId)`; `state` is denormalized for partition pruning on cascading deletes. |
| `DistrictStats` | Pre-computed demographic rollups per district. | Has a `buckets` JSON column typed via `prisma-json-types-generator` (see `districtStats.jsonTypes.d.ts`). |

`Voter.id` is a UUID generated at ingestion. `Voter.LALVOTERID` is L2's permanent voter identifier and is the natural key.

## Read pipeline (the API path)

When a request hits `POST /v1/people` or `POST /v1/people/download`:

```
HTTP request
   │
   ▼  Zod validation (nestjs-zod)
src/people/schemas/filters.schema.ts
   │
   ▼  transformFilters() — group raw query into FilterData
src/people/schemas/filters.schema.utils.ts
   │
   ▼  buildVoterFiltersSql() — convert FilterData to a Prisma.Sql WHERE clause
src/people/utils/filters.sql.utils.ts
   │
   ▼  buildVoterSelectSql() — typed SELECT clause based on requested fields
src/people/people.select.ts
   │
   ▼  $queryRaw against `green.Voter` (joined to `green.DistrictVoter` if filtering by district)
PrismaService
   │
   ▼  transformToPersonOutput() — map raw L2 values to clean API output
src/people/utils/transformToPersonOutput.utils.ts
   │
   ▼  Optional CSV streaming via @fast-csv/format
HTTP response
```

Every step except the last one is unit-testable in isolation. `filters.sql.utils.test.ts` and `filters.schema.utils.test.ts` are the canonical examples — they assert the SQL string + parameter array, not just behavior.

### Why raw SQL for `Voter`

Prisma ORM's coverage of partitioned tables is shallow. With ~100+ columns plus dynamic projection (callers pick which fields they want), generated `select` types blow up and the planner doesn't see the partition key as cleanly. Raw SQL via `Prisma.sql` gives us:

- Predicate placement that triggers partition pruning (`State = $1` and friends)
- Custom column-set projections without overgrowing TypeScript types
- Index-aligned ORDER BY / pagination

`District` and `DistrictStats` stay on the ORM path — they're small and cheap to read.

## Sampling

`SampleService` (`src/people/services/sample.service.ts`) returns a deterministic subset of voters for a district. It hashes `LALVOTERID + salt` via `murmurhash` (`src/shared/util/hash.util.ts`) into N buckets and selects rows in the requested buckets. Same input → same output, which lets callers (e.g. campaign sampling tools) cache and resume safely.

## Stats

`DistrictStats` is pre-aggregated upstream and stored as one row per district with a `buckets` JSON blob. `StatsService` returns it verbatim — no on-the-fly aggregation in this API. If new stats are needed, they're added by the upstream ETL, not computed here.

## Local dev

There's a `seed/` directory that uses `@faker-js/faker` to generate ~100 fake voters for local exploration. See `seed/README.md`. **Seeding is disabled in `production`, `qa`, and `development` environments** as a safety check.

For real-shaped data, ask the data team — there's no automated dev-snapshot path today.

## Refreshes / cadence

There is no in-repo cron or queue consumer. Refreshes happen externally and are then visible to this API. If you need to know "is this row fresh?", check `Voter.updatedAt` on individual rows.
