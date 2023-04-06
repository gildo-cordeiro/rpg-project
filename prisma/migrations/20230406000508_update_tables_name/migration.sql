/*
  Warnings:

  - You are about to drop the `Campaign` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CampaignOnPlayer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Character` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Player` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoleplayingSheet` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Campaign" DROP CONSTRAINT "Campaign_roleplayingSheetId_fkey";

-- DropForeignKey
ALTER TABLE "CampaignOnPlayer" DROP CONSTRAINT "CampaignOnPlayer_campaignId_fkey";

-- DropForeignKey
ALTER TABLE "CampaignOnPlayer" DROP CONSTRAINT "CampaignOnPlayer_playerId_fkey";

-- DropForeignKey
ALTER TABLE "RoleplayingSheet" DROP CONSTRAINT "RoleplayingSheet_characterId_fkey";

-- DropTable
DROP TABLE "Campaign";

-- DropTable
DROP TABLE "CampaignOnPlayer";

-- DropTable
DROP TABLE "Character";

-- DropTable
DROP TABLE "Player";

-- DropTable
DROP TABLE "RoleplayingSheet";

-- CreateTable
CREATE TABLE "character" (
    "id" TEXT NOT NULL,
    "nickcName" TEXT NOT NULL,
    "class" "CharacterClass" NOT NULL,

    CONSTRAINT "character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roleplaying_sheet" (
    "id" TEXT NOT NULL,
    "experience" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "strength" INTEGER NOT NULL,
    "dexterity" INTEGER NOT NULL,
    "constitution" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "wisdom" INTEGER NOT NULL,
    "charisma" INTEGER NOT NULL,
    "characterId" TEXT NOT NULL,
    "coin" INTEGER NOT NULL,

    CONSTRAINT "roleplaying_sheet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "campaign" (
    "id" TEXT NOT NULL,
    "nameCampaign" TEXT NOT NULL,
    "roleplayingSheetId" TEXT NOT NULL,

    CONSTRAINT "campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "player" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "campaign_player" (
    "playerId" TEXT NOT NULL,
    "campaignId" TEXT NOT NULL,

    CONSTRAINT "campaign_player_pkey" PRIMARY KEY ("playerId","campaignId")
);

-- AddForeignKey
ALTER TABLE "roleplaying_sheet" ADD CONSTRAINT "roleplaying_sheet_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaign" ADD CONSTRAINT "campaign_roleplayingSheetId_fkey" FOREIGN KEY ("roleplayingSheetId") REFERENCES "roleplaying_sheet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaign_player" ADD CONSTRAINT "campaign_player_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaign_player" ADD CONSTRAINT "campaign_player_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "campaign"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
