# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

people-api is a NestJS/Fastify internal API serving 200M+ US voter records sourced from L2 (voter data vendor). It is called exclusively by gp-api via S2S JWT authentication — there are no end-user-facing routes.

## Commands

```bash
npm run start:dev          # Dev server on :3002 (watches for changes)
npm run build              # Production build (nest build)
npm run test               # Run all tests (vitest run)
npm run test:watch         # Watch mode (vitest)
npx vitest run src/people/utils/filters.sql.utils.test.ts  # Single test file
npm run lint               # ESLint with --fix
npm run format             # Prettier
npm run migrate:dev        # Prisma migrate dev
npm run migrate:deploy     # Prisma migrate deploy (production)
npm run generate           # Prisma generate (after schema changes)
npm run seed               # Seed database
```

## Architecture

### Module Structure

```
AppModule
├── PrismaModule (@Global) → PrismaService
├── AuthModule → S2SAuthGuard (global APP_GUARD)
├── HealthModule → GET /v1/health (@Public)
└── PeopleModule
    ├── PeopleController (/v1/people)
    ├── PeopleService → raw SQL queries against partitioned Voter table
    ├── SampleService → deterministic hash-bucket sampling
    ├── StatsService → pre-computed district demographics from DistrictStats
    └── DistrictModule → DistrictService
```

### API Endpoints (all under `/v1/people`)

| Method | Path | Purpose |
|--------|------|---------|
| POST | `/people` | List/filter voters with pagination |
| POST | `/people/download` | Stream filtered voters as CSV |
| GET/POST | `/people/sample` | Deterministic voter sampling for a district |
| GET | `/people/stats` | Pre-computed district demographic stats |
| GET | `/people/:id` | Single voter by ID |

### Database & Prisma

Multi-file schema in `prisma/schema/` using `prismaSchemaFolder` and `multiSchema` preview features. Two PostgreSQL schemas: `public` (enums) and `green` (all tables).

**Models:** Voter (100+ L2 columns, partitioned by state), District, DistrictVoter (join table), DistrictStats (pre-computed demographics with `buckets` JSON column).

**Critical pattern:** The Voter table is partitioned by state in the `green` schema. Nearly all voter queries use raw SQL via `Prisma.sql` / `$queryRaw` — not Prisma ORM CRUD methods. Prisma ORM methods are only used for District and DistrictStats lookups.

### createPrismaBase Pattern

All data-access services extend `createPrismaBase(MODELS.ModelName)` from `src/prisma/util/prisma.util.ts`. This factory provides passthrough methods (`findMany`, `findFirst`, `count`, etc.) plus `this.model` and `this.client` accessors. Never inject `PrismaService` directly into new services.

### Filter Pipeline

1. **Zod parsing** (`src/people/schemas/filters.schema.ts`) — validates and transforms raw filter input
2. **transformFilters** (`src/people/schemas/filters.schema.utils.ts`) — converts to structured `FilterData` with filters, filterValues, filterOperators
3. **buildVoterFiltersSql** (`src/people/utils/filters.sql.utils.ts`) — converts `FilterData` to `Prisma.Sql` WHERE clauses

### Output Transformation

Raw L2 field names/values are mapped to clean API output via `transformToPersonOutput` in `src/people/utils/transformToPersonOutput.utils.ts`. Mapper functions normalize gender, party, ethnicity, marital status, etc.

### Authentication

`S2SAuthGuard` (global) validates Bearer JWT signed with `PEOPLE_API_S2S_SECRET` (shared with gp-api). Use `@Public()` decorator to bypass auth. Dev env allows localhost bypass via `S2S_ALLOW_LOCALHOST=true`.

### Global Setup (main.ts)

- `ZodValidationPipe` — global validation via Zod schemas
- `PrismaExceptionFilter` → `AllExceptionsFilter` — exception filter chain
- `NewRelicInterceptor` — APM transaction names and slow-request events
- Fastify plugins: `@fastify/helmet`, `@fastify/cors`, `@fastify/cookie`, `@fastify/static`
- Global prefix: `/v1`
- Custom `qs` parser for bracketed query params

## Testing

**Runner:** Vitest with SWC transpiler. Config in `vitest.config.ts`.

**File naming:** `*.test.ts` (not `*.spec.ts`). `nest-cli.json` has `spec: false`.

**Patterns:**
- Use `@nestjs/testing` `Test.createTestingModule` with `useValue`/`useClass` for DI
- Fakes over mocks — `vi.fn()` only for callbacks/event handlers
- Follow the rules in `ai-rules/`
- When writing or modifying code, consider spawning a critic subagent:
  ```
  Read each .md file in ai-rules/. For each rule file relevant to my changes,
  review the code I changed against those rules. For each violation, cite the
  rule number, quote the offending code, and explain what to change.
  ```

## Code Style

- **Formatting:** singleQuote, no semicolons, trailing commas (`"all"`)
- **No comments in code**
- ESLint: `no-explicit-any: off`, `unused-imports/no-unused-imports: error`
- TypeScript: `strict: true`, `strictNullChecks: true`, `noImplicitAny: false`

## Deploy

SST v3 + Pulumi in `deploy/sst.config.ts`. Two stages: `develop` and `master`. ECS Fargate behind ALB. Secrets from AWS Secrets Manager (`PEOPLE_API_DEV` / `PEOPLE_API_PROD`). CI/CD: GitHub Actions triggers CodeBuild on push to develop/master.

- Prod: `people-api.goodparty.org` (4GB, 1 vCPU, 2-16 tasks)
- Dev: `people-api-dev.goodparty.org` (2GB, 0.5 vCPU, 1-4 tasks)
