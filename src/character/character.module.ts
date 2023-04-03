import { Module } from '@nestjs/common';
import { CharacterService } from './character.service';
import { CharacterController } from './character.controller';
import { PrismaService } from '../database/PrismaService';

@Module({
  controllers: [CharacterController],
  providers: [CharacterService, PrismaService],
})
export class CharacterModule {}
