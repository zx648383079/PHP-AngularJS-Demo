import { Component, Input } from '@angular/core';
import { TreeView } from './tree-view';
import { Directory } from './directory';

@Component({
  selector: 'folder-window',
  templateUrl: 'html/folder.html',
  directives: [TreeView]
})
export class FolderComponent {
  public directories: Array<Directory>;
}