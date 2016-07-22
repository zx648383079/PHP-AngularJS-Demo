"use strict";
var disk_1 = require('./disk');
(function (UploadStatus) {
    UploadStatus[UploadStatus["NONE"] = 0] = "NONE";
    UploadStatus[UploadStatus["WAITING"] = 1] = "WAITING";
    UploadStatus[UploadStatus["CHECKING"] = 2] = "CHECKING";
    UploadStatus[UploadStatus["CHECKED"] = 3] = "CHECKED";
    UploadStatus[UploadStatus["UPLOADING"] = 4] = "UPLOADING";
    UploadStatus[UploadStatus["SUCEESS"] = 5] = "SUCEESS";
    UploadStatus[UploadStatus["FASTSUCEESS"] = 6] = "FASTSUCEESS";
    UploadStatus[UploadStatus["FAILURE"] = 7] = "FAILURE";
})(exports.UploadStatus || (exports.UploadStatus = {}));
var UploadStatus = exports.UploadStatus;
var UploadFile = (function () {
    function UploadFile(source, parent) {
        if (parent === void 0) { parent = new disk_1.Disk(0, '全部文件'); }
        this.source = source;
        this.parent = parent;
        this.status = UploadStatus.NONE;
    }
    UploadFile.prototype.getMd5 = function () {
        this.status = UploadStatus.CHECKING;
        this.status = UploadStatus.CHECKED;
        return true;
    };
    UploadFile.prototype.upload = function () {
        this.status = UploadStatus.UPLOADING;
        this.status = UploadStatus.SUCEESS;
        return true;
    };
    return UploadFile;
}());
exports.UploadFile = UploadFile;
//# sourceMappingURL=uploadFile.js.map