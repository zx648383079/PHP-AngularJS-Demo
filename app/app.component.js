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
var router_1 = require('@angular/router');
var disk_1 = require('./disk');
var upload_component_1 = require('./upload.component');
var create_component_1 = require('./create.component');
var folder_component_1 = require('./folder.component');
var share_component_1 = require('./share.component');
var sizePipe_1 = require('./sizePipe');
var sorter_1 = require('./sorter');
var AppComponent = (function () {
    function AppComponent() {
        this.isList = true;
        this.checkCount = 0;
        this.sorter = new sorter_1.Sorter();
        this.crumbs = [new disk_1.Disk(0, "全部文件")];
        this.refresh();
    }
    AppComponent.prototype.toggle = function () {
        this.isList = !this.isList;
    };
    AppComponent.prototype.sort = function (key) {
        this.sorter.sort(key, this.disks);
    };
    AppComponent.prototype.refresh = function () {
        this.disks = [
            new disk_1.Disk(1, '22222'),
            new disk_1.Disk(2, '2255'),
            new disk_1.Disk(3, '2hhhh'),
            new disk_1.Disk(4, '2222nnnn2'),
            new disk_1.Disk(5, '22kkkkkkkkkk'),
        ];
    };
    AppComponent = __decorate([
        core_1.Component({
            selector: 'my-app',
            templateUrl: 'html/main.html',
            pipes: [sizePipe_1.SizePipe],
            directives: [router_1.ROUTER_DIRECTIVES, upload_component_1.UploadComponent, create_component_1.CreateComponent, folder_component_1.FolderComponent, share_component_1.ShareComponent]
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
//# sourceMappingURL=app.component.js.map