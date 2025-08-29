"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.flip = flip;
function flip(obj) {
    const ret = {};
    Object.keys(obj).forEach((key) => {
        ret[obj[key]] = key;
    });
    return ret;
}
//# sourceMappingURL=objects.util.js.map