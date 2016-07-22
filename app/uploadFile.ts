import { Disk } from './disk';
export enum UploadStatus {
    NONE,
    WAITING,
    CHECKING,
    CHECKED,
    UPLOADING,
    SUCEESS,
    FASTSUCEESS,
    FAILURE
}

export class UploadFile {
    constructor(
        public source: any,
        public parent: Disk = new Disk(0, '全部文件')
    ) {
        
    }

    public name:string;

    public size:string;

    public md5:string;

    public status: UploadStatus = UploadStatus.NONE;

    public progress: number;

    public getMd5():boolean {
        this.status = UploadStatus.CHECKING;

        
        this.status = UploadStatus.CHECKED;
        return true;
    }

    public upload():boolean {
        this.status = UploadStatus.UPLOADING;


        this.status = UploadStatus.SUCEESS;
        return true;
    }
}