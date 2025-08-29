"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GetDistrictsDTO = exports.GetDistrictTypesDTO = exports.GetDistrictNamesDto = exports.projectedTurnoutColumns = exports.districtColumns = void 0;
const client_1 = require("@prisma/client");
const nestjs_zod_1 = require("nestjs-zod");
const states_1 = require("../shared/constants/states");
const zod_1 = require("zod");
exports.districtColumns = Object.values(client_1.Prisma.DistrictScalarFieldEnum);
exports.projectedTurnoutColumns = Object.values(client_1.Prisma.ProjectedTurnoutScalarFieldEnum);
const ElectionCode = zod_1.z.nativeEnum(client_1.ElectionCode);
const getDistrictTypesSchema = zod_1.z.object({
    state: zod_1.z
        .string()
        .transform((v) => v.toUpperCase())
        .refine((v) => states_1.STATE_CODES.includes(v), 'Invalid state code')
        .optional(),
    electionYear: zod_1.z.coerce.number().int().optional(),
    electionCode: ElectionCode.optional(),
    excludeInvalid: zod_1.z.coerce.boolean().optional(),
});
const getDistrictsSchema = zod_1.z.object({
    state: zod_1.z
        .string()
        .transform((v) => v.toUpperCase())
        .refine((v) => states_1.STATE_CODES.includes(v), 'Invalid state code')
        .optional(),
    L2DistrictType: zod_1.z.string().optional(),
    L2DistrictName: zod_1.z.string().optional(),
    electionYear: zod_1.z.coerce.number().int().optional(),
    excludeInvalid: zod_1.z.coerce.boolean().optional(),
    electionCode: ElectionCode.optional(),
    districtColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => exports.districtColumns.includes(col));
    }, {
        message: `Invalid district column provided. Allowed columns are: ${exports.districtColumns.join(', ')}`,
    }),
    projectedTurnoutColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => exports.projectedTurnoutColumns.includes(col));
    }, {
        message: `Invalid projectedTurnout column provided. Allowed columns are ${exports.projectedTurnoutColumns}`,
    }),
});
const getDistrictNamesSchema = zod_1.z.object({
    state: zod_1.z
        .string()
        .transform((v) => v.toUpperCase())
        .refine((v) => states_1.STATE_CODES.includes(v), 'Invalid state code'),
    L2DistrictType: zod_1.z.string(),
    electionYear: zod_1.z.coerce.number().int().optional(),
    excludeInvalid: zod_1.z.coerce.boolean().optional(),
});
class GetDistrictNamesDto extends (0, nestjs_zod_1.createZodDto)(getDistrictNamesSchema) {
}
exports.GetDistrictNamesDto = GetDistrictNamesDto;
class GetDistrictTypesDTO extends (0, nestjs_zod_1.createZodDto)(getDistrictTypesSchema) {
}
exports.GetDistrictTypesDTO = GetDistrictTypesDTO;
class GetDistrictsDTO extends (0, nestjs_zod_1.createZodDto)(getDistrictsSchema) {
}
exports.GetDistrictsDTO = GetDistrictsDTO;
//# sourceMappingURL=districts.schema.js.map