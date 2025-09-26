-- AlterTable
ALTER TABLE "Voter" ADD COLUMN     "Estimated_Income_Amount_Int" INTEGER;

-- CreateIndex
CREATE INDEX "Voter_Estimated_Income_Amount_Int_idx" ON "Voter"("Estimated_Income_Amount_Int");
