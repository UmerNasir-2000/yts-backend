import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Cinematic } from './cinematics.entity';
import { FetchMoviesRequestDTO } from './mappings/fetch-movies/fetch-movies.request.dto';
import { FetchMoviesResponseDTO } from './mappings/fetch-movies/fetch-movies.response.dto';

@Injectable()
export class CinematicsService {

    constructor(@InjectRepository(Cinematic) private readonly cinematicRepository: Repository<Cinematic>) { }

    async fetchMovies({ pageSize, pageNumber }: FetchMoviesRequestDTO): Promise<FetchMoviesResponseDTO> { 

        return null;

    }

}
