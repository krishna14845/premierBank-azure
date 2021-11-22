import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http'
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmployeeListComponent } from './employee-list/employee-list.component';
import { CreateEmployeeComponent } from './create-employee/create-employee.component';
import { FormsModule} from '@angular/forms';
import { UpdateEmployeeComponent } from './update-employee/update-employee.component';
import { EmployeeDetailsComponent } from './employee-details/employee-details.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { SavingAccountComponent } from './saving-account/saving-account.component';
import { CurrentAccountComponent } from './current-account/current-account.component';
import { HomeLoanComponent } from './home-loan/home-loan.component';
import { CarLoanComponent } from './car-loan/car-loan.component';
import { PersonalLoanComponent } from './personal-loan/personal-loan.component';
import { RupayCardComponent } from './rupay-card/rupay-card.component';
import { VisaCardComponent } from './visa-card/visa-card.component';
import { MasterCardComponent } from './master-card/master-card.component';



@NgModule({
  declarations: [
    AppComponent,
    EmployeeListComponent,
    CreateEmployeeComponent,
    UpdateEmployeeComponent,
    EmployeeDetailsComponent,
    SavingAccountComponent,
    CurrentAccountComponent,
    HomeLoanComponent,
    CarLoanComponent,
    PersonalLoanComponent,
    RupayCardComponent,
    VisaCardComponent,
    MasterCardComponent

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    NgbModule

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
