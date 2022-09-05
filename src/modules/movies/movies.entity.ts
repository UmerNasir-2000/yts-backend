import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity({ name: 'movies' })
export class Movie {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    title: string;

    @Column()
    tagline: string;

    @Column('text')
    text: string;

    @Column('text')
    synopsis: string;

    @Column({ name: 'released_year', type: 'year' })
    releasedYear: string;

    @Column({ name: 'poster_path', type: 'text' })
    poster: string;

    @Column('int')
    duration: number;

    @Column({ name: 'trailer_link', type: 'text' })
    trailer: string;

    @Column('decimal')
    budget: number;

    @Column('decimal')
    revenue: number;

}
