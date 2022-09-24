import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { plainToInstance } from 'class-transformer';
import { PaginationResponseDTO } from 'src/utilities/mappings/pagination/pagination.response.dto';
import { Repository } from 'typeorm';
import { Cinematic, CinematicStatus, CinematicType } from './cinematics.entity';
import { FetchMoviesRequestDTO } from './mappings/fetch-movies/fetch-movies.request.dto';
import { FetchMoviesResponseDTO, MoviesPaginationDTO } from './mappings/fetch-movies/fetch-movies.response.dto';

@Injectable()
export class CinematicsService {

    constructor(@InjectRepository(Cinematic) private readonly cinematicRepository: Repository<Cinematic>) { }

    async fetchMovies({ pageSize, pageNumber }: FetchMoviesRequestDTO): Promise<PaginationResponseDTO<MoviesPaginationDTO>> { 

        const moviesCount = await this.cinematicRepository.count({
                                                    where: {
                                                        type: CinematicType.MOVIE,
                                                        status: CinematicStatus.RELEASED
                                                    }
        });

        const totalPages = Math.ceil( moviesCount / pageSize );

        if(totalPages < pageNumber) throw new HttpException({ message: 'Page number cannot be greater than total number of movies.' }, HttpStatus.BAD_REQUEST);

        const movies = await this.cinematicRepository.find({
                                                    relations: ['genres'],
                                                    where: {
                                                        type: CinematicType.MOVIE,
                                                        status: CinematicStatus.RELEASED
                                                    },
                                                    skip: ( pageNumber - 1 ) * pageSize,
                                                    take: pageSize
        });

        const response = new PaginationResponseDTO<MoviesPaginationDTO>();

        response.hasPrevious = pageNumber !== 1;
        response.hasNext = pageNumber !== totalPages;

        response.pages = totalPages;
        response.records = moviesCount;

        const transformedMovies = plainToInstance(MoviesPaginationDTO, movies);

        response.data = transformedMovies;
        
        return response;

    }

}
