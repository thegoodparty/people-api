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
exports.PlaceController = void 0;
const common_1 = require("@nestjs/common");
const places_schema_1 = require("./places.schema");
const places_service_1 = require("./places.service");
const MIN_RACES = 100;
let PlaceController = class PlaceController {
    placesService;
    constructor(placesService) {
        this.placesService = placesService;
    }
    async getPlaces(filterDto) {
        return this.placesService.getPlaces(filterDto);
    }
    async getPlacesWithMostElections(mostElectionsDto) {
        return this.placesService.getPlacesWithMostElections(MIN_RACES, mostElectionsDto.count);
    }
};
exports.PlaceController = PlaceController;
__decorate([
    (0, common_1.Get)(),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [places_schema_1.PlaceFilterDto]),
    __metadata("design:returntype", Promise)
], PlaceController.prototype, "getPlaces", null);
__decorate([
    (0, common_1.Get)('most-elections'),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [places_schema_1.MostElectionsDto]),
    __metadata("design:returntype", Promise)
], PlaceController.prototype, "getPlacesWithMostElections", null);
exports.PlaceController = PlaceController = __decorate([
    (0, common_1.Controller)('places'),
    __metadata("design:paramtypes", [places_service_1.PlacesService])
], PlaceController);
//# sourceMappingURL=places.controller.js.map