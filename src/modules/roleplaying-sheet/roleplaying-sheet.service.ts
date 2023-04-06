import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/PrismaService';
import { RoleplayingSheetDTO } from './roleplaying-sheet.dto';

@Injectable()
export class RoleplayingSheetService {
  constructor(private prisma: PrismaService) {}

  async create(data: RoleplayingSheetDTO) {
    console.log(data.coin);

    return await this.prisma.roleplayingSheet.create({
      data: {
        character: { connect: { id: data.character.id } },
        charisma: data.charisma,
        coin: data.coin,
        constitution: data.constitution,
        dexterity: data.dexterity,
        experience: data.experience,
        intelligence: data.intelligence,
        level: data.level,
        strength: data.strength,
        wisdom: data.wisdom,
      },
    });
  }
}
