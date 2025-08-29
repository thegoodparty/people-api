export declare function getDedupedRacesBySlug<T extends {
    slug: string;
    positionNames: string[];
}>(races: T[]): T[];
