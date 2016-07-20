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
        public Source: any,
        public Parent: Disk = new Disk(0, '全部文件')
    ) {
        
    }

    public Name:string;

    public Size:string;

    public Md5:string;

    public Status: UploadStatus = UploadStatus.NONE;

    public Progress: number;

    public GetMd5():boolean {
        this.Status = UploadStatus.CHECKING;

        
        this.Status = UploadStatus.CHECKED;
        return true;
    }

    public Upload():boolean {
        this.Status = UploadStatus.UPLOADING;


        this.Status = UploadStatus.SUCEESS;
        return true;
    }
}