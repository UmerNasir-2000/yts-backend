import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Cinematic } from './cinematics.entity';

@Injectable()
export class CinematicsService {

    constructor(@InjectRepository(Cinematic) private readonly cinematicRepository: Repository<Cinematic>) {}

    async fetchMovies() : Promise<Cinematic[]>{ 

        const movies = await this.cinematicRepository.find();

        return movies;

    }

}
