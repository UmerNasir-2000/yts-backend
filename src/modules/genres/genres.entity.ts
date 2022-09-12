import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

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

}
