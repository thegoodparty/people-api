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
var ProjectedTurnoutService_1;
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProjectedTurnoutService = void 0;
const common_1 = require("@nestjs/common");
const prisma_util_1 = require("../prisma/util/prisma.util");
const client_1 = require("@prisma/client");
let ProjectedTurnoutService = class ProjectedTurnoutService extends (0, prisma_util_1.createPrismaBase)(prisma_util_1.MODELS.ProjectedTurnout) {
    static { ProjectedTurnoutService_1 = this; }
    static CONSOLIDATED_2YR_STATES = new Set([
        'LA',
        'MS',
        'NJ',
        'VA',
    ]);
    static CONSOLIDATED_4YR_STATES = new Set(['KS']);
    static makeStateGuard(set) {
        return (s) => set.has(s);
    }
    static isTwoYearState = ProjectedTurnoutService_1.makeStateGuard(ProjectedTurnoutService_1.CONSOLIDATED_2YR_STATES);
    static isFourYearState = ProjectedTurnoutService_1.makeStateGuard(ProjectedTurnoutService_1.CONSOLIDATED_4YR_STATES);
    constructor() {
        super();
    }
    async getProjectedTurnout(dto) {
        const { electionYear, electionDate, state, L2DistrictType, L2DistrictName, } = dto;
        const electionCode = dto.electionCode ?? this.determineElectionCode(electionDate, state);
        return this.model.findFirst({
            where: {
                electionCode,
                electionYear,
                district: {
                    L2DistrictType,
                    L2DistrictName,
                },
            },
        });
    }
    async getManyProjectedTurnouts(dto) {
        const { state, L2DistrictType, L2DistrictName, electionYear, electionCode, includeDistrict, } = dto;
        const districtInclude = state || L2DistrictType || L2DistrictName ? true : includeDistrict;
        return districtInclude
            ? this.model.findMany({
                where: {
                    district: {
                        state,
                        L2DistrictType,
                        L2DistrictName,
                    },
                    electionYear,
                    electionCode,
                },
                include: { district: districtInclude },
            })
            : this.model.findMany({
                where: {
                    electionYear,
                    electionCode,
                },
            });
    }
    isTuesdayAfterFirstMondayInNov(date) {
        const day = date.getDate();
        return date.getMonth() === 10 && date.getDay() === 2 && day > 1 && day <= 8;
    }
    determineElectionCode(electionDate, state) {
        const date = new Date(`${electionDate}T00:00:00`);
        const year = date.getFullYear();
        if (!this.isTuesdayAfterFirstMondayInNov(date)) {
            return client_1.ElectionCode.LocalOrMunicipal;
        }
        if (year % 2 === 0) {
            return client_1.ElectionCode.General;
        }
        if (ProjectedTurnoutService_1.isTwoYearState(state) &&
            ProjectedTurnoutService_1.CONSOLIDATED_2YR_STATES.has(state)) {
            return client_1.ElectionCode.ConsolidatedGeneral;
        }
        const isFourthYear = (year - 2003) % 4 === 0;
        if (ProjectedTurnoutService_1.isFourYearState(state) &&
            ProjectedTurnoutService_1.CONSOLIDATED_4YR_STATES.has(state) &&
            isFourthYear) {
            return client_1.ElectionCode.ConsolidatedGeneral;
        }
        return client_1.ElectionCode.LocalOrMunicipal;
    }
};
exports.ProjectedTurnoutService = ProjectedTurnoutService;
exports.ProjectedTurnoutService = ProjectedTurnoutService = ProjectedTurnoutService_1 = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [])
], ProjectedTurnoutService);
//# sourceMappingURL=projectedTurnout.service.js.map