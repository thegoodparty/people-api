/*
  Warnings:

  - The primary key for the `Voter` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `id` to the `Voter` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Voter` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Voter" DROP CONSTRAINT "Voter_pkey",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "id" UUID NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ADD CONSTRAINT "Voter_pkey" PRIMARY KEY ("id");
