import { MostElectionsDto, PlaceFilterDto } from './places.schema';
import { PlacesService } from './places.service';
export declare class PlaceController {
    private readonly placesService;
    constructor(placesService: PlacesService);
    getPlaces(filterDto: PlaceFilterDto): Promise<import("./place.types").PlaceWithCategories[]>;
    getPlacesWithMostElections(mostElectionsDto: MostElectionsDto): Promise<{
        slug: string;
        name: string;
        race_count: number;
    }[]>;
}
