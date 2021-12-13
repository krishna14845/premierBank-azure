package net.javaguides.springboot;




import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;



import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;



import net.javaguides.springboot.controller.EmployeeController;
import net.javaguides.springboot.model.Employee;
import net.javaguides.springboot.repository.EmployeeRepository;




@SpringBootTest
class SpringbootBackendApplicationTests {

@Autowired
private EmployeeController service;
@Test
void contextLoads() {
	assertThat(service).isNull();
}
@Test
void contextLoads2() {
	assertThat(service).isNotNull();
}

@MockBean
private EmployeeRepository repository;
@Test
public void getAllEmployeesTest1()
{
when(repository.findAll()).thenReturn(Stream.of(new Employee(1,"Pranali","Sutar","Pranali14932@mastek.com","7028971909","Kolhapur","Current")).collect(Collectors.toList()));

assertEquals(1,service.getAllEmployees().size());
}

@Test
public void getAllEmployeesTest()
{
when(repository.findAll()).thenReturn(Stream.of(new Employee(1,"Pranali","Sutar","Pranali14932@mastek.com","7028971909","Kolhapur","Current")).collect(Collectors.toList()));

assertEquals(2,service.getAllEmployees().size());
}


 
@Test
 public void getEmployeeById() {
 Long id = (long) 1;
 ((Stream<Employee>) when(repository.getEmployeeById(id))
 .thenReturn((List<Employee>) Stream.of(new Employee(1,"Pranali","Sutar","Pranali14932@mastek.com","7028971909","Kolhapur","Current")))).collect(Collectors.toList());
 assertEquals(1, ((List<Employee>) service.getEmployeeById(id)).size());
 }

@Test
public void createEmployee() {
    Employee e1 = new Employee(1,"Pranali","Sutar","Pranali14932@mastek.com","7028971909","Kolhapur","Current");
when(repository.save(e1)).thenReturn(e1);
assertEquals(e1, service.createEmployee(e1));
}
//
// @Test
// public void deleteUserTest() {
// User user = new User(999, "Pranya", 33, "Pune");
// service.deleteUser(user);
// verify(repository, times(1)).delete(user);
// }
}