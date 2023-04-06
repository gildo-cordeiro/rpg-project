import { Module } from '@nestjs/common';
import { RoleplayingSheetService } from './roleplaying-sheet.service';
import { RoleplayingSheetController } from './roleplaying-sheet.controller';
import { PrismaService } from '../../database/PrismaService';

@Module({
  controllers: [RoleplayingSheetController],
  providers: [RoleplayingSheetService, PrismaService],
})
export class RoleplayingSheetModule {}
