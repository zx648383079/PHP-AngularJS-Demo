import { provideRouter, RouterConfig } from '@angular/router';
import { DiskComponent } from './disk.component';
import { LoginComponent }    from './login.component';
import { TrashComponent } from './trash.component';

/**
 * CLIENT ROUTES
 */
const routes: RouterConfig = [
  {
    path: '',
    redirectTo: '/disk',
    terminal: true
  },
  { path: 'disk', component: DiskComponent},
  { path: 'login', component: LoginComponent },
  { path: 'trash', component: TrashComponent }
];

export const APP_ROUTER_PROVIDERS = [
  provideRouter(routes)
];