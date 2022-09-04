import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {

  checkHealth(): { message: string } {

    return { message: 'YTS Clone - Healthcheck' };
    
  }
  
}
