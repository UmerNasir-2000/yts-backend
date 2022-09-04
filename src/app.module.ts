import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import configuration from './config/index'
import { TypeOrmConfigService } from './services/database/database.service';


@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      load: [configuration],
      expandVariables: true,
      envFilePath: 'envs/.local.env'
    }),
    TypeOrmModule.forRootAsync({
      useClass: TypeOrmConfigService
    })
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
