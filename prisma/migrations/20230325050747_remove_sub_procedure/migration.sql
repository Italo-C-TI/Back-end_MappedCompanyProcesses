/*
  Warnings:

  - You are about to drop the `sub_procedures` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "procedures" DROP CONSTRAINT "procedures_areaId_fkey";

-- DropForeignKey
ALTER TABLE "sub_procedures" DROP CONSTRAINT "sub_procedures_procedureId_fkey";

-- DropForeignKey
ALTER TABLE "sub_procedures" DROP CONSTRAINT "sub_procedures_sub_procedure_id_fkey";

-- AlterTable
ALTER TABLE "procedures" ADD COLUMN     "procedureId" TEXT;

-- DropTable
DROP TABLE "sub_procedures";

-- AddForeignKey
ALTER TABLE "procedures" ADD CONSTRAINT "procedures_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "areas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "procedures" ADD CONSTRAINT "procedures_procedureId_fkey" FOREIGN KEY ("procedureId") REFERENCES "procedures"("id") ON DELETE CASCADE ON UPDATE CASCADE;
