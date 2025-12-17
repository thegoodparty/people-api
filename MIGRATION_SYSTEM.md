# Dual Migration System

## Overview

This project uses a dual migration system for PostgreSQL schema management:

1. **Schema migrations** (`prisma/migrations-schema/`) - Core table structures, columns, types, constraints
2. **Index migrations** (`prisma/migrations-indexes/`) - Database indexes (can be deployed independently)

Both systems use **Prisma Migrate** for tracking, but migrations are written as **manual SQL files** (not generated from Prisma schema). After migrations run, use `npm run db:pull` to generate Prisma models from the actual database.

## Why Two Systems?

- **Independent deployment**: Deploy schema changes without expensive index builds
- **ETL optimization**: Load heavy tables without indexes, add indexes afterward
- **Zero-downtime**: Index migrations can be run separately during low-traffic periods
- **Clear separation**: Schema structure vs performance optimization

## Available Commands

### Schema Migrations (Tables, Columns, Types, Constraints)

```bash
# Create a new empty schema migration
npm run migrate:schema:create -- --name add_voter_history_table

# Apply schema migrations in development (local)
npm run migrate:schema:dev

# Deploy schema migrations in production
npm run migrate:schema:deploy
```

### Index Migrations (Indexes Only)

```bash
# Create a new empty index migration
npm run migrate:indexes:create -- --name add_voting_performance_indexes

# Apply index migrations in development (local)
npm run migrate:indexes:dev

# Deploy index migrations in production
npm run migrate:indexes:deploy
```

### Combined Operations

```bash
# Deploy both schema and index migrations
npm run migrate:all:deploy

# Pull database schema and regenerate Prisma models (run after migrations)
npm run db:pull
```

## Workflow for Creating Migrations

### Creating a Schema Migration

1. **Create empty migration:**

   ```bash
   npm run migrate:schema:create -- --name add_voter_verified_flag
   ```

2. **Write SQL manually** in the generated file:

   ```
   prisma/migrations-schema/migrations/[timestamp]_add_voter_verified_flag/migration.sql
   ```

3. **Apply migration locally:**

   ```bash
   npm run migrate:schema:dev
   ```

4. **Regenerate Prisma models from DB:**

   ```bash
   npm run db:pull
   ```

5. **Commit changes:**
   ```bash
   git add prisma/migrations-schema/migrations/
   git add prisma/schema/
   git commit -m "Add voter verified flag"
   ```

### Creating an Index Migration

Same workflow as above, but use `migrate:indexes:*` commands instead.

## Example: Campaign Table

The system includes an example `Campaign` table demonstrating various PostgreSQL types:

**Types validated:**

- `UUID` (id)
- `VARCHAR`/`TEXT` (name, description, slug)
- `INTEGER`/`BIGINT` (budget, impressions)
- `DECIMAL` (conversion_rate)
- `BOOLEAN` (is_active, is_featured)
- `TIMESTAMP` (start_date, end_date, created_at, updated_at)
- `JSONB`/`JSON` (metadata, settings)
- `TEXT[]` (tags array)
- `ENUM` (CampaignStatus)

**Index types demonstrated:**

- Standard indexes
- Unique indexes
- Partial indexes (with WHERE clauses)
- Composite indexes
- GIN indexes (for JSONB and arrays)
- Functional indexes (case-insensitive)
- Sorted indexes

## Production Deployment

### Option 1: Sequential (Schema → ETL → Indexes)

```bash
# Step 1: Deploy schema migrations only
SKIP_INDEX_MIGRATIONS=true docker run ...

# Step 2: Run ETL to load data

# Step 3: Deploy index migrations separately
SKIP_INDEX_MIGRATIONS=false docker run ...
```

### Option 2: Combined (Small changes)

```bash
# Deploy both migrations together (if indexes are fast)
docker run ...
```

### Option 3: Manual Index Management

```bash
# Deploy schema via container
SKIP_INDEX_MIGRATIONS=true docker run ...

# Run expensive indexes manually via psql with CONCURRENTLY
psql $DATABASE_URL -c "CREATE INDEX CONCURRENTLY ..."
```

## Important Notes

### About CONCURRENTLY

- `CREATE INDEX CONCURRENTLY` provides zero-downtime index creation
- **Cannot run inside Prisma transactions** (Prisma limitation)
- For production indexes with CONCURRENTLY, either:
  1. Run via psql separately from Prisma migrations
  2. Use the index migration system without CONCURRENTLY for dev/test
  3. Create a custom deployment script outside Prisma

### About Prisma Configuration

**Configuration is in TypeScript** (`prisma.config.ts`):

- Datasource and generator settings are defined in `prisma.config.ts`
- No more config in .prisma files!

**Schema file is models-only** (`prisma/generated-schema.prisma`):

- This file is **generated from the database** using `prisma db pull`

- **DO NOT** edit `prisma/schema/` to create migrations
- **DO** create migrations in `prisma/migrations-schema/` or `prisma/migrations-indexes/`
- **DO** run `npm run db:pull` after migrations to sync Prisma models with DB

### Environment Variable

Set `SKIP_INDEX_MIGRATIONS=true` to skip index migrations during deployment (useful for ETL workflows).

## Directory Structure

```
prisma.config.ts                     # Main Prisma configuration (datasource + generator)

prisma/
├── generated-schema.prisma                    # Generated models only (via db pull)
│
├── migrations-schema/               # SCHEMA migrations
│   ├── generated-schema.prisma                # Minimal tracking config
│   └── migrations/
│       └── [timestamp]_[name]/
│           └── migration.sql        # Manual SQL
│
└── migrations-indexes/              # INDEX migrations
    ├── generated-schema.prisma                # Minimal tracking config
    └── migrations/
        └── [timestamp]_[name]/
            └── migration.sql        # Manual SQL
```

## Benefits

✅ **Independent Deployment** - Deploy schema changes without expensive index builds
✅ **Zero-Downtime Indexes** - Run indexes during low-traffic periods
✅ **ETL Optimization** - Load data without indexes, add indexes after
✅ **Clear History** - Separate migration histories for structure vs performance
✅ **Prisma Tracking** - Leverage Prisma Migrate's `_prisma_migrations` table
✅ **Type Safety** - `prisma db pull` keeps models in sync with actual DB
✅ **Full SQL Control** - Write migrations manually, no schema generation
