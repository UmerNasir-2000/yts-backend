import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { TypeOrmModuleOptions, TypeOrmOptionsFactory } from "@nestjs/typeorm";
import { DatabaseEngine } from "src/utilities/types/database-engine.type";

@Injectable()
export class TypeOrmConfigService implements TypeOrmOptionsFactory {

  constructor(private readonly configService: ConfigService) {}

  createTypeOrmOptions(): TypeOrmModuleOptions {

    const connectionOptions: TypeOrmModuleOptions = {

        type: this.configService.get<DatabaseEngine>('database.engine'),
        host: this.configService.get<string>('database.host'),
        port: this.configService.get<number>('database.port'),
        username: this.configService.get<string>('database.user'),
        password: this.configService.get<string>('database.password'),
        database: this.configService.get<string>('database.name')

    };

    return connectionOptions;

  }

}