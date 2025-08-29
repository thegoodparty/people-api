import { Prisma } from '@prisma/client';
import { z } from 'zod';
export declare const districtColumns: (keyof typeof Prisma.DistrictScalarFieldEnum)[];
export declare const projectedTurnoutColumns: (keyof typeof Prisma.ProjectedTurnoutScalarFieldEnum)[];
declare const GetDistrictNamesDto_base: import("nestjs-zod").ZodDto<{
    state: string;
    L2DistrictType: string;
    electionYear?: number | undefined;
    excludeInvalid?: boolean | undefined;
}, z.ZodObjectDef<{
    state: z.ZodEffects<z.ZodEffects<z.ZodString, string, string>, string, string>;
    L2DistrictType: z.ZodString;
    electionYear: z.ZodOptional<z.ZodNumber>;
    excludeInvalid: z.ZodOptional<z.ZodBoolean>;
}, "strip", z.ZodTypeAny>, {
    state: string;
    L2DistrictType: string;
    electionYear?: number | undefined;
    excludeInvalid?: boolean | undefined;
}>;
export declare class GetDistrictNamesDto extends GetDistrictNamesDto_base {
}
declare const GetDistrictTypesDTO_base: import("nestjs-zod").ZodDto<{
    state?: string | undefined;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
    excludeInvalid?: boolean | undefined;
}, z.ZodObjectDef<{
    state: z.ZodOptional<z.ZodEffects<z.ZodEffects<z.ZodString, string, string>, string, string>>;
    electionYear: z.ZodOptional<z.ZodNumber>;
    electionCode: z.ZodOptional<z.ZodNativeEnum<{
        General: "General";
        LocalOrMunicipal: "LocalOrMunicipal";
        ConsolidatedGeneral: "ConsolidatedGeneral";
    }>>;
    excludeInvalid: z.ZodOptional<z.ZodBoolean>;
}, "strip", z.ZodTypeAny>, {
    state?: string | undefined;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
    excludeInvalid?: boolean | undefined;
}>;
export declare class GetDistrictTypesDTO extends GetDistrictTypesDTO_base {
}
declare const GetDistrictsDTO_base: import("nestjs-zod").ZodDto<{
    state?: string | undefined;
    L2DistrictType?: string | undefined;
    L2DistrictName?: string | undefined;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
    excludeInvalid?: boolean | undefined;
    districtColumns?: string | undefined;
    projectedTurnoutColumns?: string | undefined;
}, z.ZodObjectDef<{
    state: z.ZodOptional<z.ZodEffects<z.ZodEffects<z.ZodString, string, string>, string, string>>;
    L2DistrictType: z.ZodOptional<z.ZodString>;
    L2DistrictName: z.ZodOptional<z.ZodString>;
    electionYear: z.ZodOptional<z.ZodNumber>;
    excludeInvalid: z.ZodOptional<z.ZodBoolean>;
    electionCode: z.ZodOptional<z.ZodNativeEnum<{
        General: "General";
        LocalOrMunicipal: "LocalOrMunicipal";
        ConsolidatedGeneral: "ConsolidatedGeneral";
    }>>;
    districtColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
    projectedTurnoutColumns: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
}, "strip", z.ZodTypeAny>, {
    state?: string | undefined;
    L2DistrictType?: string | undefined;
    L2DistrictName?: string | undefined;
    electionYear?: number | undefined;
    electionCode?: "General" | "LocalOrMunicipal" | "ConsolidatedGeneral" | undefined;
    excludeInvalid?: boolean | undefined;
    districtColumns?: string | undefined;
    projectedTurnoutColumns?: string | undefined;
}>;
export declare class GetDistrictsDTO extends GetDistrictsDTO_base {
}
export {};
