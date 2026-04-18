-- Campaign table with various types to validate Prisma type safety
-- This example demonstrates different PostgreSQL types

-- Create the green schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS "green";



-- Create enum for campaign status
CREATE TYPE "green"."CampaignStatus" AS ENUM ('DRAFT', 'ACTIVE', 'PAUSED', 'COMPLETED', 'CANCELLED');

-- Create the Campaign table with diverse column types
CREATE TABLE "green"."Campaign" (
    -- UUID primary key
    "id" UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- Text types
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "slug" VARCHAR(100) UNIQUE NOT NULL,

    -- Numeric types
    "budget" INTEGER NOT NULL DEFAULT 0,
    "conversion_rate" DECIMAL(5,4),
    "impressions" BIGINT DEFAULT 0,

    -- Boolean
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_featured" BOOLEAN DEFAULT false,

    -- Timestamps
    "start_date" TIMESTAMP(3),
    "end_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- JSON types
    "metadata" JSONB,
    "settings" JSON,

    -- Array type
    "tags" TEXT[],

    -- Enum
    "status" "green"."CampaignStatus" NOT NULL DEFAULT 'DRAFT',

    -- Foreign key to existing Voter table (optional, demonstrates relationships)
    "owner_voter_id" VARCHAR(255),

    -- Constraints
    CONSTRAINT "Campaign_end_date_after_start" CHECK ("end_date" IS NULL OR "start_date" IS NULL OR "end_date" > "start_date"),
    CONSTRAINT "Campaign_budget_positive" CHECK ("budget" >= 0)
);

-- Add comments for documentation
COMMENT ON TABLE "green"."Campaign" IS 'Example table demonstrating various PostgreSQL types for Prisma type safety validation';
COMMENT ON COLUMN "green"."Campaign"."metadata" IS 'JSONB for structured metadata (more efficient)';
COMMENT ON COLUMN "green"."Campaign"."settings" IS 'JSON for unstructured settings';
COMMENT ON COLUMN "green"."Campaign"."tags" IS 'Array of text tags for campaign categorization';
