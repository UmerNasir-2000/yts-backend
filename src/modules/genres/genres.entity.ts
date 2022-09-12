import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from 'typeorm';
import { Cinematic } from '../cinematics/cinematics.entity';

export enum GenreTitle {

    ACTION = 'action',
    ADVENTURE = 'adventure',
    SCIENCE_FICTION = 'sci-fi',
    DRAMA = 'drama',
    ROMANTIC = 'romantic',
    THRILLER = 'thriller',
    HORROR = 'horror',
    ANIMATION = 'animation',
    FANTASY = 'fantasy',
    CRIME = 'crime',
}

@Entity({ name: 'genres' })
export class Genre {

    @PrimaryGeneratedColumn()
    id: number;

    @Column({ name: 'name', type: 'enum', enum: GenreTitle })
    title: GenreTitle;

    @ManyToMany(() => Cinematic, (cinematics) => cinematics.genres)
    @JoinTable({ name: 'cinematics_genres_mapping', joinColumn: {
        name: 'genre_id',
        referencedColumnName: 'id',
    },
    inverseJoinColumn: {
        name: 'cinematic_id'
    }
    })
    cinematics: Cinematic[];

}
