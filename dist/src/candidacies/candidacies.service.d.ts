import { CandidacyFilterDto } from './candidacies.schema';
import { Prisma } from '@prisma/client';
declare const CandidaciesService_base: {
    new (): {
        readonly _prisma: import("../prisma/prisma.service").PrismaService;
        readonly logger: import("@nestjs/common").Logger;
        readonly model: Prisma.CandidacyDelegate<import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        readonly client: import(".prisma/client").PrismaClient;
        onModuleInit(): void;
        findUnique: <T extends Prisma.CandidacyFindUniqueArgs>(args: Prisma.SelectSubset<T, Prisma.CandidacyFindUniqueArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => Prisma.Prisma__CandidacyClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$CandidacyPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findUniqueOrThrow: <T extends Prisma.CandidacyFindUniqueOrThrowArgs>(args: Prisma.SelectSubset<T, Prisma.CandidacyFindUniqueOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => Prisma.Prisma__CandidacyClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$CandidacyPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findFirst: <T extends Prisma.CandidacyFindFirstArgs>(args?: Prisma.SelectSubset<T, Prisma.CandidacyFindFirstArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.Prisma__CandidacyClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$CandidacyPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findFirstOrThrow: <T extends Prisma.CandidacyFindFirstOrThrowArgs>(args?: Prisma.SelectSubset<T, Prisma.CandidacyFindFirstOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.Prisma__CandidacyClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$CandidacyPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findMany: <T extends Prisma.CandidacyFindManyArgs>(args?: Prisma.SelectSubset<T, Prisma.CandidacyFindManyArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.PrismaPromise<import("@prisma/client/runtime/library").GetFindResult<Prisma.$CandidacyPayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>[]>;
        count: <T extends Prisma.CandidacyCountArgs>(args?: Prisma.Subset<T, Prisma.CandidacyCountArgs>) => Prisma.PrismaPromise<T extends import("@prisma/client/runtime/library").Record<"select", any> ? T["select"] extends true ? number : Prisma.GetScalarType<T["select"], Prisma.CandidacyCountAggregateOutputType> : number>;
    };
};
export declare class CandidaciesService extends CandidaciesService_base {
    getCandidacies(filterDto: CandidacyFilterDto): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        brDatabaseId: number;
        slug: string;
        firstName: string;
        lastName: string;
        party: string | null;
        placeName: string | null;
        state: string | null;
        image: string | null;
        about: string | null;
        urls: string[];
        electionFrequency: number[];
        salary: string | null;
        normalizedPositionName: string | null;
        positionName: string | null;
        positionDescription: string | null;
        raceId: string | null;
    }[]>;
    private makeCandidacySelection;
    private buildRaceInclude;
}
export {};
