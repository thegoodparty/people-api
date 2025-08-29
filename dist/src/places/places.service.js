"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PlacesService = void 0;
const common_1 = require("@nestjs/common");
const prisma_util_1 = require("../prisma/util/prisma.util");
const place_types_1 = require("./place.types");
const races_util_1 = require("../races/races.util");
const COUNTY_MTFCC = { G4020: true };
const DISTRICT_MTFCC = { G5420: true, G5410: true, G5400: true };
let PlacesService = class PlacesService extends (0, prisma_util_1.createPrismaBase)(prisma_util_1.MODELS.Place) {
    constructor() {
        super();
    }
    async getPlaces(filterDto) {
        const { includeChildren, includeChildRaces, includeParent, includeRaces, categorizeChildren, state, name, slug, mtfcc, placeColumns, raceColumns, } = filterDto;
        this.logger.debug(`includeChildren: ${includeChildren}`);
        this.logger.debug(`includeParent: ${includeParent}`);
        const baseWhere = {
            ...(state ? { state } : {}),
            ...(name ? { name } : {}),
            ...(mtfcc ? { mtfcc } : {}),
            ...(slug ? { slug } : {}),
        };
        const placeSelectBase = placeColumns
            ? (0, prisma_util_1.buildColumnSelect)(placeColumns)
            : undefined;
        const raceInclude = this.buildRaceInclude(raceColumns, includeRaces);
        const childRaceInclude = this.buildRaceInclude(raceColumns, includeChildRaces);
        const placeSelection = this.makePlaceSelection(includeRaces, placeSelectBase, raceInclude);
        const childrenPlaceSelection = this.makePlaceSelection(includeChildRaces, placeSelectBase, childRaceInclude);
        const placeQueryObj = {
            ...(placeSelectBase ?? {}),
            ...(includeRaces && { Races: raceInclude }),
            ...(includeChildren && { children: childrenPlaceSelection }),
            ...(includeParent && { parent: placeSelection }),
        };
        this.logger.debug(placeQueryObj);
        let places = [];
        if (!categorizeChildren) {
            places = await this.runQuery(baseWhere, placeSelectBase, placeQueryObj);
        }
        else {
            places = await this.runQuery(baseWhere, placeSelectBase, placeQueryObj);
            for (const place of places) {
                place.counties = [];
                place.districts = [];
                place.others = [];
                if (!place.children)
                    continue;
                for (const child of place.children) {
                    if (COUNTY_MTFCC[child.mtfcc]) {
                        place.counties.push(child);
                    }
                    else if (DISTRICT_MTFCC[child.mtfcc]) {
                        place.districts.push(child);
                    }
                    else {
                        place.others.push(child);
                    }
                }
                delete place.children;
            }
        }
        if (!places || places.length === 0) {
            throw new common_1.NotFoundException(`No places found for query: ${JSON.stringify(baseWhere)}`);
        }
        this.dedupeRacesInTree({
            places,
            includeRaces,
            includeChildren,
            includeParent,
        });
        return places;
    }
    async getPlacesWithMostElections(minRaces, count) {
        const places = await this.client.$queryRaw `
      SELECT   p.slug,
               p.name,
               COUNT(r.id)::int AS race_count
      FROM     "Place" p
      LEFT JOIN "Race" r ON r."place_id" = p.id
      WHERE    p."mtfcc" <> 'G4000'
      GROUP BY p.id
      HAVING   COUNT(r.id) > ${minRaces}
      ORDER BY race_count DESC;
    `;
        const topPlaces = places.slice(0, count);
        return topPlaces;
    }
    buildRaceInclude(raceColumns, includeRaces) {
        if (!raceColumns)
            return true;
        if (!includeRaces)
            return true;
        const cols = Array.from(new Set([
            ...raceColumns.split(','),
            place_types_1.SLUG_COLUMN_NAME,
            place_types_1.POSITION_NAMES_COLUMN_NAME,
        ])).join(',');
        return {
            select: (0, prisma_util_1.buildColumnSelect)(cols),
        };
    }
    makePlaceSelection(withRaces, placeSelectBase, raceInclude) {
        if (!placeSelectBase) {
            if (!withRaces)
                return true;
            return {
                include: {
                    Races: raceInclude,
                },
            };
        }
        const sel = { ...placeSelectBase };
        if (withRaces)
            sel.Races = raceInclude;
        return { select: sel };
    }
    dedupeRacesInTree(obj) {
        const { places, includeChildren, includeParent, includeRaces } = obj;
        if (!includeRaces)
            return;
        for (const place of places) {
            if (includeRaces && (0, place_types_1.hasRaces)(place)) {
                place.Races = (0, races_util_1.getDedupedRacesBySlug)(place.Races);
            }
            if (includeChildren && (0, place_types_1.hasChildren)(place)) {
                for (const child of place.children ?? []) {
                    if ((0, place_types_1.hasRaces)(child)) {
                        child.Races = (0, races_util_1.getDedupedRacesBySlug)(child.Races);
                    }
                }
            }
            else if (includeChildren && (0, place_types_1.hasPlaceCategories)(place)) {
                for (const district of place.districts ?? []) {
                    if ((0, place_types_1.hasRaces)(district)) {
                        district.Races = (0, races_util_1.getDedupedRacesBySlug)(district.Races);
                    }
                }
                for (const county of place.counties ?? []) {
                    if ((0, place_types_1.hasRaces)(county)) {
                        county.Races = (0, races_util_1.getDedupedRacesBySlug)(county.Races);
                    }
                }
                for (const other of place.counties ?? []) {
                    if ((0, place_types_1.hasRaces)(other)) {
                        other.Races = (0, races_util_1.getDedupedRacesBySlug)(other.Races);
                    }
                }
            }
            if (includeParent && (0, place_types_1.hasParent)(place) && (0, place_types_1.hasRaces)(place.parent)) {
                if ((0, place_types_1.hasRaces)(place.parent)) {
                    place.parent.Races = (0, races_util_1.getDedupedRacesBySlug)(place.parent.Races);
                }
            }
        }
    }
    async runQuery(where, placeSelectBase, placeQueryObj) {
        return placeSelectBase
            ? this.model.findMany({
                where,
                select: placeQueryObj,
            })
            : this.model.findMany({
                where,
                include: placeQueryObj,
            });
    }
};
exports.PlacesService = PlacesService;
exports.PlacesService = PlacesService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [])
], PlacesService);
//# sourceMappingURL=places.service.js.map