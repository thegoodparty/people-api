"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DistrictsService = void 0;
const prisma_util_1 = require("../prisma/util/prisma.util");
const client_1 = require("@prisma/client");
const common_1 = require("@nestjs/common");
class DistrictsService extends (0, prisma_util_1.createPrismaBase)(prisma_util_1.MODELS.District) {
    constructor() {
        super();
    }
    async getDistrictTypes(dto) {
        return this.listDistinct(dto, client_1.Prisma.DistrictScalarFieldEnum.L2DistrictType);
    }
    async getDistrictNames(dto) {
        return this.listDistinct(dto, client_1.Prisma.DistrictScalarFieldEnum.L2DistrictName);
    }
    async getDistricts(dto) {
        const { districtColumns, projectedTurnoutColumns } = dto;
        const turnoutWhere = this.buildTurnoutWhere(dto);
        const where = this.buildDistrictWhere(dto, turnoutWhere);
        const districtSelectBase = districtColumns
            ? (0, prisma_util_1.buildColumnSelect)(districtColumns)
            : undefined;
        const projectedTurnoutInclude = this.buildProjectedTurnoutInclude(projectedTurnoutColumns, turnoutWhere);
        const districtQueryObj = {
            ...(districtSelectBase ?? {}),
            ...(projectedTurnoutInclude && {
                ProjectedTurnouts: projectedTurnoutInclude,
            }),
        };
        const districts = districtSelectBase
            ? await this.model.findMany({
                where,
                select: districtQueryObj,
            })
            : await this.model.findMany({
                where,
                include: districtQueryObj,
            });
        if (!districts || districts.length === 0) {
            throw new common_1.NotFoundException(`No districts found for query: ${JSON.stringify(where)}`);
        }
        return districts;
    }
    buildTurnoutWhere(dto) {
        return {
            ...(dto.electionYear && { electionYear: dto.electionYear }),
            ...(dto.electionCode && { electionCode: dto.electionCode }),
            ...(dto.excludeInvalid && { projectedTurnout: { gt: 0 } }),
        };
    }
    buildDistrictWhere(dto, turnoutWhere) {
        const hasTurnout = Object.keys(turnoutWhere).length > 0;
        return {
            ...(dto.state && { state: dto.state }),
            ...(dto.L2DistrictType && { L2DistrictType: dto.L2DistrictType }),
            ...(dto.L2DistrictName && { L2DistrictName: dto.L2DistrictName }),
            ...(hasTurnout && { ProjectedTurnouts: { some: turnoutWhere } }),
        };
    }
    async listDistinct(dto, field) {
        const turnoutWhere = this.buildTurnoutWhere(dto);
        const where = this.buildDistrictWhere(dto, turnoutWhere);
        return await this.model.findMany({
            where,
            select: { id: true, [field]: true },
            distinct: [field],
            orderBy: { [field]: client_1.Prisma.SortOrder.asc },
        });
    }
    buildProjectedTurnoutInclude(projectedTurnoutColumns, turnoutWhere) {
        if (!projectedTurnoutColumns)
            return true;
        const select = (0, prisma_util_1.buildColumnSelect)(projectedTurnoutColumns);
        return {
            select,
            where: turnoutWhere && Object.keys(turnoutWhere).length
                ? turnoutWhere
                : undefined,
        };
    }
}
exports.DistrictsService = DistrictsService;
//# sourceMappingURL=districts.service.js.map