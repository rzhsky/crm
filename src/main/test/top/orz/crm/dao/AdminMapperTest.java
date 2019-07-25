package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.Employee;

public class AdminMapperTest extends BaseTest {
    @Autowired
    private AdminMapper adminMapper;

    @Test
    public void login() {
        Employee employee = new Employee();
        employee.setEmpname("123");
        employee.setPassword("666666");
        System.out.println(adminMapper.login(employee));

    }
}
