-- CreateTable
CREATE TABLE "Area" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    
    CONSTRAINT "Area_pkey" PRIMARY KEY ("id")
);

/*
  Warnings:

  - You are about to drop the `Area` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Area";

-- CreateTable
CREATE TABLE "areas" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "areas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "processes" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "processes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sub_processes" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "sub_processes_pkey" PRIMARY KEY ("id")
);

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

-- AlterTable
ALTER TABLE "areas" ADD COLUMN     "description" TEXT;

/*
  Warnings:

  - Made the column `description` on table `areas` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "areas" ALTER COLUMN "description" SET NOT NULL;

-- AlterTable
ALTER TABLE "areas" ALTER COLUMN "description" DROP NOT NULL;

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

/*
  Warnings:

  - You are about to drop the column `created_at` on the `procedures` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "areas" ADD COLUMN     "update_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "procedures" DROP COLUMN "created_at",
ADD COLUMN     "isConnectedArea" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "update_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

/*
  Warnings:

  - You are about to drop the column `isConnectedArea` on the `procedures` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "procedures" DROP COLUMN "isConnectedArea",
ADD COLUMN     "isConnectedProcedure" BOOLEAN NOT NULL DEFAULT false;

/*
  Warnings:

  - You are about to drop the column `isConnectedProcedure` on the `procedures` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "procedures" DROP COLUMN "isConnectedProcedure",
ALTER COLUMN "areaId" DROP NOT NULL;
