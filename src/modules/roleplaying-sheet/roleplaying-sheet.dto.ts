import { CharacterDTO } from '../character/character.dto';

export type RoleplayingSheetDTO = {
  id?: string;
  experience: string;
  level: number;
  strength: number;
  dexterity: number;
  intelligence: number;
  constitution: number;
  wisdom: number;
  charisma: number;
  character: CharacterDTO;
  coin: number;
};
