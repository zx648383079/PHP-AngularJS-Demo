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
    function UploadFile(Source, Parent) {
        if (Parent === void 0) { Parent = new disk_1.Disk(0, '全部文件'); }
        this.Source = Source;
        this.Parent = Parent;
        this.Status = UploadStatus.NONE;
    }
    UploadFile.prototype.GetMd5 = function () {
        this.Status = UploadStatus.CHECKING;
        this.Status = UploadStatus.CHECKED;
        return true;
    };
    UploadFile.prototype.Upload = function () {
        this.Status = UploadStatus.UPLOADING;
        this.Status = UploadStatus.SUCEESS;
        return true;
    };
    return UploadFile;
}());
exports.UploadFile = UploadFile;
//# sourceMappingURL=uploadFile.js.map