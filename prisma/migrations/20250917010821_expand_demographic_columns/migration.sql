/*
  Warnings:

  - You are about to drop the column `DateConfidence_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Landscaping_And_Lighting_Assessment_Distric` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Languages_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Mailing_Families_HHCount` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Mailing_HHParties_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `MaritalStatus_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `MilitaryStatus_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Municipal_Court_District` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Religions_Description` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Residence_Addresses_GeoHash` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Soil_And_Water_District` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Soil_And_Water_District_At_Large` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Water_Control__Water_Conservation` on the `Voter` table. All the data in the column will be lost.
  - You are about to drop the column `Water_Control__Water_Conservation_SubDistrict` on the `Voter` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Voter_Landscaping_And_Lighting_Assessment_Distric_idx";

-- DropIndex
DROP INDEX "Voter_MilitaryStatus_Description_idx";

-- DropIndex
DROP INDEX "Voter_Municipal_Court_District_idx";

-- DropIndex
DROP INDEX "Voter_Soil_And_Water_District_At_Large_idx";

-- DropIndex
DROP INDEX "Voter_Soil_And_Water_District_idx";

-- DropIndex
DROP INDEX "Voter_Water_Control__Water_Conservation_SubDistrict_idx";

-- DropIndex
DROP INDEX "Voter_Water_Control__Water_Conservation_idx";

-- AlterTable
ALTER TABLE "Voter" DROP COLUMN "DateConfidence_Description",
DROP COLUMN "Landscaping_And_Lighting_Assessment_Distric",
DROP COLUMN "Languages_Description",
DROP COLUMN "Mailing_Families_HHCount",
DROP COLUMN "Mailing_HHParties_Description",
DROP COLUMN "MaritalStatus_Description",
DROP COLUMN "MilitaryStatus_Description",
DROP COLUMN "Municipal_Court_District",
DROP COLUMN "Religions_Description",
DROP COLUMN "Residence_Addresses_GeoHash",
DROP COLUMN "Soil_And_Water_District",
DROP COLUMN "Soil_And_Water_District_At_Large",
DROP COLUMN "Water_Control__Water_Conservation",
DROP COLUMN "Water_Control__Water_Conservation_SubDistrict",
ADD COLUMN     "Business_Owner" TEXT,
ADD COLUMN     "Education_Of_Person" TEXT,
ADD COLUMN     "Estimated_Income_Amount" TEXT,
ADD COLUMN     "Homeowner_Probability_Model" TEXT,
ADD COLUMN     "Judicial_Municipal_Court_District" TEXT,
ADD COLUMN     "Landscaping_and_Lighting_Assessment_District" TEXT,
ADD COLUMN     "Language_Code" TEXT,
ADD COLUMN     "Marital_Status" TEXT,
ADD COLUMN     "Presence_Of_Children" TEXT,
ADD COLUMN     "Registered_Voter" BOOLEAN,
ADD COLUMN     "Veteran_Status" TEXT,
ADD COLUMN     "Voter_Status" TEXT,
ADD COLUMN     "Voter_Status_UpdatedAt" TIMESTAMP(3),
ADD COLUMN     "Water_Control_Water_Conservation" TEXT,
ADD COLUMN     "Water_Control_Water_Conservation_SubDistrict" TEXT;

-- CreateIndex
CREATE INDEX "Voter_Judicial_Municipal_Court_District_idx" ON "Voter"("Judicial_Municipal_Court_District");

-- CreateIndex
CREATE INDEX "Voter_Water_Control_Water_Conservation_idx" ON "Voter"("Water_Control_Water_Conservation");

-- CreateIndex
CREATE INDEX "Voter_Water_Control_Water_Conservation_SubDistrict_idx" ON "Voter"("Water_Control_Water_Conservation_SubDistrict");

-- CreateIndex
CREATE INDEX "Voter_Landscaping_and_Lighting_Assessment_District_idx" ON "Voter"("Landscaping_and_Lighting_Assessment_District");
