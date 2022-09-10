import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity({ name: 'cinematics' })
export class Cinematic {

  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column('text')
  synopsis: string;
  
}
