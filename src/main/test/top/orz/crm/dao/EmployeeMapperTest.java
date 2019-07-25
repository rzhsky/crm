package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;

import java.util.List;

import static org.junit.Assert.*;

public class EmployeeMapperTest extends BaseTest {

    @Autowired
    private EmployeeMapper employeeMapper;

  /*  @Test
    public void addEmployee() {
        Employee employee = new Employee("11", 1, "18871015029", "wqwq", "12@qq.com", 1, 1);
        employeeMapper.addEmployee(employee);
    }*/

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
        for (Employee emp : employees){
            System.out.println(emp);
        }

        Integer integer = employeeMapper.searchEmpCount(employee);
        System.out.println(integer);
    }

    @Test
    public void getEmpDel() {
        List<Employee> employees = employeeMapper.getEmpDel(0, 10);
        for (Employee emp : employees){
            System.out.println(emp);
        }

    }

}