import { Prisma } from '@prisma/client';
import { z } from 'zod';
export declare const raceColumns: (keyof typeof Prisma.RaceScalarFieldEnum)[];
declare const RaceFilterDto_base: import("nestjs-zod").ZodDto<{
    includePlace: boolean;
    includeCandidacies: boolean;
    state?: string | undefined;
    positionLevel?: "CITY" | "COUNTY" | "FEDERAL" | "LOCAL" | "REGIONAL" | "STATE" | "TOWNSHIP" | undefined;
    isRunoff?: boolean | undefined;
    isPrimary?: boolean | undefined;
    raceSlug?: string | undefined;
    raceColumns?: string | undefined;
    placeColumns?: string | undefined;
    placeSlug?: string | undefined;
    electionDateStart?: string | undefined;
    electionDateEnd?: string | undefined;
    candidacyColumns?: string | undefined;
}, z.ZodObjectDef<{
    state: z.ZodEffects<z.ZodOptional<z.ZodEffects<z.ZodString, string, unknown>>, string | undefined, unknown>;
    placeSlug: z.ZodOptional<z.ZodString>;
    positionLevel: z.ZodOptional<z.ZodEnum<["CITY", "COUNTY", "FEDERAL", "LOCAL", "REGIONAL", "STATE", "TOWNSHIP"]>>;
    raceSlug: z.ZodOptional<z.ZodString>;
    electionDateStart: z.ZodOptional<z.ZodString>;
    electionDateEnd: z.ZodOptional<z.ZodString>;
    includePlace: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    includeCandidacies: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
    isPrimary: z.ZodEffects<z.ZodOptional<z.ZodBoolean>, boolean | undefined, unknown>;
    isRunoff: z.ZodEffects<z.ZodOptional<z.ZodBoolean>, boolean | undefined, unknown>;
    raceColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
    placeColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
    candidacyColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
}, "strict", z.ZodTypeAny>, {
    state?: unknown;
    positionLevel?: "CITY" | "COUNTY" | "FEDERAL" | "LOCAL" | "REGIONAL" | "STATE" | "TOWNSHIP" | undefined;
    isRunoff?: unknown;
    isPrimary?: unknown;
    raceSlug?: string | undefined;
    raceColumns?: string | undefined;
    placeColumns?: string | undefined;
    placeSlug?: string | undefined;
    electionDateStart?: string | undefined;
    electionDateEnd?: string | undefined;
    includePlace?: unknown;
    includeCandidacies?: unknown;
    candidacyColumns?: string | undefined;
}>;
export declare class RaceFilterDto extends RaceFilterDto_base {
}
export {};
