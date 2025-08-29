import { PlaceFilterDto } from './places.schema';
import { Prisma } from '@prisma/client';
import { PlaceWithCategories } from './place.types';
declare const PlacesService_base: {
    new (): {
        readonly _prisma: import("../prisma/prisma.service").PrismaService;
        readonly logger: import("@nestjs/common").Logger;
        readonly model: Prisma.PlaceDelegate<import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        readonly client: import(".prisma/client").PrismaClient;
        onModuleInit(): void;
        findUnique: <T extends Prisma.PlaceFindUniqueArgs>(args: Prisma.SelectSubset<T, Prisma.PlaceFindUniqueArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => Prisma.Prisma__PlaceClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$PlacePayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findUniqueOrThrow: <T extends Prisma.PlaceFindUniqueOrThrowArgs>(args: Prisma.SelectSubset<T, Prisma.PlaceFindUniqueOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>>) => Prisma.Prisma__PlaceClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$PlacePayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findFirst: <T extends Prisma.PlaceFindFirstArgs>(args?: Prisma.SelectSubset<T, Prisma.PlaceFindFirstArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.Prisma__PlaceClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$PlacePayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions> | null, null, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findFirstOrThrow: <T extends Prisma.PlaceFindFirstOrThrowArgs>(args?: Prisma.SelectSubset<T, Prisma.PlaceFindFirstOrThrowArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.Prisma__PlaceClient<import("@prisma/client/runtime/library").GetFindResult<Prisma.$PlacePayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>, never, import("@prisma/client/runtime/library").DefaultArgs, Prisma.PrismaClientOptions>;
        findMany: <T extends Prisma.PlaceFindManyArgs>(args?: Prisma.SelectSubset<T, Prisma.PlaceFindManyArgs<import("@prisma/client/runtime/library").DefaultArgs>> | undefined) => Prisma.PrismaPromise<import("@prisma/client/runtime/library").GetFindResult<Prisma.$PlacePayload<import("@prisma/client/runtime/library").DefaultArgs>, T, Prisma.PrismaClientOptions>[]>;
        count: <T extends Prisma.PlaceCountArgs>(args?: Prisma.Subset<T, Prisma.PlaceCountArgs>) => Prisma.PrismaPromise<T extends import("@prisma/client/runtime/library").Record<"select", any> ? T["select"] extends true ? number : Prisma.GetScalarType<T["select"], Prisma.PlaceCountAggregateOutputType> : number>;
    };
};
export declare class PlacesService extends PlacesService_base {
    constructor();
    getPlaces(filterDto: PlaceFilterDto): Promise<PlaceWithCategories[]>;
    getPlacesWithMostElections(minRaces: number, count: number): Promise<{
        slug: string;
        name: string;
        race_count: number;
    }[]>;
    private buildRaceInclude;
    private makePlaceSelection;
    private dedupeRacesInTree;
    private runQuery;
}
export {};
