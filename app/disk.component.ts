/// <reference path="../typings/jquery/jquery.d.ts" />

import { Component } from '@angular/core';
import { ROUTER_DIRECTIVES } from '@angular/router';
import { Disk } from './disk';
import { UploadComponent } from './upload.component';
import { FolderComponent } from './folder.component';
import { ShareComponent } from './share.component';
import { SizePipe } from './sizePipe';
import { Sorter } from './sorter';

@Component({
  selector: 'my-app',
  templateUrl: 'html/disk.html',
  pipes: [SizePipe],
  directives: [ROUTER_DIRECTIVES, UploadComponent, FolderComponent, ShareComponent]
})
export class DiskComponent {

  constructor(){
      //this.category = params.get('category');
      this.refresh();
  }

  public category: number;

  public isList: boolean = true;

  public checkCount: number = 0;

  public disks: Disk[];

  public sorter: Sorter = new Sorter();

  public crumbs: Disk[] = [new Disk(0, "全部文件")];

  public createTitle:string = '新增文件夹';

  public file: Disk = new Disk(0, null);

  public toggle() {
    this.isList = !this.isList;
  }

  public getParent(): Disk {
    return this.crumbs[this.crumbs.length - 1];
  }

  public showCreate() {
     this.file = new Disk(this.getParent().id, null);
    this.createTitle = '新增文件夹';
    $("#createModal").modal("show");
  }

  public createSave() {
    if (!this.file.name) {
      return ;
    }
    if (this.createTitle == '新增文件夹') {
      this.disks.push(this.file);
    }
    $("#createModal").modal("hide");
  }

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

  public copy(item?: Disk) {

  }

  public share(item?: Disk) {

  }

  public delete(index?: number) {
    if (index != undefined) {
      if (this.disks[index].checked) {
        this.checkCount --;
      }
      this.disks.splice(index, 1);
      return;
    }
    if (this.checkCount == 0) {
      return;
    }
    for (let i = this.disks.length - 1; i >= 0; i--) {
      if (this.disks[i].checked) {
        this.disks.splice(i, 1);
      }
    }
    this.checkCount = 0;
  }

  public rename(item?: Disk) {
    if (!item) {
      for (let index = this.disks.length - 1; index > 0; index--) {
        if (this.disks[index].checked) {
          item = this.disks[index];
          break;
        }
      }
    }
    if (!item) {
      return;
    }
    this.createTitle = '文件重命名';
    this.file = item;
    $("#createModal").modal("show");
  }

  public checkAll() {
    if (this.disks.length <= 0) {
      return;
    }
    let checked = true;
    if (this.checkCount >= this.disks.length) {
      this.checkCount = 0;
      checked = false;
    } else {
      this.checkCount = this.disks.length;
    }
    this.disks.forEach(item => {
      item.checked = checked;
    });
  }

  public check(item: Disk) {
    item.checked = !item.checked;
    if (item.checked) {
      this.checkCount ++;
    } else {
      this.checkCount --;
    }
  }
  
}