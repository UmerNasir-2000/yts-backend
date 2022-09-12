import { Entity, Column, PrimaryColumn, JoinColumn } from 'typeorm';

@Entity({ name: 'cinematics_genres_mapping' })
export class CinematicGenre {

    @PrimaryColumn({ name: 'cinematic_id' })
    // @JoinColumn({ name: 'cinematic_id' })
    cinematicId: number;

    @PrimaryColumn({ name: 'genre_id' })
    // @JoinColumn({ name: 'genre_id' })
    genreId: number;

}
