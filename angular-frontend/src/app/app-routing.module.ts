import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeeListComponent } from './employee-list/employee-list.component';
import { CreateEmployeeComponent } from './create-employee/create-employee.component';
import { UpdateEmployeeComponent } from './update-employee/update-employee.component';
import { EmployeeDetailsComponent } from './employee-details/employee-details.component';
import { SavingAccountComponent } from './saving-account/saving-account.component';
import { CurrentAccountComponent } from './current-account/current-account.component';
import { HomeLoanComponent } from './home-loan/home-loan.component';
import { PersonalLoanComponent } from './personal-loan/personal-loan.component';
import { CarLoanComponent } from './car-loan/car-loan.component';
import { VisaCardComponent } from './visa-card/visa-card.component';
import { RupayCardComponent } from './rupay-card/rupay-card.component';
import { MasterCardComponent } from './master-card/master-card.component';
import { NetBankingComponent } from './net-banking/net-banking.component';
import { SuccessComponent } from './success/success.component';

const routes: Routes = [
  {path: 'employees', component: EmployeeListComponent},
  {path: 'saving-account', component: SavingAccountComponent},
  {path: 'current-account', component: CurrentAccountComponent},
  {path: 'create-employee', component: CreateEmployeeComponent},
  {path: 'home-loan', component: HomeLoanComponent},
  {path: 'personal-loan', component: PersonalLoanComponent},
  {path: 'car-loan', component: CarLoanComponent},
  {path: 'visa-card', component: VisaCardComponent},
  {path: 'rupay-card', component: RupayCardComponent},
  {path: 'master-card', component: MasterCardComponent},
  {path: '', redirectTo: 'employees', pathMatch: 'full'},
  {path: 'update-employee/:id', component: UpdateEmployeeComponent},
  {path: 'employee-details/:id', component: EmployeeDetailsComponent},
  {path:'net-banking',component:NetBankingComponent},
  {path:'saving-account/create-employee',component:CreateEmployeeComponent},
  {path:'success',component:SuccessComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
