import { ProjectedTurnoutManyQueryDTO, ProjectedTurnoutUniqueDTO } from './projectedTurnout.schema';
import { ElectionCode } from '@prisma/client';
declare const ProjectedTurnoutService_base: {
    new (): {
        readonly _prisma: import("../prisma/prisma.service").PrismaService;
        readonly logger: import("@nestjs/common").Logger;
        readonly model: import(".prisma/client").Prisma.ProjectedTurnoutDelegate<import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        readonly client: import(".prisma/client").PrismaClient;
        onModuleInit(): void;
        findUnique: <T extends import(".prisma/client").Prisma.ProjectedTurnoutFindUniqueArgs>(args: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.ProjectedTurnoutFindUniqueArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => import(".prisma/client").Prisma.Prisma__ProjectedTurnoutClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$ProjectedTurnoutPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findUniqueOrThrow: <T extends import(".prisma/client").Prisma.ProjectedTurnoutFindUniqueOrThrowArgs>(args: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.ProjectedTurnoutFindUniqueOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => import(".prisma/client").Prisma.Prisma__ProjectedTurnoutClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$ProjectedTurnoutPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findFirst: <T extends import(".prisma/client").Prisma.ProjectedTurnoutFindFirstArgs>(args?: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.ProjectedTurnoutFindFirstArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => import(".prisma/client").Prisma.Prisma__ProjectedTurnoutClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$ProjectedTurnoutPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findFirstOrThrow: <T extends import(".prisma/client").Prisma.ProjectedTurnoutFindFirstOrThrowArgs>(args?: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.ProjectedTurnoutFindFirstOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => import(".prisma/client").Prisma.Prisma__ProjectedTurnoutClient<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$ProjectedTurnoutPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, import(".prisma/client").Prisma.PrismaClientOptions>;
        findMany: <T extends import(".prisma/client").Prisma.ProjectedTurnoutFindManyArgs>(args?: import(".prisma/client").Prisma.SelectSubset<T, import(".prisma/client").Prisma.ProjectedTurnoutFindManyArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => import(".prisma/client").Prisma.PrismaPromise<import("@prisma/client/runtime/library").GetFindResult<import(".prisma/client").Prisma.$ProjectedTurnoutPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, import(".prisma/client").Prisma.PrismaClientOptions>[]>;
        count: <T extends import(".prisma/client").Prisma.ProjectedTurnoutCountArgs>(args?: import(".prisma/client").Prisma.Subset<T, import(".prisma/client").Prisma.ProjectedTurnoutCountArgs>) => import(".prisma/client").Prisma.PrismaPromise<T extends import("@prisma/client/runtime/library").Record<"select", any> ? T["select"] extends true ? number : import(".prisma/client").Prisma.GetScalarType<T["select"], import(".prisma/client").Prisma.ProjectedTurnoutCountAggregateOutputType> : number>;
    };
};
export declare class ProjectedTurnoutService extends ProjectedTurnoutService_base {
    private static readonly CONSOLIDATED_2YR_STATES;
    private static readonly CONSOLIDATED_4YR_STATES;
    private static makeStateGuard;
    private static readonly isTwoYearState;
    private static readonly isFourYearState;
    constructor();
    getProjectedTurnout(dto: ProjectedTurnoutUniqueDTO): Promise<{
        projectedTurnout: number;
        id: string;
        createdAt: Date;
        updatedAt: Date;
        electionYear: number;
        electionCode: import(".prisma/client").$Enums.ElectionCode;
        inferenceAt: Date;
        modelVersion: string;
        districtId: string;
    } | null>;
    getManyProjectedTurnouts(dto: ProjectedTurnoutManyQueryDTO): Promise<{
        projectedTurnout: number;
        id: string;
        createdAt: Date;
        updatedAt: Date;
        electionYear: number;
        electionCode: import(".prisma/client").$Enums.ElectionCode;
        inferenceAt: Date;
        modelVersion: string;
        districtId: string;
    }[]>;
    private isTuesdayAfterFirstMondayInNov;
    determineElectionCode(electionDate: string, state: string): ElectionCode;
}
export {};
