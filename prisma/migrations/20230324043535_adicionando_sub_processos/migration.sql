/*
  Warnings:

  - You are about to drop the `sub_processes` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `areaId` to the `processes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "processes" ADD COLUMN     "areaId" TEXT NOT NULL;

-- DropTable
DROP TABLE "sub_processes";

-- CreateTable
CREATE TABLE "subProcesses" (
    "id" TEXT NOT NULL,
    "processId" TEXT NOT NULL,
    "sub_procedure_id" TEXT,

    CONSTRAINT "subProcesses_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "processes" ADD CONSTRAINT "processes_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "areas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subProcesses" ADD CONSTRAINT "subProcesses_processId_fkey" FOREIGN KEY ("processId") REFERENCES "processes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subProcesses" ADD CONSTRAINT "subProcesses_sub_procedure_id_fkey" FOREIGN KEY ("sub_procedure_id") REFERENCES "subProcesses"("id") ON DELETE CASCADE ON UPDATE CASCADE;
