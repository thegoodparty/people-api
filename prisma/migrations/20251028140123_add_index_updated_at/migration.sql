-- DropIndex
DROP INDEX "Voter_State_idx";

-- CreateIndex
CREATE INDEX "Voter_State_updated_at_idx" ON "Voter"("State", "updated_at");
