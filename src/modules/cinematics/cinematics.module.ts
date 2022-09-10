import { Module } from '@nestjs/common';
import { CinematicsService } from './cinematics.service';
import { CinematicsController } from './cinematics.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cinematic } from './cinematics.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Cinematic])],
  controllers: [CinematicsController],
  providers: [CinematicsService],
})
export class CinematicsModule {}
