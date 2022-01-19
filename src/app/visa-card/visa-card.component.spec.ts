import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VisaCardComponent } from './visa-card.component';

describe('VisaCardComponent', () => {
  let component: VisaCardComponent;
  let fixture: ComponentFixture<VisaCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VisaCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VisaCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
