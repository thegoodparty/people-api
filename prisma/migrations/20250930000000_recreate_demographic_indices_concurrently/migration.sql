-- Drop existing non-concurrent indexes from 20250917185213_demographic_indexes
DROP INDEX IF EXISTS "Voter_Business_Owner_idx";
DROP INDEX IF EXISTS "Voter_Education_Of_Person_idx";
DROP INDEX IF EXISTS "Voter_Estimated_Income_Amount_idx";
DROP INDEX IF EXISTS "Voter_Homeowner_Probability_Model_idx";
DROP INDEX IF EXISTS "Voter_Language_Code_idx";
DROP INDEX IF EXISTS "Voter_Marital_Status_idx";
DROP INDEX IF EXISTS "Voter_Presence_Of_Children_idx";
DROP INDEX IF EXISTS "Voter_Registered_Voter_idx";
DROP INDEX IF EXISTS "Voter_Veteran_Status_idx";
DROP INDEX IF EXISTS "Voter_Voter_Status_idx";
DROP INDEX IF EXISTS "Voter_Voter_Status_UpdatedAt_idx";

-- Drop existing non-concurrent indexes from 20250922154402_more_demographic_indices
DROP INDEX IF EXISTS "Voter_Precinct_idx";
DROP INDEX IF EXISTS "Voter_Age_Int_idx";
DROP INDEX IF EXISTS "Voter_VoterTelephones_CellPhoneFormatted_idx";
DROP INDEX IF EXISTS "Voter_VoterTelephones_LandlineFormatted_idx";
DROP INDEX IF EXISTS "Voter_EthnicGroups_EthnicGroup1Desc_idx";

-- Drop existing non-concurrent index from 20250923193257_income_int
DROP INDEX IF EXISTS "Voter_Estimated_Income_Amount_Int_idx";

-- Recreate all indexes concurrently (non-blocking)
-- From 20250917185213_demographic_indexes
CREATE INDEX CONCURRENTLY "Voter_Business_Owner_idx" ON "Voter"("Business_Owner");
CREATE INDEX CONCURRENTLY "Voter_Education_Of_Person_idx" ON "Voter"("Education_Of_Person");
CREATE INDEX CONCURRENTLY "Voter_Estimated_Income_Amount_idx" ON "Voter"("Estimated_Income_Amount");
CREATE INDEX CONCURRENTLY "Voter_Homeowner_Probability_Model_idx" ON "Voter"("Homeowner_Probability_Model");
CREATE INDEX CONCURRENTLY "Voter_Language_Code_idx" ON "Voter"("Language_Code");
CREATE INDEX CONCURRENTLY "Voter_Marital_Status_idx" ON "Voter"("Marital_Status");
CREATE INDEX CONCURRENTLY "Voter_Presence_Of_Children_idx" ON "Voter"("Presence_Of_Children");
CREATE INDEX CONCURRENTLY "Voter_Registered_Voter_idx" ON "Voter"("Registered_Voter");
CREATE INDEX CONCURRENTLY "Voter_Veteran_Status_idx" ON "Voter"("Veteran_Status");
CREATE INDEX CONCURRENTLY "Voter_Voter_Status_idx" ON "Voter"("Voter_Status");
CREATE INDEX CONCURRENTLY "Voter_Voter_Status_UpdatedAt_idx" ON "Voter"("Voter_Status_UpdatedAt");

-- From 20250922154402_more_demographic_indices
CREATE INDEX CONCURRENTLY "Voter_Precinct_idx" ON "Voter"("Precinct");
CREATE INDEX CONCURRENTLY "Voter_Age_Int_idx" ON "Voter"("Age_Int");
CREATE INDEX CONCURRENTLY "Voter_VoterTelephones_CellPhoneFormatted_idx" ON "Voter"("VoterTelephones_CellPhoneFormatted");
CREATE INDEX CONCURRENTLY "Voter_VoterTelephones_LandlineFormatted_idx" ON "Voter"("VoterTelephones_LandlineFormatted");
CREATE INDEX CONCURRENTLY "Voter_EthnicGroups_EthnicGroup1Desc_idx" ON "Voter"("EthnicGroups_EthnicGroup1Desc");

-- From 20250923193257_income_int
CREATE INDEX CONCURRENTLY "Voter_Estimated_Income_Amount_Int_idx" ON "Voter"("Estimated_Income_Amount_Int");
