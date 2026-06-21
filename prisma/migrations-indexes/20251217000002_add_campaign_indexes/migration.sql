-- Indexes for Campaign table
-- NOTE: In production, use CONCURRENTLY for zero-downtime, but run via psql outside Prisma
-- For development/testing, we omit CONCURRENTLY to work with Prisma's transaction-based migrations

-- Index for campaign lookup by slug (unique constraint already provides this, but demonstrates pattern)
CREATE INDEX IF NOT EXISTS "Campaign_slug_idx"
  ON "green"."Campaign"("slug");

-- Index for active campaigns
CREATE INDEX IF NOT EXISTS "Campaign_is_active_idx"
  ON "green"."Campaign"("is_active")
  WHERE "is_active" = true;

-- Index for campaign status filtering
CREATE INDEX IF NOT EXISTS "Campaign_status_idx"
  ON "green"."Campaign"("status");

-- Composite index for active campaigns by status
CREATE INDEX IF NOT EXISTS "Campaign_active_status_idx"
  ON "green"."Campaign"("is_active", "status")
  WHERE "is_active" = true;

-- Index for date range queries
CREATE INDEX IF NOT EXISTS "Campaign_start_date_idx"
  ON "green"."Campaign"("start_date")
  WHERE "start_date" IS NOT NULL;

CREATE INDEX IF NOT EXISTS "Campaign_end_date_idx"
  ON "green"."Campaign"("end_date")
  WHERE "end_date" IS NOT NULL;

-- Composite index for date range filtering
CREATE INDEX IF NOT EXISTS "Campaign_date_range_idx"
  ON "green"."Campaign"("start_date", "end_date");

-- Index for sorting by creation time
CREATE INDEX IF NOT EXISTS "Campaign_created_at_idx"
  ON "green"."Campaign"("created_at" DESC);

-- GIN index for JSONB metadata searches (demonstrates advanced indexing)
CREATE INDEX IF NOT EXISTS "Campaign_metadata_gin_idx"
  ON "green"."Campaign" USING GIN ("metadata");

-- GIN index for array tag searches
CREATE INDEX IF NOT EXISTS "Campaign_tags_gin_idx"
  ON "green"."Campaign" USING GIN ("tags");

-- Functional index for case-insensitive name searches
CREATE INDEX IF NOT EXISTS "Campaign_name_lower_idx"
  ON "green"."Campaign"(lower("name"));

-- Index for owner relationship (if foreign key is used)
CREATE INDEX IF NOT EXISTS "Campaign_owner_voter_id_idx"
  ON "green"."Campaign"("owner_voter_id")
  WHERE "owner_voter_id" IS NOT NULL;
