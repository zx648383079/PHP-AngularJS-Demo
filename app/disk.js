"use strict";
(function (FileType) {
    FileType[FileType["DIR"] = 0] = "DIR";
    FileType[FileType["FILE"] = 1] = "FILE";
})(exports.FileType || (exports.FileType = {}));
var FileType = exports.FileType;
var Disk = (function () {
    function Disk(Id, Name, Parent, Type, Md5, Size, Location, updateTime) {
        if (Parent === void 0) { Parent = 0; }
        if (Type === void 0) { Type = FileType.DIR; }
        if (Md5 === void 0) { Md5 = null; }
        if (Size === void 0) { Size = 0; }
        if (Location === void 0) { Location = null; }
        if (updateTime === void 0) { updateTime = 0; }
        this.Id = Id;
        this.Name = Name;
        this.Parent = Parent;
        this.Type = Type;
        this.Md5 = Md5;
        this.Size = Size;
        this.Location = Location;
        this.Checked = false;
        this.UpdateTime = updateTime instanceof Date ? updateTime : new Date(updateTime);
    }
    return Disk;
}());
exports.Disk = Disk;
//# sourceMappingURL=disk.js.map