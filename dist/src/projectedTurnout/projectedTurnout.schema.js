"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProjectedTurnoutManyQueryDTO = exports.ProjectedTurnoutUniqueDTO = void 0;
const states_1 = require("../shared/constants/states");
const zod_1 = require("zod");
const client_1 = require("@prisma/client");
const nestjs_zod_1 = require("nestjs-zod");
const ElectionEnum = zod_1.z.nativeEnum(client_1.ElectionCode);
const projectedTurnoutUniqueSchema = zod_1.z
    .object({
    state: zod_1.z
        .string()
        .transform((v) => v.toUpperCase())
        .refine((v) => states_1.STATE_CODES.includes(v), 'Invalid state code'),
    L2DistrictType: zod_1.z.string(),
    L2DistrictName: zod_1.z.string(),
    electionYear: zod_1.z.preprocess((val) => Number(val), zod_1.z.number()).optional(),
    electionDate: zod_1.z.string().refine((val) => !isNaN(new Date(val).getTime()), {
        message: 'Invalid date string',
    }),
    electionCode: ElectionEnum.optional(),
})
    .refine((data) => data.electionCode || data.electionDate, {
    message: 'Either electionCode or electionDate is required',
    path: ['electionCode'],
});
const projectedTurnoutManyQuerySchema = zod_1.z
    .object({
    state: zod_1.z
        .string()
        .transform((v) => v.toUpperCase())
        .refine((v) => states_1.STATE_CODES.includes(v), 'Invalid state code'),
    L2DistrictType: zod_1.z.string().optional(),
    L2DistrictName: zod_1.z.string().optional(),
    electionYear: zod_1.z.preprocess((val) => Number(val), zod_1.z.number()).optional(),
    electionCode: ElectionEnum.optional(),
    includeDistrict: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
})
    .refine((data) => data.state !== undefined ||
    data.L2DistrictType !== undefined ||
    data.L2DistrictName !== undefined ||
    data.electionYear !== undefined ||
    data.electionCode !== undefined, {
    message: 'Provide at least one of L2DistrictType, L2DistrictName, electionYear, or electionCode',
});
class ProjectedTurnoutUniqueDTO extends (0, nestjs_zod_1.createZodDto)(projectedTurnoutUniqueSchema) {
}
exports.ProjectedTurnoutUniqueDTO = ProjectedTurnoutUniqueDTO;
class ProjectedTurnoutManyQueryDTO extends (0, nestjs_zod_1.createZodDto)(projectedTurnoutManyQuerySchema) {
}
exports.ProjectedTurnoutManyQueryDTO = ProjectedTurnoutManyQueryDTO;
//# sourceMappingURL=projectedTurnout.schema.js.map