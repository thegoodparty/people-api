import { z } from 'zod';
declare const ProjectedTurnoutUniqueDTO_base: import("nestjs-zod").ZodDto<{
    state: string;
    electionDate: string;
    L2DistrictType: string;
    L2DistrictName: string;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
}, z.ZodEffectsDef<z.ZodObject<{
    state: z.ZodEffects<z.ZodEffects<z.ZodString, string, string>, string, string>;
    L2DistrictType: z.ZodString;
    L2DistrictName: z.ZodString;
    electionYear: z.ZodOptional<z.ZodEffects<z.ZodNumber, number, unknown>>;
    electionDate: z.ZodEffects<z.ZodString, string, string>;
    electionCode: z.ZodOptional<z.ZodNativeEnum<{
        General: "General";
        LocalOrMunicipal: "LocalOrMunicipal";
        ConsolidatedGeneral: "ConsolidatedGeneral";
    }>>;
}, "strip", z.ZodTypeAny, {
    state: string;
    electionDate: string;
    L2DistrictType: string;
    L2DistrictName: string;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
}, {
    state: string;
    electionDate: string;
    L2DistrictType: string;
    L2DistrictName: string;
    electionYear?: unknown;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
}>>, {
    state: string;
    electionDate: string;
    L2DistrictType: string;
    L2DistrictName: string;
    electionYear?: unknown;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
}>;
export declare class ProjectedTurnoutUniqueDTO extends ProjectedTurnoutUniqueDTO_base {
}
declare const ProjectedTurnoutManyQueryDTO_base: import("nestjs-zod").ZodDto<{
    state: string;
    includeDistrict: boolean;
    L2DistrictType?: string | undefined;
    L2DistrictName?: string | undefined;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
}, z.ZodEffectsDef<z.ZodObject<{
    state: z.ZodEffects<z.ZodEffects<z.ZodString, string, string>, string, string>;
    L2DistrictType: z.ZodOptional<z.ZodString>;
    L2DistrictName: z.ZodOptional<z.ZodString>;
    electionYear: z.ZodOptional<z.ZodEffects<z.ZodNumber, number, unknown>>;
    electionCode: z.ZodOptional<z.ZodNativeEnum<{
        General: "General";
        LocalOrMunicipal: "LocalOrMunicipal";
        ConsolidatedGeneral: "ConsolidatedGeneral";
    }>>;
    includeDistrict: z.ZodEffects<z.ZodDefault<z.ZodOptional<z.ZodBoolean>>, boolean, unknown>;
}, "strip", z.ZodTypeAny, {
    state: string;
    includeDistrict: boolean;
    L2DistrictType?: string | undefined;
    L2DistrictName?: string | undefined;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
}, {
    state: string;
    L2DistrictType?: string | undefined;
    L2DistrictName?: string | undefined;
    electionYear?: unknown;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
    includeDistrict?: unknown;
}>>, {
    state: string;
    L2DistrictType?: string | undefined;
    L2DistrictName?: string | undefined;
    electionYear?: unknown;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
    includeDistrict?: unknown;
}>;
export declare class ProjectedTurnoutManyQueryDTO extends ProjectedTurnoutManyQueryDTO_base {
}
export {};
