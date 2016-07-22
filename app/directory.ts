export class Directory {

    constructor(
        public id: number,
        public name:string,
        public directories: Array<Directory>
    ) {

    }

    public checked: boolean = false;

    public expanded: boolean = true;

    public toggle() {
        this.expanded = !this.expanded;
    }

}