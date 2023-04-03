import { Injectable } from '@nestjs/common';
import { CharacterDTO } from './character.dto';
import { PrismaService } from 'src/database/PrismaService';
import e from 'express';

@Injectable()
export class CharacterService {
  constructor(private prisma: PrismaService) {}

  async create(data: CharacterDTO) {
    return await this.prisma.character.create({ data });
  }
}
