-- CreateEnum
CREATE TYPE "CharacterClass" AS ENUM ('MAGE', 'MAGE1', 'MAGE2');

-- CreateTable
CREATE TABLE "Character" (
    "id" TEXT NOT NULL,
    "nickcName" TEXT NOT NULL,
    "class" "CharacterClass" NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoleplayingSheet" (
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
    "coin" BIGINT NOT NULL,

    CONSTRAINT "RoleplayingSheet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Campaign" (
    "id" TEXT NOT NULL,
    "nameCampaign" TEXT NOT NULL,
    "roleplayingSheetId" TEXT NOT NULL,

    CONSTRAINT "Campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Player" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Player_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CampaignOnPlayer" (
    "playerId" TEXT NOT NULL,
    "campaignId" TEXT NOT NULL,

    CONSTRAINT "CampaignOnPlayer_pkey" PRIMARY KEY ("playerId","campaignId")
);

-- AddForeignKey
ALTER TABLE "RoleplayingSheet" ADD CONSTRAINT "RoleplayingSheet_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Campaign" ADD CONSTRAINT "Campaign_roleplayingSheetId_fkey" FOREIGN KEY ("roleplayingSheetId") REFERENCES "RoleplayingSheet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CampaignOnPlayer" ADD CONSTRAINT "CampaignOnPlayer_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CampaignOnPlayer" ADD CONSTRAINT "CampaignOnPlayer_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "Campaign"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
