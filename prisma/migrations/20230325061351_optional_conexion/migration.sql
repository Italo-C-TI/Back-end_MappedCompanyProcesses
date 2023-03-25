/*
  Warnings:

  - You are about to drop the column `isConnectedProcedure` on the `procedures` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "procedures" DROP COLUMN "isConnectedProcedure",
ALTER COLUMN "areaId" DROP NOT NULL;
