import { DistrictsService } from './districts.service';
import { GetDistrictNamesDto, GetDistrictsDTO, GetDistrictTypesDTO } from './districts.schema';
export declare class DistrictsController {
    private readonly districts;
    constructor(districts: DistrictsService);
    getDistricts(dto: GetDistrictsDTO): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        state: string;
        _count: {
            ProjectedTurnouts: number;
            Positions: number;
        };
        L2DistrictType: string;
        L2DistrictName: string;
        ProjectedTurnouts: {
            projectedTurnout: number;
            id: string;
            createdAt: Date;
            updatedAt: Date;
            electionYear: number;
            electionCode: import(".prisma/client").$Enums.ElectionCode;
            inferenceAt: Date;
            modelVersion: string;
            districtId: string;
        }[];
        Positions: {
            id: string;
            brDatabaseId: string;
            state: string;
            districtId: string;
            brPositionId: string;
        }[];
    }[]>;
    getDistrictTypes(dto: GetDistrictTypesDTO): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        state: string;
        _count: {
            ProjectedTurnouts: number;
            Positions: number;
        };
        L2DistrictType: string;
        L2DistrictName: string;
        ProjectedTurnouts: {
            projectedTurnout: number;
            id: string;
            createdAt: Date;
            updatedAt: Date;
            electionYear: number;
            electionCode: import(".prisma/client").$Enums.ElectionCode;
            inferenceAt: Date;
            modelVersion: string;
            districtId: string;
        }[];
        Positions: {
            id: string;
            brDatabaseId: string;
            state: string;
            districtId: string;
            brPositionId: string;
        }[];
    }[]>;
    getDistrictNames(dto: GetDistrictNamesDto): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        state: string;
        _count: {
            ProjectedTurnouts: number;
            Positions: number;
        };
        L2DistrictType: string;
        L2DistrictName: string;
        ProjectedTurnouts: {
            projectedTurnout: number;
            id: string;
            createdAt: Date;
            updatedAt: Date;
            electionYear: number;
            electionCode: import(".prisma/client").$Enums.ElectionCode;
            inferenceAt: Date;
            modelVersion: string;
            districtId: string;
        }[];
        Positions: {
            id: string;
            brDatabaseId: string;
            state: string;
            districtId: string;
            brPositionId: string;
        }[];
    }[]>;
}
