import { provideRouter, RouterConfig } from '@angular/router';
import { AppComponent } from './app.component';
import { LoginComponent }    from './login.component';
import { TrashComponent } from './trash.component';

/**
 * CLIENT ROUTES
 */
const routes: RouterConfig = [
  { path: '', component: AppComponent},
  { path: 'login', component: LoginComponent },
  { path: 'trash', component: TrashComponent }
];

export const APP_ROUTER_PROVIDERS = [
  provideRouter(routes)
];