import { Logger } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { Prisma, PrismaClient } from '@prisma/client';
export declare const MODELS: {
    Candidacy: "Candidacy";
    District: "District";
    Issue: "Issue";
    Place: "Place";
    Position: "Position";
    ProjectedTurnout: "ProjectedTurnout";
    Race: "Race";
    Stance: "Stance";
};
export declare function createPrismaBase<T extends Prisma.ModelName>(modelName: T): {
    new (): {
        readonly _prisma: PrismaService;
        readonly logger: Logger;
        readonly model: PrismaClient[Uncapitalize<T>];
        readonly client: PrismaClient;
        onModuleInit(): void;
        findUnique: PrismaClient<Prisma.PrismaClientOptions, never, import("@prisma/client/runtime/library").DefaultArgs>[Uncapitalize<T>]["findUnique"];
        findUniqueOrThrow: PrismaClient<Prisma.PrismaClientOptions, never, import("@prisma/client/runtime/library").DefaultArgs>[Uncapitalize<T>]["findUniqueOrThrow"];
        findFirst: PrismaClient<Prisma.PrismaClientOptions, never, import("@prisma/client/runtime/library").DefaultArgs>[Uncapitalize<T>]["findFirst"];
        findFirstOrThrow: PrismaClient<Prisma.PrismaClientOptions, never, import("@prisma/client/runtime/library").DefaultArgs>[Uncapitalize<T>]["findFirstOrThrow"];
        findMany: PrismaClient<Prisma.PrismaClientOptions, never, import("@prisma/client/runtime/library").DefaultArgs>[Uncapitalize<T>]["findMany"];
        count: PrismaClient<Prisma.PrismaClientOptions, never, import("@prisma/client/runtime/library").DefaultArgs>[Uncapitalize<T>]["count"];
    };
};
export declare function buildColumnSelect(columns: string): {};
