import { Exclude, Expose, Transform, Type } from 'class-transformer';
import { BANNERS_MOVIES } from 'src/utilities/constants';


@Exclude()
export class GenreDTO { 

    @Expose()
    id: number;

    @Expose()
    title: string;

}
@Exclude()
export class MoviesPaginationDTO { 

    @Expose()
    id: number;

    @Expose()
    title: string;

    @Expose()
    @Transform(({ value }) => `${BANNERS_MOVIES}${value}`)
    poster: string;

    @Expose()
    releasedYear: number;

    @Expose()
    @Type(() => GenreDTO)
    genres: GenreDTO[];

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
    @Type(() => MoviesPaginationDTO)
    movies: MoviesPaginationDTO[];

}