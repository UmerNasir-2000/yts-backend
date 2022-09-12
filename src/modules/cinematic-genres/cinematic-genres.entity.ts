
import { Entity, Column } from 'typeorm';

@Entity({ name: 'cinematics_genres_mapping' })
export class CinematicGenre {

    @Column({ name: 'cinematic_id' })
    cinematicId: number;

    @Column({ name: 'genre_id' })
    genreId: number;

}
