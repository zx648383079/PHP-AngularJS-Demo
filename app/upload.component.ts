import { Component, Input } from '@angular/core';
import { UploadFile } from './uploadFile';

@Component({
  selector: 'upload-window',
  templateUrl: 'html/upload.html'
})
export class UploadComponent {
  
  public UploadFiles: UploadFile[];

  public UploadTitle:string = "上传文件";
  
}