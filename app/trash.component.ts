import { Component } from '@angular/core';
import { Disk } from './disk';

@Component({
  selector: 'my-app',
  templateUrl: 'html/trash.html'
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