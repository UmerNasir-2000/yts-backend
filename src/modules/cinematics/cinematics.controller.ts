import { Controller, Get } from '@nestjs/common';
import { CinematicsService } from './cinematics.service';

@Controller('cinematics')
export class CinematicsController {

  constructor(private readonly cinematicsService: CinematicsService) { }

  @Get('movies')
  fetchMovies() { 
    
    return this.cinematicsService.fetchMovies();
    
  }

}
