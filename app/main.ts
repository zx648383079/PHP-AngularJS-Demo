import { bootstrap }    from '@angular/platform-browser-dynamic';
import {HTTP_PROVIDERS} from '@angular/http';
import { AppComponent } from './app.component';
import { APP_ROUTER_PROVIDERS } from './app.routes';
import {HashLocationStrategy, LocationStrategy} from '@angular/common';

bootstrap(AppComponent, [
          APP_ROUTER_PROVIDERS,
          {provide: LocationStrategy, useClass: HashLocationStrategy},
          HTTP_PROVIDERS]).catch(err => console.error(err));