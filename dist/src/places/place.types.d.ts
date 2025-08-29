import { Prisma } from '@prisma/client';
export declare const SLUG_COLUMN_NAME = "slug";
export declare const POSITION_NAMES_COLUMN_NAME = "positionNames";
type PlaceWithRaces = Prisma.PlaceGetPayload<{
    include: {
        Races: true;
    };
}>;
export declare function hasRaces(p: unknown): p is PlaceWithRaces;
export type PlaceCore = Prisma.PlaceGetPayload<{}>;
export type PlaceWithChildren = Prisma.PlaceGetPayload<{
    include: {
        children: true;
    };
}>;
export type PlaceWithParent = Prisma.PlaceGetPayload<{
    include: {
        parent: true;
    };
}>;
export type PlaceWithCategories = PlaceCore & {
    children?: PlaceCore[];
    counties?: PlaceCore[];
    districts?: PlaceCore[];
    others?: PlaceCore[];
};
export declare function hasChildren(p: PlaceCore): p is PlaceWithChildren;
export declare function hasParent(p: PlaceCore): p is PlaceWithParent;
export declare function hasPlaceCategories(p: PlaceCore): p is PlaceWithCategories;
export {};
