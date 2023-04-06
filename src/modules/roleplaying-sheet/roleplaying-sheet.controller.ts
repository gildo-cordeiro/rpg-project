import { Body, Controller, Post } from '@nestjs/common';
import { RoleplayingSheetService } from './roleplaying-sheet.service';
import { RoleplayingSheetDTO } from './roleplaying-sheet.dto';

@Controller('roleplaying-sheet')
export class RoleplayingSheetController {
  constructor(
    private readonly roleplayingSheetService: RoleplayingSheetService,
  ) {}

  @Post()
  async create(@Body() data: RoleplayingSheetDTO) {
    return this.roleplayingSheetService.create(data);
  }
}
