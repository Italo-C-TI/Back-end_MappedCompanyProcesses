/*
  Warnings:

  - You are about to drop the column `isConnectedArea` on the `procedures` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "procedures" DROP COLUMN "isConnectedArea",
ADD COLUMN     "isConnectedProcedure" BOOLEAN NOT NULL DEFAULT false;
