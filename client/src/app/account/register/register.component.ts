import { Component } from '@angular/core';
import { AbstractControl, AsyncValidatorFn, FormBuilder, ValidationErrors, Validators } from '@angular/forms';
import { Observable, debounceTime, finalize, map, of, switchMap, take } from 'rxjs';
import { AccountService } from '../account.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {
  errors: string[] | null = null;

  constructor(private fb: FormBuilder, private accountService: AccountService, private router: Router,private toastr: ToastrService) {}

  
  complexPassword = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"

  registerForm = this.fb.group({
    displayName: ['', Validators.required],
    email: ['', [Validators.required, Validators.email], [this.validateEmailNotTaken()]],
    phoneNumber: ['', [Validators.required], [this.validatePhoneNumer()]],
    password: ['', [Validators.required,  Validators.pattern(this.complexPassword)]],
    confirmPassword: ['', [Validators.required], [this.validatePasswordMatch()]]
  })  

  onSubmit() {
    this.accountService.register(this.registerForm.value).subscribe({
      next: () => {
        this.toastr.success('Registration Successful');
        this.router.navigateByUrl('/')
      },
      error: error => this.errors = error.errors
    })
  }

  validatePhoneNumer(): AsyncValidatorFn{
    return  (control: AbstractControl): Observable<ValidationErrors | null> => {
      const phoneNumber = control.value;
      const cleanedPhoneNumber = phoneNumber.replace(/\D/g, '');
      if (cleanedPhoneNumber.length !== 10){
        return of({numberLength : true});
      }
      return of(null);
    }
  }

  validatePasswordMatch(): AsyncValidatorFn{
    return  (control: AbstractControl): Observable<ValidationErrors | null> => {
      const password = control.root.get('password')?.value;
      const confirmPassword = control.root.get('confirmPassword')?.value;
      if(password !== confirmPassword){
        return of({passwordMatch: true});
      }
      return of(null);
    }
  }

  validateEmailNotTaken(): AsyncValidatorFn {
    return (control: AbstractControl) => {
      return control.valueChanges.pipe(
        debounceTime(1000),
        take(1),
        switchMap(() => {
          return this.accountService.checkEmailExists(control.value).pipe(
            map(result => result ? {emailExists: true} : null),
            finalize(() => control.markAsTouched())
          )
        })
      )

    }
  }
}