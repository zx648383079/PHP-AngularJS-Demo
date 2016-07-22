"use strict";
var Directory = (function () {
    function Directory(id, name, directories) {
        this.id = id;
        this.name = name;
        this.directories = directories;
        this.checked = false;
        this.expanded = true;
    }
    Directory.prototype.toggle = function () {
        this.expanded = !this.expanded;
    };
    return Directory;
}());
exports.Directory = Directory;
//# sourceMappingURL=directory.js.map