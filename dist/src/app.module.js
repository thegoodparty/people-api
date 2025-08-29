"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const races_module_1 = require("./races/races.module");
const places_module_1 = require("./places/places.module");
const health_module_1 = require("./health/health.module");
const candidacies_module_1 = require("./candidacies/candidacies.module");
const projectedTurnout_module_1 = require("./projectedTurnout/projectedTurnout.module");
const districts_module_1 = require("./districts/districts.module");
const positions_module_1 = require("./positions/positions.module");
let AppModule = class AppModule {
};
exports.AppModule = AppModule;
exports.AppModule = AppModule = __decorate([
    (0, common_1.Module)({
        imports: [
            races_module_1.RacesModule,
            places_module_1.PlacesModule,
            health_module_1.HealthModule,
            candidacies_module_1.CandidaciesModule,
            projectedTurnout_module_1.ProjectedTurnoutModule,
            districts_module_1.DistrictsModule,
            positions_module_1.PositionsModule,
        ],
    })
], AppModule);
//# sourceMappingURL=app.module.js.map