/// <reference path="../typings/jquery/jquery.d.ts" />
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
var folder_component_1 = require('./folder.component');
var share_component_1 = require('./share.component');
var sizePipe_1 = require('./sizePipe');
var sorter_1 = require('./sorter');
var DiskComponent = (function () {
    function DiskComponent() {
        this.isList = true;
        this.checkCount = 0;
        this.sorter = new sorter_1.Sorter();
        this.crumbs = [new disk_1.Disk(0, "全部文件")];
        this.createTitle = '新增文件夹';
        this.file = new disk_1.Disk(0, null);
        //this.category = params.get('category');
        this.refresh();
    }
    DiskComponent.prototype.toggle = function () {
        this.isList = !this.isList;
    };
    DiskComponent.prototype.getParent = function () {
        return this.crumbs[this.crumbs.length - 1];
    };
    DiskComponent.prototype.showCreate = function () {
        this.file = new disk_1.Disk(this.getParent().id, null);
        this.createTitle = '新增文件夹';
        $("#createModal").modal("show");
    };
    DiskComponent.prototype.createSave = function () {
        if (!this.file.name) {
            return;
        }
        if (this.createTitle == '新增文件夹') {
            this.disks.push(this.file);
        }
        $("#createModal").modal("hide");
    };
    DiskComponent.prototype.sort = function (key) {
        this.sorter.sort(key, this.disks);
    };
    DiskComponent.prototype.refresh = function () {
        this.disks = [
            new disk_1.Disk(1, '22222'),
            new disk_1.Disk(2, '2255'),
            new disk_1.Disk(3, '2hhhh'),
            new disk_1.Disk(4, '2222nnnn2'),
            new disk_1.Disk(5, '22kkkkkkkkkk'),
        ];
    };
    DiskComponent.prototype.copy = function (item) {
    };
    DiskComponent.prototype.share = function (item) {
    };
    DiskComponent.prototype.delete = function (index) {
        if (index != undefined) {
            if (this.disks[index].checked) {
                this.checkCount--;
            }
            this.disks.splice(index, 1);
            return;
        }
        if (this.checkCount == 0) {
            return;
        }
        for (var i = this.disks.length - 1; i >= 0; i--) {
            if (this.disks[i].checked) {
                this.disks.splice(i, 1);
            }
        }
        this.checkCount = 0;
    };
    DiskComponent.prototype.rename = function (item) {
        if (!item) {
            for (var index = this.disks.length - 1; index > 0; index--) {
                if (this.disks[index].checked) {
                    item = this.disks[index];
                    break;
                }
            }
        }
        if (!item) {
            return;
        }
        this.createTitle = '文件重命名';
        this.file = item;
        $("#createModal").modal("show");
    };
    DiskComponent.prototype.checkAll = function () {
        if (this.disks.length <= 0) {
            return;
        }
        var checked = true;
        if (this.checkCount >= this.disks.length) {
            this.checkCount = 0;
            checked = false;
        }
        else {
            this.checkCount = this.disks.length;
        }
        this.disks.forEach(function (item) {
            item.checked = checked;
        });
    };
    DiskComponent.prototype.check = function (item) {
        item.checked = !item.checked;
        if (item.checked) {
            this.checkCount++;
        }
        else {
            this.checkCount--;
        }
    };
    DiskComponent = __decorate([
        core_1.Component({
            selector: 'my-app',
            templateUrl: 'html/disk.html',
            pipes: [sizePipe_1.SizePipe],
            directives: [router_1.ROUTER_DIRECTIVES, upload_component_1.UploadComponent, folder_component_1.FolderComponent, share_component_1.ShareComponent]
        }), 
        __metadata('design:paramtypes', [])
    ], DiskComponent);
    return DiskComponent;
}());
exports.DiskComponent = DiskComponent;
//# sourceMappingURL=disk.component.js.map