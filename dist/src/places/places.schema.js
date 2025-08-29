"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MostElectionsDto = exports.PlaceFilterDto = exports.placeColumns = void 0;
const client_1 = require("@prisma/client");
const nestjs_zod_1 = require("nestjs-zod");
const states_1 = require("../shared/constants/states");
const zod_1 = require("zod");
exports.placeColumns = Object.values(client_1.Prisma.PlaceScalarFieldEnum);
const raceColumns = Object.values(client_1.Prisma.RaceScalarFieldEnum);
const toUpper = (val) => typeof val === 'string' ? val.toUpperCase() : val;
const placeFilterSchema = zod_1.z.object({
    state: zod_1.z
        .preprocess(toUpper, zod_1.z.string())
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        return states_1.STATE_CODES.includes(val);
    }, 'Invalid state code'),
    name: zod_1.z.string().optional(),
    slug: zod_1.z.string().optional(),
    mtfcc: zod_1.z.string().optional(),
    includeChildren: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    includeChildRaces: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    includeParent: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    includeRaces: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    categorizeChildren: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    placeColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => exports.placeColumns.includes(col));
    }, {
        message: `Invalid place column provided. Allowed columns are: ${exports.placeColumns.join(', ')}`,
    }),
    raceColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => raceColumns.includes(col));
    }, {
        message: `Invalid race column provided. Allowed columns are: ${raceColumns.join(', ')}`,
    }),
});
const mostElectionsSchema = zod_1.z.object({
    count: zod_1.z
        .string()
        .transform(Number)
        .refine((n) => Number.isInteger(n) && n > 0, {
        message: 'count must be a positive integer',
    }),
});
class PlaceFilterDto extends (0, nestjs_zod_1.createZodDto)(placeFilterSchema) {
}
exports.PlaceFilterDto = PlaceFilterDto;
class MostElectionsDto extends (0, nestjs_zod_1.createZodDto)(mostElectionsSchema) {
}
exports.MostElectionsDto = MostElectionsDto;
//# sourceMappingURL=places.schema.js.map