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
