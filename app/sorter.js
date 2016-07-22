"use strict";
var Sorter = (function () {
    function Sorter() {
        this.direction = 1;
    }
    Sorter.prototype.sort = function (key, data) {
        var _this = this;
        if (this.key === key) {
            this.direction = -this.direction;
        }
        else {
            this.direction = 1;
        }
        this.key = key;
        data.sort(function (a, b) {
            if (a[key] === b[key]) {
                return 0;
            }
            if (a[key] > b[key]) {
                return _this.direction;
            }
            return -_this.direction;
        });
    };
    return Sorter;
}());
exports.Sorter = Sorter;
//# sourceMappingURL=sorter.js.map