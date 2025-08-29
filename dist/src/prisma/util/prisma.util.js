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
exports.MODELS = void 0;
exports.createPrismaBase = createPrismaBase;
exports.buildColumnSelect = buildColumnSelect;
const common_1 = require("@nestjs/common");
const prisma_service_1 = require("../prisma.service");
const client_1 = require("@prisma/client");
const lodash_1 = require("lodash");
exports.MODELS = client_1.Prisma.ModelName;
const PASSTHROUGH_MODEL_METHODS = [
    'findMany',
    'findFirst',
    'findFirstOrThrow',
    'findUnique',
    'findUniqueOrThrow',
    'count',
];
function createPrismaBase(modelName) {
    const lowerModelName = (0, lodash_1.lowerFirst)(modelName);
    let BasePrismaService = class BasePrismaService {
        _prisma;
        logger = new common_1.Logger(this.constructor.name);
        get model() {
            return this._prisma[lowerModelName];
        }
        get client() {
            return this._prisma;
        }
        onModuleInit() {
            for (const method of PASSTHROUGH_MODEL_METHODS) {
                this[method] = this.model[method].bind(this.model);
            }
        }
    };
    __decorate([
        (0, common_1.Inject)(),
        __metadata("design:type", prisma_service_1.PrismaService)
    ], BasePrismaService.prototype, "_prisma", void 0);
    BasePrismaService = __decorate([
        (0, common_1.Injectable)()
    ], BasePrismaService);
    return BasePrismaService;
}
function buildColumnSelect(columns) {
    return columns
        .split(',')
        .map((col) => col.trim())
        .reduce((acc, col) => {
        acc[col] = true;
        return acc;
    }, {});
}
//# sourceMappingURL=prisma.util.js.map