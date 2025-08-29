import { PositionsService } from './positions.service';
import { GetPositionByBrIdParamsDTO, GetPositionByBrIdQueryDTO } from './positions.schema';
export declare class PositionsController {
    private readonly positions;
    constructor(positions: PositionsService);
    getPositionByBallotReadyId(params: GetPositionByBrIdParamsDTO, query: GetPositionByBrIdQueryDTO): Promise<{
        id: string;
        brDatabaseId: string;
        state: string;
        districtId: string;
        brPositionId: string;
    } | {
        positionId: string;
        brPositionId: string;
        brDatabaseId: string;
        district: {
            id: string;
            L2DistrictType: string;
            L2DistrictName: string;
            projectedTurnout: {
                projectedTurnout: number;
                id: string;
                createdAt: Date;
                updatedAt: Date;
                electionYear: number;
                electionCode: import(".prisma/client").$Enums.ElectionCode;
                inferenceAt: Date;
                modelVersion: string;
                districtId: string;
            };
        };
    }>;
}
