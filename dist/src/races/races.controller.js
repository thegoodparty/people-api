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
exports.RacesController = void 0;
const common_1 = require("@nestjs/common");
const races_service_1 = require("./races.service");
const races_schema_1 = require("./races.schema");
let RacesController = class RacesController {
    racesService;
    constructor(racesService) {
        this.racesService = racesService;
    }
    async getRaces(filterDto) {
        return this.racesService.findRaces(filterDto);
    }
};
exports.RacesController = RacesController;
__decorate([
    (0, common_1.Get)(),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [races_schema_1.RaceFilterDto]),
    __metadata("design:returntype", Promise)
], RacesController.prototype, "getRaces", null);
exports.RacesController = RacesController = __decorate([
    (0, common_1.Controller)('races'),
    __metadata("design:paramtypes", [races_service_1.RacesService])
], RacesController);
//# sourceMappingURL=races.controller.js.map