import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Cinematic, CinematicStatus, CinematicType } from './cinematics.entity';
import { FetchMoviesRequestDTO } from './mappings/fetch-movies/fetch-movies.request.dto';
import { FetchMoviesResponseDTO } from './mappings/fetch-movies/fetch-movies.response.dto';

@Injectable()
export class CinematicsService {

    constructor(@InjectRepository(Cinematic) private readonly cinematicRepository: Repository<Cinematic>) { }

    async fetchMovies({ pageSize, pageNumber }: FetchMoviesRequestDTO): Promise<FetchMoviesResponseDTO> { 

        const moviesCount = await this.cinematicRepository.count({
                                                    where: {
                                                        type: CinematicType.MOVIE,
                                                        status: CinematicStatus.RELEASED
                                                    }
        });

        if(moviesCount < pageSize) throw new HttpException({ message: 'Page size cannot be greater than total number of movies.' }, HttpStatus.BAD_REQUEST);

        const totalPages = Math.ceil( moviesCount / pageSize );

        const movies = await this.cinematicRepository.find({
                                                    relations: ['genres'],
                                                    where: {
                                                        type: CinematicType.MOVIE,
                                                        status: CinematicStatus.RELEASED
                                                    }
        });

        console.log('totalMovies', totalPages);

        console.log('movies', movies);
        
        return null;

    }

}
