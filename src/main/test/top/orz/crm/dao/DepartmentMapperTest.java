package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.Department;

import java.util.List;

import static org.junit.Assert.*;

public class DepartmentMapperTest extends BaseTest {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Test
    public void selectDepartments() {
        List<Department> departments = departmentMapper.selectDepartments(0, 10);
        for (Department department : departments) {
            System.out.println(department.getParent());
        }

    }
}