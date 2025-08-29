import { z } from 'zod';
export declare const getPositionByBrIdParamsSchema: z.ZodObject<{
    brPositionId: z.ZodString;
}, "strip", z.ZodTypeAny, {
    brPositionId: string;
}, {
    brPositionId: string;
}>;
export declare const getPositionByBrIdQuerySchema: z.ZodEffects<z.ZodObject<{
    includeDistrict: z.ZodOptional<z.ZodBoolean>;
    electionDate: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
}, "strip", z.ZodTypeAny, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}>, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}>;
export declare const getPositionByBrIdRequestSchema: z.ZodObject<{
    params: z.ZodObject<{
        brPositionId: z.ZodString;
    }, "strip", z.ZodTypeAny, {
        brPositionId: string;
    }, {
        brPositionId: string;
    }>;
    query: z.ZodEffects<z.ZodObject<{
        includeDistrict: z.ZodOptional<z.ZodBoolean>;
        electionDate: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
    }, "strip", z.ZodTypeAny, {
        electionDate?: string | undefined;
        includeDistrict?: boolean | undefined;
    }, {
        electionDate?: string | undefined;
        includeDistrict?: boolean | undefined;
    }>, {
        electionDate?: string | undefined;
        includeDistrict?: boolean | undefined;
    }, {
        electionDate?: string | undefined;
        includeDistrict?: boolean | undefined;
    }>;
}, "strip", z.ZodTypeAny, {
    query: {
        electionDate?: string | undefined;
        includeDistrict?: boolean | undefined;
    };
    params: {
        brPositionId: string;
    };
}, {
    query: {
        electionDate?: string | undefined;
        includeDistrict?: boolean | undefined;
    };
    params: {
        brPositionId: string;
    };
}>;
declare const GetPositionByBrIdQueryDTO_base: import("nestjs-zod").ZodDto<{
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}, z.ZodEffectsDef<z.ZodObject<{
    includeDistrict: z.ZodOptional<z.ZodBoolean>;
    electionDate: z.ZodEffects<z.ZodOptional<z.ZodString>, string | undefined, string | undefined>;
}, "strip", z.ZodTypeAny, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}>>, {
    electionDate?: string | undefined;
    includeDistrict?: boolean | undefined;
}>;
export declare class GetPositionByBrIdQueryDTO extends GetPositionByBrIdQueryDTO_base {
}
declare const GetPositionByBrIdParamsDTO_base: import("nestjs-zod").ZodDto<{
    brPositionId: string;
}, z.ZodObjectDef<{
    brPositionId: z.ZodString;
}, "strip", z.ZodTypeAny>, {
    brPositionId: string;
}>;
export declare class GetPositionByBrIdParamsDTO extends GetPositionByBrIdParamsDTO_base {
}
export {};
