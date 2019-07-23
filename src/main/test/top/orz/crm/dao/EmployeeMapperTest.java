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
}