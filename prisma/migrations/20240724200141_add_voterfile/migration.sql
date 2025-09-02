-- CreateTable
CREATE TABLE "VoterFile" (
    "Filename" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Lines" INTEGER NOT NULL DEFAULT 0,
    "Loaded" BOOLEAN NOT NULL DEFAULT false,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VoterFile_pkey" PRIMARY KEY ("Filename")
);

-- CreateIndex
CREATE UNIQUE INDEX "VoterFile_Filename_key" ON "VoterFile"("Filename");

-- CreateIndex
CREATE INDEX "VoterFile_Filename_idx" ON "VoterFile"("Filename");
