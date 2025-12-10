-- Composite index to support ordering by LastName, FirstName within partitions
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_last_first_id_idx" ON "Voter"("LastName","FirstName","id");

-- Functional index to support case-insensitive equals on Parties_Description
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_parties_desc_lower_idx" ON "Voter"(lower("Parties_Description"));

-- Optional functional indexes for case-insensitive name lookups (safe no-ops if not used)
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_firstname_lower_idx" ON "Voter"(lower("FirstName"));
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_lastname_lower_idx" ON "Voter"(lower("LastName"));

-- Partial indexes for non-null phone lookups
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_cell_fmt_nn_idx" ON "Voter"("VoterTelephones_CellPhoneFormatted") WHERE "VoterTelephones_CellPhoneFormatted" IS NOT NULL;
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_landline_fmt_nn_idx" ON "Voter"("VoterTelephones_LandlineFormatted") WHERE "VoterTelephones_LandlineFormatted" IS NOT NULL;

-- DistrictVoter helper indexes for common lookups
CREATE INDEX CONCURRENTLY IF NOT EXISTS "DistrictVoter_voter_id_idx" ON "DistrictVoter"("voter_id");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "DistrictVoter_district_id_idx" ON "DistrictVoter"("district_id");


