/*
  Warnings:

  - You are about to drop the `_DistrictToVoter` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_DistrictToVoter" DROP CONSTRAINT "_DistrictToVoter_A_fkey";

-- DropForeignKey
ALTER TABLE "_DistrictToVoter" DROP CONSTRAINT "_DistrictToVoter_B_fkey";

-- DropTable
DROP TABLE "_DistrictToVoter";

-- CreateTable
CREATE TABLE "DistrictVoter" (
    "district_id" UUID NOT NULL,
    "voter_id" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DistrictVoter_pkey" PRIMARY KEY ("district_id","voter_id")
);

-- CreateIndex
CREATE INDEX "DistrictVoter_district_id_idx" ON "DistrictVoter"("district_id");

-- CreateIndex
CREATE INDEX "DistrictVoter_voter_id_idx" ON "DistrictVoter"("voter_id");

-- AddForeignKey
ALTER TABLE "DistrictVoter" ADD CONSTRAINT "DistrictVoter_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "District"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DistrictVoter" ADD CONSTRAINT "DistrictVoter_voter_id_fkey" FOREIGN KEY ("voter_id") REFERENCES "Voter"("id") ON DELETE CASCADE ON UPDATE CASCADE;
