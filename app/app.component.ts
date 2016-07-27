/// <reference path="../typings/jquery/jquery.d.ts" />

import { Component } from '@angular/core';
import { ROUTER_DIRECTIVES } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'my-app',
  templateUrl: 'html/app.html',
  directives: [ROUTER_DIRECTIVES]
})
export class AppComponent {
    constructor(
      public location: Location
      ) {

    }

    getLinkStyle(path) {

        if(path === this.location.path()){
            return true;
        }
        else if(path.length > 0){
            return this.location.path().indexOf(path) > -1;
        }
    }
}