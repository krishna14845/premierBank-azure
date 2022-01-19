import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
@Component({
  selector: 'app-saving-account',
  templateUrl: './saving-account.component.html',
  styleUrls: ['./saving-account.component.css']
})
export class SavingAccountComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit(): void {
  }
  btnClick= function () {
    this.router.navigateByUrl('/create-employee');
};

}
