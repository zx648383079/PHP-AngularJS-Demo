export enum FileType {
    DIR,
    FILE
}
export class Disk {

    public constructor(
        public Id:number,
        public Name: string,
        public Parent: number = 0,
        public Type: FileType = FileType.DIR,
        
        public Md5: string = null,
        public Size: number = 0,
        public Location: string = null,
        updateTime: number|Date = 0
    ) {
        this.UpdateTime = updateTime instanceof Date ? updateTime : new Date(updateTime);
    }

    public Checked: boolean = false;

    public UpdateTime: Date;
}