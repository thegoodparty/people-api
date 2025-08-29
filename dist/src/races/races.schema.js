"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RaceFilterDto = exports.raceColumns = void 0;
const client_1 = require("@prisma/client");
const nestjs_zod_1 = require("nestjs-zod");
const candidacies_schema_1 = require("../candidacies/candidacies.schema");
const places_schema_1 = require("../places/places.schema");
const states_1 = require("../shared/constants/states");
const strings_util_1 = require("../shared/util/strings.util");
const zod_1 = require("zod");
exports.raceColumns = Object.values(client_1.Prisma.RaceScalarFieldEnum);
const positionLevelEnum = zod_1.z.enum([
    'CITY',
    'COUNTY',
    'FEDERAL',
    'LOCAL',
    'REGIONAL',
    'STATE',
    'TOWNSHIP',
]);
const raceFilterSchema = zod_1.z
    .object({
    state: zod_1.z
        .preprocess(strings_util_1.toUpper, zod_1.z.string())
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        return states_1.STATE_CODES.includes(val);
    }, 'Invalid state code'),
    placeSlug: zod_1.z.string().optional(),
    positionLevel: positionLevelEnum.optional(),
    raceSlug: zod_1.z.string().optional(),
    electionDateStart: zod_1.z.string().optional(),
    electionDateEnd: zod_1.z.string().optional(),
    includePlace: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    includeCandidacies: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional().default(false)),
    isPrimary: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional()),
    isRunoff: zod_1.z.preprocess((val) => val === 'true' || val === '1' || val === true, zod_1.z.boolean().optional()),
    raceColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => exports.raceColumns.includes(col));
    }, {
        message: `Invalid race column provided. Allowed columns are: ${exports.raceColumns.join(', ')}`,
    }),
    placeColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => places_schema_1.placeColumns.includes(col));
    }, {
        message: `Invalid place column provided. Allowed columns are: ${places_schema_1.placeColumns.join(', ')}`,
    }),
    candidacyColumns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => places_schema_1.placeColumns.includes(col));
    }, {
        message: `Invalid place column provided. Allowed columns are: ${candidacies_schema_1.candidacyColumns.join(', ')}`,
    }),
})
    .strict();
class RaceFilterDto extends (0, nestjs_zod_1.createZodDto)(raceFilterSchema) {
}
exports.RaceFilterDto = RaceFilterDto;
//# sourceMappingURL=races.schema.js.map