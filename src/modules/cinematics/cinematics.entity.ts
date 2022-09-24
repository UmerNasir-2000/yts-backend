import { Entity, PrimaryGeneratedColumn, Column, ManyToMany } from 'typeorm';
import { Genre } from '../genres/genres.entity';

export enum CinematicStatus { 

  RELEASED = "released",
  UPCOMING = "upcoming",
  DISABLED = "disabled",
  DELETED = "deleted",

}

export enum CinematicType { 

  MOVIE = "movie",
  SERIES = "series"

}

@Entity({ name: 'cinematics' })
export class Cinematic {

  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column('text')
  synopsis: string;

  @Column({ name: 'imdb_code' })
  code: string;

  @Column({ name: 'imdb_rating' })
  imdb: number;

  @Column({ name: 'rt_score' })
  rottenTomatoes: number;

  @Column({ name: 'poster_path', type: 'text' })
  poster: string;

  @Column({ name: 'released_year', type: 'year' })
  releasedYear: Date;

  @Column({ type: 'enum', enum: CinematicStatus, default: CinematicStatus.RELEASED })
  status: CinematicStatus;

  @Column({ type: 'enum', enum: CinematicType, default: CinematicType.MOVIE })
  type: CinematicType;

  @ManyToMany(() => Genre, (genres) => genres.cinematics)
  genres: Genre[];
  
}
