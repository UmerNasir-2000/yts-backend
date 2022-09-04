
export default () => ({
    environment: process.env.NODE_ENV,
    port: parseInt(process.env.HTTP_PORT),
    database: {
      host: process.env.DATABASE_HOST,
      port: parseInt(process.env.DATABASE_PORT) ,
      name: process.env.DATABASE_NAME,
      user: process.env.DATABASE_USER,
      password: process.env.DATABASE_PASSWORD,
      engine: process.env.DATABASE_ENGINE,
    }
  });