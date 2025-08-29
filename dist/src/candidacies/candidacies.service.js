"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CandidaciesService = void 0;
const common_1 = require("@nestjs/common");
const prisma_util_1 = require("../prisma/util/prisma.util");
let CandidaciesService = class CandidaciesService extends (0, prisma_util_1.createPrismaBase)(prisma_util_1.MODELS.Candidacy) {
    async getCandidacies(filterDto) {
        const { slug, raceSlug, state, columns, includeStances, includeRace, raceColumns, } = filterDto;
        const where = {
            ...(slug && { slug }),
            ...(state && { state }),
            ...(raceSlug && { Race: { slug: raceSlug } }),
        };
        const candidacySelectBase = columns
            ? (0, prisma_util_1.buildColumnSelect)(columns)
            : undefined;
        const stanceInclude = { include: { Issue: true } };
        const raceInclude = this.buildRaceInclude(raceColumns, includeRace);
        const candidacySelection = this.makeCandidacySelection(includeStances ?? false, includeRace ?? false, candidacySelectBase, stanceInclude, raceInclude);
        return candidacySelectBase
            ? this.model.findMany({ where, select: candidacySelection })
            : this.model.findMany({ where, include: candidacySelection });
    }
    makeCandidacySelection(withStances, withRace, candidacySelectBase, stanceInclude, raceInclude) {
        if (!candidacySelectBase) {
            if (!withStances && !withRace)
                return undefined;
            return {
                ...(withStances ? { Stances: stanceInclude } : {}),
                ...(withRace ? { Race: raceInclude } : {}),
            };
        }
        const sel = { ...candidacySelectBase };
        if (withStances)
            sel.Stances = stanceInclude;
        if (withRace)
            sel.Race = raceInclude;
        return sel;
    }
    buildRaceInclude(raceColumns, includeRace) {
        if (!raceColumns)
            return true;
        if (!includeRace)
            return true;
        return {
            select: (0, prisma_util_1.buildColumnSelect)(raceColumns),
        };
    }
};
exports.CandidaciesService = CandidaciesService;
exports.CandidaciesService = CandidaciesService = __decorate([
    (0, common_1.Injectable)()
], CandidaciesService);
//# sourceMappingURL=candidacies.service.js.map