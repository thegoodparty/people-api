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
exports.DistrictsController = void 0;
const common_1 = require("@nestjs/common");
const districts_service_1 = require("./districts.service");
const districts_schema_1 = require("./districts.schema");
let DistrictsController = class DistrictsController {
    districts;
    constructor(districts) {
        this.districts = districts;
    }
    getDistricts(dto) {
        return this.districts.getDistricts(dto);
    }
    getDistrictTypes(dto) {
        return this.districts.getDistrictTypes(dto);
    }
    getDistrictNames(dto) {
        return this.districts.getDistrictNames(dto);
    }
};
exports.DistrictsController = DistrictsController;
__decorate([
    (0, common_1.Get)('list'),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [districts_schema_1.GetDistrictsDTO]),
    __metadata("design:returntype", void 0)
], DistrictsController.prototype, "getDistricts", null);
__decorate([
    (0, common_1.Get)('types'),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [districts_schema_1.GetDistrictTypesDTO]),
    __metadata("design:returntype", void 0)
], DistrictsController.prototype, "getDistrictTypes", null);
__decorate([
    (0, common_1.Get)('names'),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [districts_schema_1.GetDistrictNamesDto]),
    __metadata("design:returntype", void 0)
], DistrictsController.prototype, "getDistrictNames", null);
exports.DistrictsController = DistrictsController = __decorate([
    (0, common_1.Controller)('districts'),
    __metadata("design:paramtypes", [districts_service_1.DistrictsService])
], DistrictsController);
//# sourceMappingURL=districts.controller.js.map