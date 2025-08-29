import { CandidaciesService } from './candidacies.service';
import { CandidacyFilterDto } from './candidacies.schema';
export declare class CandidaciesController {
    private readonly candidaciesService;
    constructor(candidaciesService: CandidaciesService);
    getCandidates(filterDto: CandidacyFilterDto): Promise<{
        id: string;
        createdAt: Date;
        updatedAt: Date;
        brDatabaseId: number;
        slug: string;
        firstName: string;
        lastName: string;
        party: string | null;
        placeName: string | null;
        state: string | null;
        image: string | null;
        about: string | null;
        urls: string[];
        electionFrequency: number[];
        salary: string | null;
        normalizedPositionName: string | null;
        positionName: string | null;
        positionDescription: string | null;
        raceId: string | null;
    }[]>;
}
