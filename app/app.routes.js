"use strict";
var router_1 = require('@angular/router');
var disk_component_1 = require('./disk.component');
var login_component_1 = require('./login.component');
var trash_component_1 = require('./trash.component');
/**
 * CLIENT ROUTES
 */
var routes = [
    {
        path: '',
        redirectTo: '/disk',
        terminal: true
    },
    { path: 'disk', component: disk_component_1.DiskComponent },
    { path: 'login', component: login_component_1.LoginComponent },
    { path: 'trash', component: trash_component_1.TrashComponent }
];
exports.APP_ROUTER_PROVIDERS = [
    router_1.provideRouter(routes)
];
//# sourceMappingURL=app.routes.js.map