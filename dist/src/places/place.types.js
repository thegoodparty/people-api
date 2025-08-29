"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.POSITION_NAMES_COLUMN_NAME = exports.SLUG_COLUMN_NAME = void 0;
exports.hasRaces = hasRaces;
exports.hasChildren = hasChildren;
exports.hasParent = hasParent;
exports.hasPlaceCategories = hasPlaceCategories;
exports.SLUG_COLUMN_NAME = 'slug';
exports.POSITION_NAMES_COLUMN_NAME = 'positionNames';
function hasRaces(p) {
    return (typeof p === 'object' &&
        p !== null &&
        'Races' in p &&
        Array.isArray(p.Races));
}
function hasChildren(p) {
    return ('children' in p && Array.isArray(p.children));
}
function hasParent(p) {
    return 'parent' in p && p.parent !== undefined;
}
function hasPlaceCategories(p) {
    return (Array.isArray(p.counties) ||
        Array.isArray(p.districts) ||
        Array.isArray(p.others));
}
//# sourceMappingURL=place.types.js.map