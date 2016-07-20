import { Component } from '@angular/core';
import { NgForm }    from '@angular/forms';

@Component({
  selector: 'my-app',
  templateUrl: 'html/login.html'
})
export class AppComponent {
    public Username:string;

    public UserError:string;

    public Password:string;

    public PasswordError:string;

    public Remember:boolean;

    public Login() {
        if (!this.Password) {
            this.PasswordError = "PASSWORD NOT EMPTY!";
        }
        if (!this.Username) {
            this.UserError = "USER NAME NOT EMPTY!";
        }
    }
}