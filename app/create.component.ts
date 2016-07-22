import { Component, EventEmitter, Input, Output} from '@angular/core';
import { Disk } from './disk';

@Component({
  selector: 'create-window',
  templateUrl: 'html/create.html'
})
export class CreateComponent {

   @Output() save = new EventEmitter();

  public file:Disk = new Disk(0, null);

  public title:string = '新建文件夹';

  public onSave() {

  }
}