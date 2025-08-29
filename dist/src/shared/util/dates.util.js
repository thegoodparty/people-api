"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getStartOfTwoYearsFromNow = void 0;
const getStartOfTwoYearsFromNow = () => {
    const startOfTwoYearsFromNow = new Date();
    startOfTwoYearsFromNow.setFullYear(startOfTwoYearsFromNow.getFullYear() + 2);
    startOfTwoYearsFromNow.setMonth(0);
    startOfTwoYearsFromNow.setDate(1);
    return startOfTwoYearsFromNow;
};
exports.getStartOfTwoYearsFromNow = getStartOfTwoYearsFromNow;
//# sourceMappingURL=dates.util.js.map