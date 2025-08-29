import { ProjectedTurnoutService } from './projectedTurnout.service';
import { ProjectedTurnoutUniqueDTO } from './projectedTurnout.schema';
export declare class ProjectedTurnoutController {
    private readonly projectedTurnoutService;
    constructor(projectedTurnoutService: ProjectedTurnoutService);
    getProjectedTurnout(dto: ProjectedTurnoutUniqueDTO): Promise<{
        projectedTurnout: number;
        id: string;
        createdAt: Date;
        updatedAt: Date;
        electionYear: number;
        electionCode: import(".prisma/client").$Enums.ElectionCode;
        inferenceAt: Date;
        modelVersion: string;
        districtId: string;
    }>;
    private formatDtoForError;
}
