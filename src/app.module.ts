import { Module } from '@nestjs/common';
import { CharacterModule } from './modules/character/character.module';
import { RoleplayingSheetModule } from './modules/roleplaying-sheet/roleplaying-sheet.module';

@Module({
  imports: [CharacterModule, RoleplayingSheetModule],
})
export class AppModule {}
