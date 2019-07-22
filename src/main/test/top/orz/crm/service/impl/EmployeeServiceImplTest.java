package top.orz.crm.service.impl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.Employee;
import top.orz.crm.dao.BaseTest;
import top.orz.crm.service.EmployeeService;

import java.util.List;

import static org.junit.Assert.*;

public class EmployeeServiceImplTest extends BaseTest {

    @Autowired
    private EmployeeService employeeService;

    @Test
    public void searchEmp() {
        Employee employee = new Employee();
        employee.setPhone("18871015029");
        employee.setEmpname("");
        List<Employee> employees = employeeService.searchEmp(employee, 1, 10);
        for (Employee emp : employees) {
            System.out.println(emp);
        }
    }

    @Test
    public void searchEmpCount() {
    }
}