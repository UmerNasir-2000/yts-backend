import { Exclude, Expose } from "class-transformer";
import { IsInt, Min } from "class-validator";

@Exclude()
export class FetchMoviesRequestDTO {  

    @IsInt()
    @Min(0)
    @Expose()
    pageSize: number;

    @IsInt()
    @Min(0)
    @Expose()
    pageNumber: number;

}