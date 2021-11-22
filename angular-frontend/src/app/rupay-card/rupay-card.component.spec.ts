import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RupayCardComponent } from './rupay-card.component';

describe('RupayCardComponent', () => {
  let component: RupayCardComponent;
  let fixture: ComponentFixture<RupayCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RupayCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RupayCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
