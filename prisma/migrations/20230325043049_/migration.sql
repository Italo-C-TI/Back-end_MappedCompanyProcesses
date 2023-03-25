/*
  Warnings:

  - You are about to drop the `processes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "processes" DROP CONSTRAINT "processes_areaId_fkey";

-- DropForeignKey
ALTER TABLE "subProcesses" DROP CONSTRAINT "subProcesses_processId_fkey";

-- AlterTable
ALTER TABLE "subProcesses" ADD COLUMN     "tools" TEXT[];

-- DropTable
DROP TABLE "processes";

-- CreateTable
CREATE TABLE "procedures" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "areaId" TEXT NOT NULL,
    "tools" TEXT[],

    CONSTRAINT "procedures_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "procedures" ADD CONSTRAINT "procedures_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "areas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subProcesses" ADD CONSTRAINT "subProcesses_processId_fkey" FOREIGN KEY ("processId") REFERENCES "procedures"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
