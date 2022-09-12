import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import configuration from './config/index';
import { CinematicGenresModule } from './modules/cinematic-genres/cinematic-genres.module';
import { CinematicsModule } from './modules/cinematics/cinematics.module';
import { GenresModule } from './modules/genres/genres.module';
import { TypeOrmConfigService } from './services/database/database.service';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      load: [configuration],
      expandVariables: true,
      envFilePath: `envs/.${process.env.NODE_ENV}.env`,
    }),
    TypeOrmModule.forRootAsync({
      useClass: TypeOrmConfigService,
    }),
    CinematicsModule,
    GenresModule,
    CinematicGenresModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
