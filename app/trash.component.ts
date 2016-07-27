import { Component } from '@angular/core';
import { Disk } from './disk';
import { SizePipe } from './sizePipe';

@Component({
  selector: 'my-app',
  templateUrl: 'html/trash.html',
  pipes: [SizePipe]
})
export class TrashComponent {
    public disks: Disk[];

    public checkCount: number = 0;

    public clear() {
      this.disks = [];
    }

    public delete() {
      this.disks.splice(0, 1);
    }
}