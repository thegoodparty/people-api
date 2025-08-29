"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CandidacyFilterDto = exports.candidacyColumns = void 0;
const nestjs_zod_1 = require("nestjs-zod");
const states_1 = require("../shared/constants/states");
const strings_util_1 = require("../shared/util/strings.util");
const zod_1 = require("zod");
const client_1 = require("@prisma/client");
exports.candidacyColumns = Object.values(client_1.Prisma.CandidacyScalarFieldEnum);
const raceColumns = Object.values(client_1.Prisma.RaceScalarFieldEnum);
const candidacyFilterSchema = zod_1.z
    .object({
    state: zod_1.z
        .preprocess(strings_util_1.toUpper, zod_1.z.string())
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        return states_1.STATE_CODES.includes(val);
    }, 'Invalid state code'),
    slug: zod_1.z.string().optional(),
    raceSlug: zod_1.z.string().optional(),
    includeStances: zod_1.z.coerce.boolean().optional().default(false),
    includeRace: zod_1.z.coerce.boolean().optional().default(false),
    columns: zod_1.z
        .string()
        .optional()
        .refine((val) => {
        if (!val)
            return true;
        const columns = val.split(',').map((col) => col.trim());
        return columns.every((col) => exports.candidacyColumns.includes(col));
    }, {
        message: `Invalid candidacy column provided. Allowed columns are: ${exports.candidacyColumns.join(', ')}`,
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
})
    .strict();
class CandidacyFilterDto extends (0, nestjs_zod_1.createZodDto)(candidacyFilterSchema) {
}
exports.CandidacyFilterDto = CandidacyFilterDto;
//# sourceMappingURL=candidacies.schema.js.map