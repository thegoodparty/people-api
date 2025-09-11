/*
  Warnings:

  - You are about to drop the column `Voters_Active` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_Age` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_Age_Int` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_CalculatedRegDate` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_CountyVoterID` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_FIPS` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_FirstName` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_Gender` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_LastName` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_MiddleName` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_MovedFrom_Date` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_MovedFrom_Party_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_MovedFrom_State` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_NameSuffix` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_OfficialRegDate` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_PlaceOfBirth` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_SequenceOddEven` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_SequenceZigZag` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_StateVoterID` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_VotingPerformanceEvenYearGeneral` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_VotingPerformanceEvenYearGeneralAndPrimary` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_VotingPerformanceEvenYearPrimary` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Voters_VotingPerformanceMinorElection` on the `Voter` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Voter_Voters_Active_idx";

-- DropIndex
DROP INDEX "Voter_Voters_Age_idx";

-- DropIndex
DROP INDEX "Voter_Voters_CalculatedRegDate_idx";

-- DropIndex
DROP INDEX "Voter_Voters_FirstName_idx";

-- DropIndex
DROP INDEX "Voter_Voters_Gender_idx";

-- DropIndex
DROP INDEX "Voter_Voters_LastName_idx";

-- DropIndex
DROP INDEX "Voter_Voters_MiddleName_idx";

-- DropIndex
DROP INDEX "Voter_Voters_OfficialRegDate_idx";

-- DropIndex
DROP INDEX "Voter_Voters_VotingPerformanceEvenYearGeneralAndPrimary_idx";

-- DropIndex
DROP INDEX "Voter_Voters_VotingPerformanceEvenYearGeneral_idx";

-- DropIndex
DROP INDEX "Voter_Voters_VotingPerformanceEvenYearPrimary_idx";

-- DropIndex
DROP INDEX "Voter_Voters_VotingPerformanceMinorElection_idx";

-- AlterTable
ALTER TABLE "Voter" DROP COLUMN "Voters_Active",
DROP COLUMN "Voters_Age",
DROP COLUMN "Voters_Age_Int",
DROP COLUMN "Voters_CalculatedRegDate",
DROP COLUMN "Voters_CountyVoterID",
DROP COLUMN "Voters_FIPS",
DROP COLUMN "Voters_FirstName",
DROP COLUMN "Voters_Gender",
DROP COLUMN "Voters_LastName",
DROP COLUMN "Voters_MiddleName",
DROP COLUMN "Voters_MovedFrom_Date",
DROP COLUMN "Voters_MovedFrom_Party_Description",
DROP COLUMN "Voters_MovedFrom_State",
DROP COLUMN "Voters_NameSuffix",
DROP COLUMN "Voters_OfficialRegDate",
DROP COLUMN "Voters_PlaceOfBirth",
DROP COLUMN "Voters_SequenceOddEven",
DROP COLUMN "Voters_SequenceZigZag",
DROP COLUMN "Voters_StateVoterID",
DROP COLUMN "Voters_VotingPerformanceEvenYearGeneral",
DROP COLUMN "Voters_VotingPerformanceEvenYearGeneralAndPrimary",
DROP COLUMN "Voters_VotingPerformanceEvenYearPrimary",
DROP COLUMN "Voters_VotingPerformanceMinorElection",
ADD COLUMN     "Active" TEXT,
ADD COLUMN     "Age" TEXT,
ADD COLUMN     "Age_Int" INTEGER,
ADD COLUMN     "CalculatedRegDate" DATE,
ADD COLUMN     "CountyVoterID" TEXT,
ADD COLUMN     "FIPS" TEXT,
ADD COLUMN     "FirstName" TEXT,
ADD COLUMN     "Gender" TEXT,
ADD COLUMN     "LastName" TEXT,
ADD COLUMN     "MiddleName" TEXT,
ADD COLUMN     "MovedFrom_Date" DATE,
ADD COLUMN     "MovedFrom_Party_Description" TEXT,
ADD COLUMN     "MovedFrom_State" TEXT,
ADD COLUMN     "NameSuffix" TEXT,
ADD COLUMN     "OfficialRegDate" TEXT,
ADD COLUMN     "PlaceOfBirth" TEXT,
ADD COLUMN     "SequenceOddEven" TEXT,
ADD COLUMN     "SequenceZigZag" TEXT,
ADD COLUMN     "StateVoterID" TEXT,
ADD COLUMN     "VotingPerformanceEvenYearGeneral" TEXT,
ADD COLUMN     "VotingPerformanceEvenYearGeneralAndPrimary" TEXT,
ADD COLUMN     "VotingPerformanceEvenYearPrimary" TEXT,
ADD COLUMN     "VotingPerformanceMinorElection" TEXT;

-- CreateIndex
CREATE INDEX "Voter_FirstName_idx" ON "Voter"("FirstName");

-- CreateIndex
CREATE INDEX "Voter_MiddleName_idx" ON "Voter"("MiddleName");

-- CreateIndex
CREATE INDEX "Voter_LastName_idx" ON "Voter"("LastName");

-- CreateIndex
CREATE INDEX "Voter_Active_idx" ON "Voter"("Active");

-- CreateIndex
CREATE INDEX "Voter_Age_idx" ON "Voter"("Age");

-- CreateIndex
CREATE INDEX "Voter_Gender_idx" ON "Voter"("Gender");

-- CreateIndex
CREATE INDEX "Voter_CalculatedRegDate_idx" ON "Voter"("CalculatedRegDate");

-- CreateIndex
CREATE INDEX "Voter_OfficialRegDate_idx" ON "Voter"("OfficialRegDate");

-- CreateIndex
CREATE INDEX "Voter_VotingPerformanceEvenYearGeneral_idx" ON "Voter"("VotingPerformanceEvenYearGeneral");

-- CreateIndex
CREATE INDEX "Voter_VotingPerformanceEvenYearPrimary_idx" ON "Voter"("VotingPerformanceEvenYearPrimary");

-- CreateIndex
CREATE INDEX "Voter_VotingPerformanceEvenYearGeneralAndPrimary_idx" ON "Voter"("VotingPerformanceEvenYearGeneralAndPrimary");

-- CreateIndex
CREATE INDEX "Voter_VotingPerformanceMinorElection_idx" ON "Voter"("VotingPerformanceMinorElection");
