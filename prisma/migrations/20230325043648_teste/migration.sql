/*
  Warnings:

  - You are about to drop the `subProcedures` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "subProcedures" DROP CONSTRAINT "subProcedures_processId_fkey";

-- DropForeignKey
ALTER TABLE "subProcedures" DROP CONSTRAINT "subProcedures_sub_procedure_id_fkey";

-- DropTable
DROP TABLE "subProcedures";

-- CreateTable
CREATE TABLE "sub_procedures" (
    "id" TEXT NOT NULL,
    "tools" TEXT[],
    "procedureId" TEXT NOT NULL,
    "sub_procedure_id" TEXT,

    CONSTRAINT "sub_procedures_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "sub_procedures" ADD CONSTRAINT "sub_procedures_procedureId_fkey" FOREIGN KEY ("procedureId") REFERENCES "procedures"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_procedures" ADD CONSTRAINT "sub_procedures_sub_procedure_id_fkey" FOREIGN KEY ("sub_procedure_id") REFERENCES "sub_procedures"("id") ON DELETE CASCADE ON UPDATE CASCADE;
