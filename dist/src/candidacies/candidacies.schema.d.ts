import { z } from 'zod';
import { Prisma } from '@prisma/client';
export declare const candidacyColumns: (keyof typeof Prisma.CandidacyScalarFieldEnum)[];
declare const CandidacyFilterDto_base: import("nestjs-zod").ZodDto<{
    includeStances: boolean;
    includeRace: boolean;
    slug?: string | undefined;
    state?: string | undefined;
    raceSlug?: string | undefined;
    columns?: string | undefined;
    raceColumns?: string | undefined;
}, z.ZodObjectDef<{
    state: z.ZodEffects<z.ZodOptional<z.ZodEffects<z.ZodString, string, unknown>>, string | undefined, unknown>;
    slug: z.ZodOptional<z.ZodString>;
    raceSlug: z.ZodOptional<z.ZodString>;
    includeStances: z.ZodDefault<z.ZodOptional<z.ZodBoolean>>;
    includeRace: z.ZodDefault<z.ZodOptional<z.ZodBoolean>>;
    columns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
    raceColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
}, "strict", z.ZodTypeAny>, {
    slug?: string | undefined;
    state?: unknown;
    raceSlug?: string | undefined;
    includeStances?: boolean | undefined;
    includeRace?: boolean | undefined;
    columns?: string | undefined;
    raceColumns?: string | undefined;
}>;
export declare class CandidacyFilterDto extends CandidacyFilterDto_base {
}
export {};
