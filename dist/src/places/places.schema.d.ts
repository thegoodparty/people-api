import { Prisma } from '@prisma/client';
import { z } from 'zod';
export declare const placeColumns: (keyof typeof Prisma.PlaceScalarFieldEnum)[];
declare const PlaceFilterDto_base: import("nestjs-zod").ZodDto<{
    includeChildren: boolean;
    includeChildRaces: boolean;
    includeParent: boolean;
    includeRaces: boolean;
    categorizeChildren: boolean;
    slug?: string | undefined;
    state?: string | undefined;
    raceColumns?: string | undefined;
    name?: string | undefined;
    mtfcc?: string | undefined;
    placeColumns?: string | undefined;
}, z.ZodObjectDef<{
    state: z.ZodEffects<z.ZodOptional<z.ZodEffects<z.ZodString, string, unknown>>, string | undefined, unknown>;
    name: z.ZodOptional<z.ZodString>;
    slug: z.ZodOptional<z.ZodString>;
    mtfcc: z.ZodOptional<z.ZodString>;
    includeChildren: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    includeChildRaces: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    includeParent: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    includeRaces: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    categorizeChildren: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    placeColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
    raceColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
}, "strip", z.ZodTypeAny>, {
    slug?: string | undefined;
    state?: unknown;
    raceColumns?: string | undefined;
    name?: string | undefined;
    mtfcc?: string | undefined;
    includeChildren?: unknown;
    includeChildRaces?: unknown;
    includeParent?: unknown;
    includeRaces?: unknown;
    categorizeChildren?: unknown;
    placeColumns?: string | undefined;
}>;
export declare class PlaceFilterDto extends PlaceFilterDto_base {
}
declare const MostElectionsDto_base: import("nestjs-zod").ZodDto<{
    count: number;
}, z.ZodObjectDef<{
    count: z.ZodEffects<z.ZodEffects<z.ZodString, number, string>, number, string>;
}, "strip", z.ZodTypeAny>, {
    count: string;
}>;
export declare class MostElectionsDto extends MostElectionsDto_base {
}
export {};
