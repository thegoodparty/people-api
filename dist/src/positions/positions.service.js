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
exports.PositionsService = void 0;
const common_1 = require("@nestjs/common");
const prisma_util_1 = require("../prisma/util/prisma.util");
const projectedTurnout_service_1 = require("../projectedTurnout/projectedTurnout.service");
let PositionsService = class PositionsService extends (0, prisma_util_1.createPrismaBase)(prisma_util_1.MODELS.Position) {
    projectedTurnoutService;
    constructor(projectedTurnoutService) {
        super();
        this.projectedTurnoutService = projectedTurnoutService;
    }
    async getPositionByBallotReadyId(params) {
        const { brPositionId, includeDistrict, electionDate } = params;
        if (includeDistrict && !electionDate) {
            throw new common_1.BadRequestException('If includeDistrict is true, you must pass an electionDate');
        }
        if (!includeDistrict) {
            const position = await this.model.findUniqueOrThrow({
                where: { brPositionId },
            });
            return position;
        }
        const positionWithDistrict = await this.model.findUniqueOrThrow({
            where: { brPositionId },
            include: {
                district: {
                    include: {
                        ProjectedTurnouts: true,
                    },
                },
            },
        });
        if (!positionWithDistrict?.district?.ProjectedTurnouts) {
            throw new common_1.InternalServerErrorException('Failed to fetch projected turnouts');
        }
        if (!electionDate) {
            throw new common_1.InternalServerErrorException('It should be impossible to get to this line without electionDate defined');
        }
        const electionCode = this.projectedTurnoutService.determineElectionCode(electionDate, positionWithDistrict.state);
        const electionYear = new Date(electionDate).getFullYear();
        const filteredTurnout = positionWithDistrict.district.ProjectedTurnouts.filter((turnout) => turnout.electionYear === electionYear &&
            turnout.electionCode === electionCode);
        if (filteredTurnout.length > 1) {
            throw new common_1.InternalServerErrorException('Error: Data integrity issue - duplicate turnouts found for a given electionYear and electionCode');
        }
        if (filteredTurnout.length === 0) {
            throw new common_1.NotFoundException('Error: No projected turnouts matched the electionDate input');
        }
        const { id, brDatabaseId, district, districtId } = positionWithDistrict;
        const { L2DistrictName, L2DistrictType } = district;
        return {
            positionId: id,
            brPositionId,
            brDatabaseId,
            district: {
                id: districtId,
                L2DistrictType,
                L2DistrictName,
                projectedTurnout: filteredTurnout[0],
            },
        };
    }
};
exports.PositionsService = PositionsService;
exports.PositionsService = PositionsService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [projectedTurnout_service_1.ProjectedTurnoutService])
], PositionsService);
//# sourceMappingURL=positions.service.js.map