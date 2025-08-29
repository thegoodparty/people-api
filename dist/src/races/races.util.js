"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getDedupedRacesBySlug = getDedupedRacesBySlug;
function getDedupedRacesBySlug(races) {
    const uniqueRaces = new Map();
    for (const race of races) {
        const existing = uniqueRaces.get(race.slug);
        if (existing) {
            existing.positionNames = [
                ...new Set([...existing.positionNames, ...race.positionNames]),
            ];
        }
        else {
            uniqueRaces.set(race.slug, {
                ...race,
                positionNames: [...race.positionNames],
            });
        }
    }
    return [...uniqueRaces.values()];
}
//# sourceMappingURL=races.util.js.map