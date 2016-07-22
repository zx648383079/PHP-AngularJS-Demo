import { Component } from '@angular/core';
import { ROUTER_DIRECTIVES } from '@angular/router';
import { Disk } from './disk';
import { UploadComponent } from './upload.component';
import { CreateComponent } from './create.component';
import { FolderComponent } from './folder.component';
import { ShareComponent } from './share.component';
import { SizePipe } from './sizePipe';
import { Sorter } from './sorter';

@Component({
  selector: 'my-app',
  templateUrl: 'html/main.html',
  pipes: [SizePipe],
  directives: [ROUTER_DIRECTIVES, UploadComponent, CreateComponent, FolderComponent, ShareComponent]
})
export class AppComponent {

  constructor() {
    this.refresh();
  }

  public isList: boolean = true;

  public toggle() {
    this.isList = !this.isList;
  }

  public checkCount: number = 0;

  public disks: Disk[];

  public sorter: Sorter = new Sorter();

  public crumbs: Disk[] = [new Disk(0, "全部文件")];

  public sort(key: string) {
    this.sorter.sort(key, this.disks);
  }

  public refresh() {
    this.disks = [
      new Disk(1, '22222'),
      new Disk(2, '2255'),
      new Disk(3, '2hhhh'),
      new Disk(4, '2222nnnn2'),
      new Disk(5, '22kkkkkkkkkk'),
    ];
  }
  
}