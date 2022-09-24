import { Exclude, Expose } from "class-transformer";
import { IsInt, IsOptional, Max, Min } from "class-validator";

@Exclude()
export class PaginationRequestDTO {

    @Expose()
    @IsInt()
    @Min(0)
    pageNumber: number;

    @Expose()
    @IsInt()
    @Min(0)
    @Max(20)
    @IsOptional()
    pageSize?: number;

}
