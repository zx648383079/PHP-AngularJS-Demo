import { Component } from '@angular/core';
import { Disk } from './disk';
import { UploadComponent } from './upload.component';
import { CreateComponent } from './create.component';
import { FolderComponent } from './folder.component';
import { ShareComponent } from './share.component';
import { SizePipe } from './sizePipe';

@Component({
  selector: 'my-app',
  templateUrl: 'html/main.html',
  pipes: [SizePipe],
  directives: [UploadComponent, CreateComponent, FolderComponent, ShareComponent]
})
export class AppComponent {

  constructor() {
    this.Disks = [
      new Disk(1, '22222'),
      new Disk(2, '2255'),
      new Disk(3, '2hhhh'),
      new Disk(4, '2222nnnn2'),
      new Disk(5, '22kkkkkkkkkk'),
    ];
  }

  public IsList: boolean = true;

  public CheckCount: number = 0;

  public Disks: Disk[];

  public Crumbs: Disk[] = [new Disk(0, "全部文件")];

  public Refresh() {

  }
  
}