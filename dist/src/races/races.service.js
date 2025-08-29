"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.RacesService = void 0;
const common_1 = require("@nestjs/common");
const prisma_util_1 = require("../prisma/util/prisma.util");
const prisma_service_1 = require("../prisma/prisma.service");
const races_util_1 = require("./races.util");
let RacesService = class RacesService extends (0, prisma_util_1.createPrismaBase)(prisma_util_1.MODELS.Race) {
    prisma;
    constructor(prisma) {
        super();
        this.prisma = prisma;
    }
    async findRaces(filterDto) {
        const { includePlace, includeCandidacies, state, placeSlug, positionLevel, raceSlug, electionDateStart, electionDateEnd, isPrimary, isRunoff, raceColumns, placeColumns, candidacyColumns, } = filterDto;
        const where = {
            ...(state ? { state } : {}),
            ...(placeSlug ? { Place: { slug: placeSlug } } : {}),
            ...(positionLevel ? { positionLevel } : {}),
            ...(raceSlug ? { slug: raceSlug } : {}),
            ...(isPrimary !== undefined ? { isPrimary } : {}),
            ...(isRunoff !== undefined ? { isRunoff } : {}),
            ...(electionDateStart || electionDateEnd
                ? {
                    electionDate: {
                        ...(electionDateStart
                            ? { gte: new Date(electionDateStart) }
                            : {}),
                        ...(electionDateEnd ? { lte: new Date(electionDateEnd) } : {}),
                    },
                }
                : {}),
        };
        const raceSelectBase = raceColumns
            ? (0, prisma_util_1.buildColumnSelect)(raceColumns)
            : undefined;
        const placeInclude = this.buildPlaceInclude(placeColumns, includePlace);
        const candidacyInclude = this.buildCandidacyInclude(candidacyColumns, includeCandidacies);
        const raceQueryObj = {
            ...(raceSelectBase ?? {}),
            ...(includePlace && { Place: placeInclude }),
            ...(includeCandidacies && { Candidacies: candidacyInclude }),
        };
        const races = raceSelectBase
            ? await this.model.findMany({
                where,
                select: raceQueryObj,
            })
            : await this.model.findMany({
                where,
                include: raceQueryObj,
            });
        if (!races || races.length === 0) {
            throw new common_1.NotFoundException(`No races found for query: ${JSON.stringify(where)}`);
        }
        if (!races[0]?.positionNames || !races[0]?.slug) {
            return races;
        }
        return (0, races_util_1.getDedupedRacesBySlug)(races);
    }
    buildPlaceInclude(placeColumns, includePlace) {
        if (!placeColumns)
            return true;
        if (!includePlace)
            return true;
        return {
            select: (0, prisma_util_1.buildColumnSelect)(placeColumns),
        };
    }
    buildCandidacyInclude(candidacyColumns, includeCandidacies) {
        if (!candidacyColumns)
            return true;
        if (!includeCandidacies)
            return true;
        return {
            select: (0, prisma_util_1.buildColumnSelect)(candidacyColumns),
        };
    }
};
exports.RacesService = RacesService;
exports.RacesService = RacesService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [prisma_service_1.PrismaService])
], RacesService);
//# sourceMappingURL=races.service.js.map