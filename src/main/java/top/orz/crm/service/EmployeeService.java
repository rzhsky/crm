package top.orz.crm.service;

import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;

import java.util.List;

public interface EmployeeService {
    void addEmployee(Employee employee);

    List<Department> getDeptAll();

    List<Position> getPositionAll();

    List<Employee> getEmpAll();
}
