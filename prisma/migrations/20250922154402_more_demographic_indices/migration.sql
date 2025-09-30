-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Precinct_idx" ON "Voter"("Precinct");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Age_Int_idx" ON "Voter"("Age_Int");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_VoterTelephones_CellPhoneFormatted_idx" ON "Voter"("VoterTelephones_CellPhoneFormatted");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_VoterTelephones_LandlineFormatted_idx" ON "Voter"("VoterTelephones_LandlineFormatted");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_EthnicGroups_EthnicGroup1Desc_idx" ON "Voter"("EthnicGroups_EthnicGroup1Desc");
