import { Component } from '@angular/core';
import { NgForm }    from '@angular/forms';

@Component({
  selector: 'my-app',
  templateUrl: 'html/login.html'
})
export class LoginComponent {
    public username:string;

    public userError:string;

    public password:string;

    public passwordError:string;

    public remember:boolean;

    public login() {
        if (!this.password) {
            this.passwordError = "PASSWORD NOT EMPTY!";
        }
        if (!this.username) {
            this.userError = "USER NAME NOT EMPTY!";
        }
    }
}