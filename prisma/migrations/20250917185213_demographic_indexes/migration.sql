-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Business_Owner_idx" ON "Voter"("Business_Owner");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Education_Of_Person_idx" ON "Voter"("Education_Of_Person");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Estimated_Income_Amount_idx" ON "Voter"("Estimated_Income_Amount");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Homeowner_Probability_Model_idx" ON "Voter"("Homeowner_Probability_Model");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Language_Code_idx" ON "Voter"("Language_Code");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Marital_Status_idx" ON "Voter"("Marital_Status");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Presence_Of_Children_idx" ON "Voter"("Presence_Of_Children");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Registered_Voter_idx" ON "Voter"("Registered_Voter");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Veteran_Status_idx" ON "Voter"("Veteran_Status");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Voter_Status_idx" ON "Voter"("Voter_Status");

-- CreateIndex
CREATE INDEX CONCURRENTLY "Voter_Voter_Status_UpdatedAt_idx" ON "Voter"("Voter_Status_UpdatedAt");
