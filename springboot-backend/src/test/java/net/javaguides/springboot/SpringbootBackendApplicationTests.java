package net.javaguides.springboot;




import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;



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



@Test
void contextLoads() {
}



@Autowired
private EmployeeController service;

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


// @Test
// public void getUserbyAddressTest() {
// String address = "Bangalore";
// when(repository.findByAddress(address))
// .thenReturn(Stream.of(new User(376, "Danile", 31, "USA")).collect(Collectors.toList()));
// assertEquals(1, service.getUserbyAddress(address).size());
// }
//
// @Test
// public void saveUserTest() {
// User user = new User(999, "Pranya", 33, "Pune");
// when(repository.save(user)).thenReturn(user);
// assertEquals(user, service.addUser(user));
// }
//
// @Test
// public void deleteUserTest() {
// User user = new User(999, "Pranya", 33, "Pune");
// service.deleteUser(user);
// verify(repository, times(1)).delete(user);
// }
}