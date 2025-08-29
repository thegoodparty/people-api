import { GetDistrictNamesDto, GetDistrictsDTO, GetDistrictTypesDTO } from './districts.schema';
import { Prisma } from '@prisma/client';
declare const DistrictsService_base: {
    new (): {
        readonly _prisma: import("../prisma/prisma.service").PrismaService;
        readonly logger: import("@nestjs/common").Logger;
        readonly model: Prisma.DistrictDelegate<import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        readonly client: import(".prisma/client").PrismaClient;
        onModuleInit(): void;
        findUnique: <T extends Prisma.DistrictFindUniqueArgs>(args: Prisma.SelectSubset<T, Prisma.DistrictFindUniqueArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => Prisma.Prisma__DistrictClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$DistrictPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findUniqueOrThrow: <T extends Prisma.DistrictFindUniqueOrThrowArgs>(args: Prisma.SelectSubset<T, Prisma.DistrictFindUniqueOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => Prisma.Prisma__DistrictClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$DistrictPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findFirst: <T extends Prisma.DistrictFindFirstArgs>(args?: Prisma.SelectSubset<T, Prisma.DistrictFindFirstArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.Prisma__DistrictClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$DistrictPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findFirstOrThrow: <T extends Prisma.DistrictFindFirstOrThrowArgs>(args?: Prisma.SelectSubset<T, Prisma.DistrictFindFirstOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.Prisma__DistrictClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$DistrictPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findMany: <T extends Prisma.DistrictFindManyArgs>(args?: Prisma.SelectSubset<T, Prisma.DistrictFindManyArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.PrismaPromise<import("@prisma/client/runtime/library").GetFindResult<Prisma.$DistrictPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>[]>;
        count: <T extends Prisma.DistrictCountArgs>(args?: Prisma.Subset<T, Prisma.DistrictCountArgs>) => Prisma.PrismaPromise<T extends import("@prisma/client/runtime/library").Record<"select", any> ? T["select"] extends true ? number : Prisma.GetScalarType<T["select"], Prisma.DistrictCountAggregateOutputType> : number>;
    };
};
export declare class DistrictsService extends DistrictsService_base {
    constructor();
    getDistrictTypes(dto: GetDistrictTypesDTO): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        state: string;
        _count: {
            ProjectedTurnouts: number;
            Positions: number;
        };
        L2DistrictType: string;
        L2DistrictName: string;
        ProjectedTurnouts: {
            projectedTurnout: number;
            id: string;
            createdAt: Date;
            updatedAt: Date;
            electionYear: number;
            electionCode: import(".prisma/client").$Enums.ElectionCode;
            inferenceAt: Date;
            modelVersion: string;
            districtId: string;
        }[];
        Positions: {
            id: string;
            brDatabaseId: string;
            state: string;
            districtId: string;
            brPositionId: string;
        }[];
    }[]>;
    getDistrictNames(dto: GetDistrictNamesDto): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        state: string;
        _count: {
            ProjectedTurnouts: number;
            Positions: number;
        };
        L2DistrictType: string;
        L2DistrictName: string;
        ProjectedTurnouts: {
            projectedTurnout: number;
            id: string;
            createdAt: Date;
            updatedAt: Date;
            electionYear: number;
            electionCode: import(".prisma/client").$Enums.ElectionCode;
            inferenceAt: Date;
            modelVersion: string;
            districtId: string;
        }[];
        Positions: {
            id: string;
            brDatabaseId: string;
            state: string;
            districtId: string;
            brPositionId: string;
        }[];
    }[]>;
    getDistricts(dto: GetDistrictsDTO): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        state: string;
        _count: {
            ProjectedTurnouts: number;
            Positions: number;
        };
        L2DistrictType: string;
        L2DistrictName: string;
        ProjectedTurnouts: {
            projectedTurnout: number;
            id: string;
            createdAt: Date;
            updatedAt: Date;
            electionYear: number;
            electionCode: import(".prisma/client").$Enums.ElectionCode;
            inferenceAt: Date;
            modelVersion: string;
            districtId: string;
        }[];
        Positions: {
            id: string;
            brDatabaseId: string;
            state: string;
            districtId: string;
            brPositionId: string;
        }[];
    }[]>;
    private buildTurnoutWhere;
    private buildDistrictWhere;
    private listDistinct;
    private buildProjectedTurnoutInclude;
}
export {};
