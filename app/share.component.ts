import { Component, Input } from '@angular/core';
import { User } from './user';

@Component({
  selector: 'share-window',
  templateUrl: 'html/share.html'
})
export class ShareComponent {
  
  public Users: User[];

  public SelectUsers: User[];
  
}