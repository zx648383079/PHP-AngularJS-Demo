"use strict";
(function (FileType) {
    FileType[FileType["DIR"] = 0] = "DIR";
    FileType[FileType["FILE"] = 1] = "FILE";
})(exports.FileType || (exports.FileType = {}));
var FileType = exports.FileType;
var Disk = (function () {
    function Disk(id, name, parent, type, md5, size, location, update) {
        if (parent === void 0) { parent = 0; }
        if (type === void 0) { type = FileType.DIR; }
        if (md5 === void 0) { md5 = null; }
        if (size === void 0) { size = 0; }
        if (location === void 0) { location = null; }
        if (update === void 0) { update = 0; }
        this.id = id;
        this.name = name;
        this.parent = parent;
        this.type = type;
        this.md5 = md5;
        this.size = size;
        this.location = location;
        this.checked = false;
        this.updateTime = update instanceof Date ? update : new Date(update);
    }
    return Disk;
}());
exports.Disk = Disk;
//# sourceMappingURL=disk.js.map