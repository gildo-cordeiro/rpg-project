import { Body, Controller, Post } from '@nestjs/common';
import { CharacterService } from './character.service';
import { CharacterDTO } from './character.dto';

@Controller('character')
export class CharacterController {
  constructor(private readonly moduleService: CharacterService) {}

  @Post()
  async create(@Body() data: CharacterDTO) {
    return this.moduleService.create(data);
  }
}
