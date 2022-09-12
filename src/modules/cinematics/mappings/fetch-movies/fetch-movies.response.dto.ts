import { Exclude, Expose, Type } from 'class-transformer';

@Exclude()
export class MoviesPagination { 

    @Expose()
    id: number;

    @Expose()
    title: string;

    @Expose()
    poster: string;

    @Expose()
    genres: string[];

    @Expose()
    releasedYear: number;

}

@Exclude() 
export class FetchMoviesResponseDTO { 

    @Expose()
    hasPrevious: boolean;

    @Expose()
    hasNext: boolean;

    @Expose()
    totalMovies: number;
    
    @Expose()
    totalPages: number;

    @Expose()
    @Type(() => MoviesPagination)
    movies: MoviesPagination[];

}