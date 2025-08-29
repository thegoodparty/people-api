import { ProjectedTurnoutService } from 'src/projectedTurnout/projectedTurnout.service';
declare const PositionsService_base: {
    new (): {
        readonly _prisma: import("../prisma/prisma.service").PrismaService;
        readonly logger: import("@nestjs/common").Logger;
        readonly model: import(".prisma/client").Prisma.PositionDelegate<import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        readonly client: import(".prisma/client").PrismaClient;
        onModuleInit(): void;
        findUnique: <T extends import(".prisma/client").Prisma.PositionFindUniqueArgs>(args: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.PositionFindUniqueArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => import(".prisma/client").Prisma.Prisma__PositionClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$PositionPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findUniqueOrThrow: <T extends import(".prisma/client").Prisma.PositionFindUniqueOrThrowArgs>(args: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.PositionFindUniqueOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => import(".prisma/client").Prisma.Prisma__PositionClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$PositionPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findFirst: <T extends import(".prisma/client").Prisma.PositionFindFirstArgs>(args?: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.PositionFindFirstArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => import(".prisma/client").Prisma.Prisma__PositionClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$PositionPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findFirstOrThrow: <T extends import(".prisma/client").Prisma.PositionFindFirstOrThrowArgs>(args?: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.PositionFindFirstOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => import(".prisma/client").Prisma.Prisma__PositionClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$PositionPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findMany: <T extends import(".prisma/client").Prisma.PositionFindManyArgs>(args?: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.PositionFindManyArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => import(".prisma/client").Prisma.PrismaPromise<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$PositionPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions>[]>;
        count: <T extends import(".prisma/client").Prisma.PositionCountArgs>(args?: import(".prisma/client").Prisma.Subset<T, import(".prisma/client").Prisma.PositionCountArgs>) => import(".prisma/client").Prisma.PrismaPromise<T extends import("@prisma/client/runtime/library").Record<"select", any> ? T["select"] extends true ? number : import(".prisma/client").Prisma.GetScalarType<T["select"], import(".prisma/client").Prisma.PositionCountAggregateOutputType> : number>;
    };
};
export declare class PositionsService extends PositionsService_base {
    private readonly projectedTurnoutService;
    constructor(projectedTurnoutService: ProjectedTurnoutService);
    getPositionByBallotReadyId(params: {
        brPositionId: string;
        includeDistrict?: boolean;
        electionDate?: string;
    }): Promise<{
        id: string;
        brDatabaseId: string;
        state: string;
        districtId: string;
        brPositionId: string;
    } | {
        positionId: string;
        brPositionId: string;
        brDatabaseId: string;
        district: {
            id: string;
            L2DistrictType: string;
            L2DistrictName: string;
            projectedTurnout: {
                projectedTurnout: number;
                id: string;
                createdAt: Date;
                updatedAt: Date;
                electionYear: number;
                electionCode: import(".prisma/client").$Enums.ElectionCode;
                inferenceAt: Date;
                modelVersion: string;
                districtId: string;
            };
        };
    }>;
}
export {};
