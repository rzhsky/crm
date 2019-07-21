package top.orz.crm.dao;

import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;

import java.util.List;

@Repository
public interface EmployeeMapper {
    void addEmployee(Employee employee);

    Employee selectEmpById(Integer id);

    List<Department> selectDeptAll();

    List<Position> selectPositionAll();

    List<Employee> selectEmpAll();
}
