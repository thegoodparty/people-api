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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProjectedTurnoutController = void 0;
const common_1 = require("@nestjs/common");
const projectedTurnout_service_1 = require("./projectedTurnout.service");
const projectedTurnout_schema_1 = require("./projectedTurnout.schema");
let ProjectedTurnoutController = class ProjectedTurnoutController {
    projectedTurnoutService;
    constructor(projectedTurnoutService) {
        this.projectedTurnoutService = projectedTurnoutService;
    }
    async getProjectedTurnout(dto) {
        const record = await this.projectedTurnoutService.getProjectedTurnout(dto);
        if (!record) {
            const formattedParams = this.formatDtoForError(dto);
            throw new common_1.NotFoundException(`Projected turnout not found for the following parameters:\n${formattedParams}`);
        }
        return record;
    }
    formatDtoForError(dto) {
        const params = [];
        if (dto.state) {
            params.push(`State: ${dto.state}`);
        }
        if (dto.electionDate) {
            params.push(`Election Date: ${dto.electionDate}`);
        }
        if (dto.L2DistrictType) {
            let districtTypeLabel = '';
            if (typeof dto.L2DistrictType === 'string') {
                try {
                    const parsed = JSON.parse(dto.L2DistrictType);
                    districtTypeLabel =
                        parsed.label || parsed.L2DistrictType || dto.L2DistrictType;
                }
                catch {
                    districtTypeLabel = dto.L2DistrictType;
                }
            }
            else {
                districtTypeLabel = String(dto.L2DistrictType);
            }
            params.push(`District Type: ${districtTypeLabel}`);
        }
        if (dto.L2DistrictName) {
            let districtName = '';
            if (typeof dto.L2DistrictName === 'string') {
                try {
                    const parsed = JSON.parse(dto.L2DistrictName);
                    districtName = parsed.L2DistrictName || dto.L2DistrictName;
                }
                catch {
                    districtName = dto.L2DistrictName;
                }
            }
            else {
                districtName = String(dto.L2DistrictName);
            }
            params.push(`District Name: ${districtName}`);
        }
        return params.join('\n');
    }
};
exports.ProjectedTurnoutController = ProjectedTurnoutController;
__decorate([
    (0, common_1.Get)(),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [projectedTurnout_schema_1.ProjectedTurnoutUniqueDTO]),
    __metadata("design:returntype", Promise)
], ProjectedTurnoutController.prototype, "getProjectedTurnout", null);
exports.ProjectedTurnoutController = ProjectedTurnoutController = __decorate([
    (0, common_1.Controller)('projectedTurnout'),
    __metadata("design:paramtypes", [projectedTurnout_service_1.ProjectedTurnoutService])
], ProjectedTurnoutController);
//# sourceMappingURL=projectedTurnout.controller.js.map