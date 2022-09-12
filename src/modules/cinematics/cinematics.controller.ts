import { Body, Controller, Get } from '@nestjs/common';
import { CinematicsService } from './cinematics.service';
import { FetchMoviesRequestDTO } from './mappings/fetch-movies/fetch-movies.request.dto';

@Controller('cinematics')
export class CinematicsController {

  constructor(private readonly cinematicsService: CinematicsService) { }

  @Get('movies/browse')
  fetchMovies(@Body() body: FetchMoviesRequestDTO) { 
    
    return this.cinematicsService.fetchMovies(body);
    
  }

}
