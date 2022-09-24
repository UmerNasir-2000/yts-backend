import { Exclude, Expose } from "class-transformer";

@Exclude()
export class PaginationResponseDTO<T> { 

    @Expose()
    hasPrevious: boolean;

    @Expose()
    hasNext: boolean;

    @Expose()
    pages: number;

    @Expose()
    records: number;

    @Expose()
    data: T[];

}