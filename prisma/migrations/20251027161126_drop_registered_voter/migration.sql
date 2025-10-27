/*
  Warnings:

  - You are about to drop the column `Registered_Voter` on the `Voter` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Voter_Registered_Voter_idx";

-- AlterTable
ALTER TABLE "Voter" DROP COLUMN "Registered_Voter";
