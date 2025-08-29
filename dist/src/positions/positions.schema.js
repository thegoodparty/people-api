"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GetPositionByBrIdParamsDTO = exports.GetPositionByBrIdQueryDTO = exports.getPositionByBrIdRequestSchema = exports.getPositionByBrIdQuerySchema = exports.getPositionByBrIdParamsSchema = void 0;
const nestjs_zod_1 = require("nestjs-zod");
const zod_1 = require("zod");
exports.getPositionByBrIdParamsSchema = zod_1.z.object({
    brPositionId: zod_1.z.string().min(1, 'BallotReady Position ID is required'),
});
exports.getPositionByBrIdQuerySchema = zod_1.z
    .object({
    includeDistrict: zod_1.z.coerce.boolean().optional(),
    electionDate: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (val === undefined)
            return true;
        return !isNaN(new Date(val).getTime());
    }, {
        message: 'Invalid date string',
    }),
})
    .refine((data) => {
    if (data.includeDistrict === true) {
        return data.electionDate !== undefined;
    }
    return true;
}, {
    message: 'When includeDistrict is true, electionDate has to be provided',
    path: ['electionDate'],
});
exports.getPositionByBrIdRequestSchema = zod_1.z.object({
    params: exports.getPositionByBrIdParamsSchema,
    query: exports.getPositionByBrIdQuerySchema,
});
class GetPositionByBrIdQueryDTO extends (0, nestjs_zod_1.createZodDto)(exports.getPositionByBrIdQuerySchema) {
}
exports.GetPositionByBrIdQueryDTO = GetPositionByBrIdQueryDTO;
class GetPositionByBrIdParamsDTO extends (0, nestjs_zod_1.createZodDto)(exports.getPositionByBrIdParamsSchema) {
}
exports.GetPositionByBrIdParamsDTO = GetPositionByBrIdParamsDTO;
//# sourceMappingURL=positions.schema.js.map