import {Component, Input} from '@angular/core';
import {Directory} from './directory';

@Component({
    selector: 'tree-view',
    templateUrl: 'html/tree-view.html',
    directives: [TreeView]
})

export class TreeView {
    @Input() directories: Array<Directory>;
}