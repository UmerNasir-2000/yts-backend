import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Movie } from './movies.entity';

@Injectable()
export class MoviesService {


    constructor(
        @InjectRepository(Movie)
        private readonly moviesRepository: Repository<Movie>
    ) {}

    async fetchMovies() : Promise<Movie[]> {

        const movies = await this.moviesRepository.find();

        return movies;

    }


}
