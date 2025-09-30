-- Create missing demographic indices with CONCURRENTLY for non-blocking operation.
-- These indices were skipped during initial deployment due to timeout issues.
-- CONCURRENTLY allows the database to remain fully operational during index creation.
--
-- Expected duration on large production DB: 15-20 minutes
-- Develop (small DB) will complete in seconds

-- From 20250917185213_demographic_indexes
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Business_Owner_idx" ON "Voter"("Business_Owner");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Education_Of_Person_idx" ON "Voter"("Education_Of_Person");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Estimated_Income_Amount_idx" ON "Voter"("Estimated_Income_Amount");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Homeowner_Probability_Model_idx" ON "Voter"("Homeowner_Probability_Model");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Language_Code_idx" ON "Voter"("Language_Code");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Marital_Status_idx" ON "Voter"("Marital_Status");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Presence_Of_Children_idx" ON "Voter"("Presence_Of_Children");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Registered_Voter_idx" ON "Voter"("Registered_Voter");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Veteran_Status_idx" ON "Voter"("Veteran_Status");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Voter_Status_idx" ON "Voter"("Voter_Status");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Voter_Status_UpdatedAt_idx" ON "Voter"("Voter_Status_UpdatedAt");

-- From 20250922154402_more_demographic_indices
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Precinct_idx" ON "Voter"("Precinct");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Age_Int_idx" ON "Voter"("Age_Int");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_VoterTelephones_CellPhoneFormatted_idx" ON "Voter"("VoterTelephones_CellPhoneFormatted");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_VoterTelephones_LandlineFormatted_idx" ON "Voter"("VoterTelephones_LandlineFormatted");
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_EthnicGroups_EthnicGroup1Desc_idx" ON "Voter"("EthnicGroups_EthnicGroup1Desc");

-- From 20250923193257_income_int
CREATE INDEX CONCURRENTLY IF NOT EXISTS "Voter_Estimated_Income_Amount_Int_idx" ON "Voter"("Estimated_Income_Amount_Int");
