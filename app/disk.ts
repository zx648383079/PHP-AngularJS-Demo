export enum FileType {
    DIR,
    FILE
}
export class Disk {

    public constructor(
        public id:number,
        public name: string,
        public parent: number = 0,
        public type: FileType = FileType.DIR,
        
        public md5: string = null,
        public size: number = 0,
        public location: string = null,
        update: number|Date = 0
    ) {
        this.updateTime = update instanceof Date ? update : new Date(update);
    }

    public checked: boolean = false;

    public updateTime: Date;
}