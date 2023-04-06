import { CharacterClass } from './characterClass.enum';

export type CharacterDTO = {
  id?: string;
  nickcName: string;
  class: CharacterClass;
};
