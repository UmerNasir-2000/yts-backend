import { Controller } from '@nestjs/common';
import { CinematicGenresService } from './cinematic-genres.service';

@Controller('cinematic-genres')
export class CinematicGenresController {
  constructor(private readonly cinematicGenresService: CinematicGenresService) {}
}
