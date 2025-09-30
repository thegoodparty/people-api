-- Ensure all demographic indices exist.
-- Uses IF NOT EXISTS to safely handle both environments:
-- - Develop: Indices already exist from previous migrations, will skip
-- - Master: May need to create indices if previous migrations timed out

CREATE INDEX IF NOT EXISTS "Voter_Business_Owner_idx" ON "Voter"("Business_Owner");
CREATE INDEX IF NOT EXISTS "Voter_Education_Of_Person_idx" ON "Voter"("Education_Of_Person");
CREATE INDEX IF NOT EXISTS "Voter_Estimated_Income_Amount_idx" ON "Voter"("Estimated_Income_Amount");
CREATE INDEX IF NOT EXISTS "Voter_Homeowner_Probability_Model_idx" ON "Voter"("Homeowner_Probability_Model");
CREATE INDEX IF NOT EXISTS "Voter_Language_Code_idx" ON "Voter"("Language_Code");
CREATE INDEX IF NOT EXISTS "Voter_Marital_Status_idx" ON "Voter"("Marital_Status");
CREATE INDEX IF NOT EXISTS "Voter_Presence_Of_Children_idx" ON "Voter"("Presence_Of_Children");
CREATE INDEX IF NOT EXISTS "Voter_Registered_Voter_idx" ON "Voter"("Registered_Voter");
CREATE INDEX IF NOT EXISTS "Voter_Veteran_Status_idx" ON "Voter"("Veteran_Status");
CREATE INDEX IF NOT EXISTS "Voter_Voter_Status_idx" ON "Voter"("Voter_Status");
CREATE INDEX IF NOT EXISTS "Voter_Voter_Status_UpdatedAt_idx" ON "Voter"("Voter_Status_UpdatedAt");
CREATE INDEX IF NOT EXISTS "Voter_Precinct_idx" ON "Voter"("Precinct");
CREATE INDEX IF NOT EXISTS "Voter_Age_Int_idx" ON "Voter"("Age_Int");
CREATE INDEX IF NOT EXISTS "Voter_VoterTelephones_CellPhoneFormatted_idx" ON "Voter"("VoterTelephones_CellPhoneFormatted");
CREATE INDEX IF NOT EXISTS "Voter_VoterTelephones_LandlineFormatted_idx" ON "Voter"("VoterTelephones_LandlineFormatted");
CREATE INDEX IF NOT EXISTS "Voter_EthnicGroups_EthnicGroup1Desc_idx" ON "Voter"("EthnicGroups_EthnicGroup1Desc");
CREATE INDEX IF NOT EXISTS "Voter_Estimated_Income_Amount_Int_idx" ON "Voter"("Estimated_Income_Amount_Int");
