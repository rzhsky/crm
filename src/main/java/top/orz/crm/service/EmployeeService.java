package top.orz.crm.service;

import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;

import java.util.Date;
import java.util.List;

public interface EmployeeService {
    void addEmployee(Employee employee);

    List<Department> getDeptAll();

    List<Position> getPositionAll();

    List<Employee> getEmpAll(Integer page, Integer limit);

    Integer getEmpCount();

    void deleteEmp(Integer id, Date deleteTime);

    void updateEmp(Employee employee);

    List<Employee> searchEmp(Employee employee, Integer page, Integer limit);

    Integer searchEmpCount(Employee employee);
}
