# Getting Started

First-time setup for `people-api` on macOS / Linux.

## Prerequisites

- **Node** matching `.nvmrc` (`v22.12`). With `nvm`: `nvm install && nvm use`.
- **npm** (ships with Node).
- **PostgreSQL** running locally on `:5432`. Easiest path is Docker:
  ```bash
  docker run --name people-api-pg -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:15
  ```

## Clone

This repo uses `ai-rules` as a git submodule. Clone with `--recursive`:

```bash
git clone --recursive git@github.com:thegoodparty/people-api.git
cd people-api
```

If you already cloned without `--recursive`:

```bash
git submodule update --init --recursive
```

You can also bump the submodule pin to the latest `ai-rules` main with `npm run ai-rules:update`.

## Configure environment

Copy `.env.example` to `.env` and fill in:

```bash
cp .env.example .env
```

Required vars (see `.env.example`):

| Var | Default for local | Notes |
|-----|-------------------|-------|
| `DATABASE_URL` | `postgresql://postgres:postgres@localhost:5432/...` | Postgres connection string. The DB will host `green` and `public` schemas. |
| `PEOPLE_API_S2S_SECRET` | `some-secret` | Shared with `gp-api` for Bearer JWT validation. Any non-empty value works locally. |
| `S2S_ALLOW_LOCALHOST` | `false` (ships as `false` in `.env.example`) | Set to `true` locally to skip JWT signing on localhost requests. **Don't set this on hosted envs.** |
| `PORT` | `3002` | App port |
| `CORS_ORIGIN` | `http://localhost:4000` | Origin allowed by Fastify CORS |
| `LOG_LEVEL` | `debug` | Pino log level |

## Database setup

If your local Postgres user lacks privileges, the README has the `CREATE USER` / `GRANT` snippet. With the Docker `postgres:15` recipe above, the default `postgres` superuser already has what's needed.

## Install + generate

```bash
nvm use            # if you use nvm
npm install        # postinstall hook also pulls the ai-rules submodule
npm run generate   # generate the Prisma client
```

## Apply migrations + seed

```bash
npm run migrate:reset   # wipes + recreates DB, applies all migrations
npm run seed            # ~100 fake voters via @faker-js/faker
```

`npm run seed` only runs when `NODE_ENV` is unset or local — it refuses to seed `production` / `qa` / `development`. See `seed/README.md` for how to extend it.

## Run

```bash
npm run start:dev    # http://localhost:3002 (watch mode)
```

Health check: `curl http://localhost:3002/v1/health`. Swagger UI: http://localhost:3002/api.

## Talking to a protected endpoint locally

With `S2S_ALLOW_LOCALHOST=true`:

```bash
curl -X POST http://localhost:3002/v1/people \
  -H 'Content-Type: application/json' \
  -d '{"filters": {}, "page": 1, "pageSize": 10}'
```

Without localhost bypass, generate a Bearer JWT signed with `PEOPLE_API_S2S_SECRET` and send it as `Authorization: Bearer <token>`. `gp-api` is the production caller — its source has the JWT shape if you need a reference.

## Test

```bash
npm test                                                            # full suite
npx vitest run src/people/utils/filters.sql.utils.test.ts          # single file
npm run test:watch                                                  # watch mode
```

Tests load env from process — there's no `.env.test`. Mock at the boundary; for SQL builders, assert against the rendered `Prisma.Sql`.

## Lint + format

```bash
npm run lint            # eslint --fix; mutates files — stage your work first
npm run lint-format     # lint + prettier --write
```

## Common gotchas

- **`prisma generate` not run** → TS errors complaining about missing types from `@prisma/client`. Run `npm run generate`.
- **`green` / `public` schema doesn't exist** → first run of `migrate:reset` creates them. If you bypassed Prisma and created the DB by hand, re-run `migrate:reset`.
- **README says `npm run download` / `npm run load`** → those scripts are not in `package.json` anymore; ingestion happens out of repo. See `docs/data-pipeline.md`.
- **Submodule directory empty** → `git submodule update --init --recursive` or `npm run ai-rules:update`.
- **Port 3002 in use** → set `PORT=3003` in `.env`.

## Where to go next

- `CLAUDE.md` — agent + style guide for the repo.
- `docs/architecture.md` — module shape, HTTP surface, app composition.
- `docs/data-pipeline.md` — voter data sources, storage, and read pipeline.
- `ai-rules/README.md` — org-wide review rules and skills (submodule); explains how to invoke critics and use the templates.
