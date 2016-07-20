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
var core_1 = require('@angular/core');
/**
 * SIZE PIPE,
 * DISK SIZE TRANSFORM, DEFAULT: 1KB = 1000 B;
 */
var SizePipe = (function () {
    function SizePipe() {
    }
    SizePipe.prototype.transform = function (value) {
        if (value <= 0) {
            return "--";
        }
        var k = 1000, // or 1024
        sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'], i = Math.floor(Math.log(value) / Math.log(k));
        return (value / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
    };
    SizePipe = __decorate([
        core_1.Pipe({ name: 'size' }), 
        __metadata('design:paramtypes', [])
    ], SizePipe);
    return SizePipe;
}());
exports.SizePipe = SizePipe;
//# sourceMappingURL=sizePipe.js.map