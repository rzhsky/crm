package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
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

    List<Employee> selectEmpAll(Integer start, Integer limit);

    Integer getEmpCount();

    void deleteEmp(Integer id, String deleteTime);

    void updateEmp(Employee employee);

    List<Employee> searchEmp(@Param("employee") Employee employee, @Param("start") Integer start, @Param("limit") Integer limit);

    Integer searchEmpCount(Employee employee);

    List<Employee> getEmployees();

    List<Employee> getEmpDel(int start, Integer limit);

    Integer getEmpDelCount();

    void restoreEmp(Integer id);

    void completeDelEmp(Integer id);
}
