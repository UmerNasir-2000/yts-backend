import { Module } from '@nestjs/common';
import { CinematicGenresService } from './cinematic-genres.service';
import { CinematicGenresController } from './cinematic-genres.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CinematicGenre } from './cinematic-genres.entity';

@Module({
  imports: [TypeOrmModule.forFeature([CinematicGenre])],
  controllers: [CinematicGenresController],
  providers: [CinematicGenresService],
  exports: [CinematicGenresService]
})
export class CinematicGenresModule { }
