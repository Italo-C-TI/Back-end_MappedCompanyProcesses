/*
  Warnings:

  - You are about to drop the `subProcesses` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "subProcesses" DROP CONSTRAINT "subProcesses_processId_fkey";

-- DropForeignKey
ALTER TABLE "subProcesses" DROP CONSTRAINT "subProcesses_sub_procedure_id_fkey";

-- DropTable
DROP TABLE "subProcesses";

-- CreateTable
CREATE TABLE "subProcedures" (
    "id" TEXT NOT NULL,
    "tools" TEXT[],
    "processId" TEXT NOT NULL,
    "sub_procedure_id" TEXT,

    CONSTRAINT "subProcedures_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "subProcedures" ADD CONSTRAINT "subProcedures_processId_fkey" FOREIGN KEY ("processId") REFERENCES "procedures"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subProcedures" ADD CONSTRAINT "subProcedures_sub_procedure_id_fkey" FOREIGN KEY ("sub_procedure_id") REFERENCES "subProcedures"("id") ON DELETE CASCADE ON UPDATE CASCADE;
