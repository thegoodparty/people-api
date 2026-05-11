# Architecture

A pointer-heavy doc. Detailed conventions live in `CLAUDE.md` and the rule files in `ai-rules/`.

## Stack

- **NestJS 11** on **Fastify** (not Express); `@fastify/helmet`, `@fastify/cors`, `@fastify/cookie`, `@fastify/static`
- **Prisma 6** with multi-file schema folder + `multiSchema` (two PG schemas: `green` for tables, `public` for enums); `prisma-json-types-generator` for JSON column typing
- **Zod** via `nestjs-zod` (`createZodDto` + global `ZodValidationPipe`)
- **Vitest 4** with SWC for tests
- **OpenTelemetry** (traces/metrics/logs OTLP) wired in `src/otel.ts`; `nestjs-pino` for structured logs
- **Pulumi** (TypeScript) for IaC under `deploy/`

## Module shape

```
src/<feature>/
├── <feature>.module.ts
├── <feature>.controller.ts        # HTTP only — no business logic
├── services/<X>.service.ts        # extends createPrismaBase(MODELS.X) where applicable
├── schemas/<X>.schema.ts          # Zod schemas; createZodDto for DTOs
├── utils/<X>.utils.ts             # pure helpers (filters, transforms, hashing)
├── <feature>.schema.ts            # top-level DTOs (re-exports schemas)
└── <X>.test.ts                    # vitest, colocated
```

`src/people/` is the canonical reference — it has the controller, three services (`people`, `sample`, `stats`), the filter pipeline, the SQL builder, and the output transformer all in one place.

## App composition

```
AppModule
├── loggerModule (nestjs-pino)
├── PrismaModule (@Global) → PrismaService
├── HealthModule → GET /v1/health (@Public)
├── PeopleModule
│   ├── PeopleController (/v1/people)
│   ├── PeopleService     (raw SQL voter queries)
│   ├── SampleService     (deterministic hash-bucket sampling)
│   ├── StatsService      (pre-computed district demographics)
│   └── DistrictModule → DistrictService
└── AuthModule → S2SAuthGuard registered as APP_GUARD
```

## HTTP surface

All routes are mounted under the global prefix `/v1` (set in `src/main.ts`).

| Method | Path | Module | Notes |
|--------|------|--------|-------|
| GET | `/v1/health` | `src/health/` | `@Public()` — bypasses auth |
| POST | `/v1/people` | `src/people/` | List/filter voters with pagination |
| POST | `/v1/people/download` | `src/people/` | Stream filtered voters as CSV |
| GET / POST | `/v1/people/sample` | `src/people/` | Deterministic voter sampling for a district |
| GET | `/v1/people/stats` | `src/people/` | Pre-computed district demographic stats |
| GET | `/v1/people/:id` | `src/people/` | Single voter by ID |

Swagger is mounted at `/api` (no prefix) for ad-hoc exploration in non-prod.

## Auth

`S2SAuthGuard` (`src/auth/s2s-auth.guard.ts`) is registered globally as `APP_GUARD` in `AuthModule`. Validates Bearer JWTs signed with `PEOPLE_API_S2S_SECRET` (shared with `gp-api`). The `@Public()` decorator (`src/auth/public.decorator.ts`) opts a route out — currently only `/v1/health`.

In dev, set `S2S_ALLOW_LOCALHOST=true` in `.env` to allow localhost bypass. Even with localhost bypass on, an `Authorization` header still gets validated when present.

## Cross-service edges

| Direction | Service | Protocol | Auth | Notes |
|-----------|---------|----------|------|-------|
| inbound | `gp-api` | HTTP (S2S) | Bearer JWT (`PEOPLE_API_S2S_SECRET`) | The only caller in production |
| outbound | none | — | — | `people-api` does not call out — it's a leaf service |

Voter data is loaded by external ETL (out of this repo). See `docs/data-pipeline.md`.

## Bootstrap

`src/main.ts` is the entry point:

1. Load alias + dotenv (`module-alias`, `src/configrc.ts`)
2. Create `NestFastifyApplication` with custom `qs` query parser (for bracketed filters like `filter[field][op]`), `genReqId` from `x-request-id`, `rawBody: true`
3. Swap in `nestjs-pino` as the global logger
4. Register Fastify OTel instrumentation (when present in global)
5. Set global prefix `/v1`, register `ZodValidationPipe`, register `PrismaExceptionFilter` then `AllExceptionsFilter` (chained)
6. Build Swagger doc at `/api`
7. Register `@fastify/helmet`, `@fastify/cors`, `@fastify/cookie`, `@fastify/static` (serves `public/`)
8. Listen on `PORT` (default 3000; we deploy on `3002` per `.env`)

## Key patterns

- **`createPrismaBase(MODELS.X)`** (`src/prisma/util/prisma.util.ts`) — every data-access service extends this. Gives `this.model`, `this.client`, `this.logger`, plus bound passthroughs (`findMany`, `findFirst`, `findUnique`, `findUniqueOrThrow`, `count`).
- **Filter pipeline for `Voter`**: Zod parsing in `src/people/schemas/filters.schema.ts` → `transformFilters` (in `filters.schema.utils.ts`) → `buildVoterFiltersSql` (in `src/people/utils/filters.sql.utils.ts`) → `Prisma.sql` WHERE clauses → `$queryRaw`. Output passes through `transformToPersonOutput` to normalize L2 raw values into clean API shapes.
- **Deterministic sampling** uses `murmurhash` over `LALVOTERID` + a salt to hash voters into buckets — the same input always yields the same sample (`src/people/services/sample.service.ts`, `src/shared/util/hash.util.ts`).
- **`PrismaExceptionFilter`** translates Prisma error classes into `HttpException`s before the catch-all `AllExceptionsFilter` runs. Order matters — Prisma filter must run first.
- **Bracketed-query parsing** uses `qs` (not Fastify's default) so endpoints can accept `filter[party][in]=D,R` cleanly. Configured in the FastifyAdapter options in `src/main.ts`.

## ADRs

`docs/adr/` is not yet seeded. Add one when a non-obvious decision lands (e.g., why raw SQL for `Voter`, why partition by state, why S2S JWT instead of mTLS, why `green`/`public` schema split). Use `ai-rules/adr-template.md`.
