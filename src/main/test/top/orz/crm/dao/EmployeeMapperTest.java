package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.*;

import java.util.List;

import static org.junit.Assert.*;

public class EmployeeMapperTest extends BaseTest {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private ContractMapper contractMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Test
    public void addEmployee() {
        Employee employee = new Employee("11", 1, "18871015029", "wqwq", "12@qq.com", 1, 1);
        employeeMapper.addEmployee(employee);
    }

    @Test
    public void selectEmpById() {
        Employee employee = employeeMapper.selectEmpById(1);
        System.out.println(employee);
    }

    @Test
    public void selectDeptAll() {
        List<Department> departments = employeeMapper.selectDeptAll();
        for (Department department : departments) {
            System.out.println(department);
        }
    }

    @Test
    public void getEmpCount() {
        int employee = employeeMapper.getEmpCount();
        System.out.println(employee);
    }

    @Test
    public void getEmp() {
        Employee employee = new Employee();
        employee.setPhone("18871015029");
        List<Employee> employees = employeeMapper.searchEmp(employee, 0, 10);
        for (Employee emp : employees) {
            System.out.println(emp);
        }

        Integer integer = employeeMapper.searchEmpCount(employee);
        System.out.println(integer);
    }

    @Test
    public void getEmpCount1() {
        Contract contract = new Contract();

        Customer customer = new Customer();
        customer.setName("张三");

        Employee employee = new Employee();
        contract.setCustomer(customer);
        contract.setEmployee(employee);
        List<Contract> contracts = contractMapper.searchContract(contract, 0, 10);
        for (int i = 0; i < contracts.size(); i++) {
            System.out.println(contracts.get(i));
        }

        Integer integer = contractMapper.searchConCount(contract);
        System.out.println(integer);
    }

    @Test
    public void getEmpCount2() {
        Orders order = new Orders();
        Contract contract = new Contract();
        contract.setName("水果商城");
        order.setOrdernumber(33);
        order.setContract(contract);

        List<Orders> orders = orderMapper.searchOrder(order, 0, 10);
        for (int i = 0; i < orders.size(); i++) {
            System.out.println(orders.get(i));
        }

        Integer integer = orderMapper.searchOrdCount(order);
        System.out.println(integer);

    }
}