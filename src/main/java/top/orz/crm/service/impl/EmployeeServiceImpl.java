package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;
import top.orz.crm.dao.EmployeeMapper;
import top.orz.crm.service.EmployeeService;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public void addEmployee(Employee employee) {
        employeeMapper.addEmployee(employee);
    }

    @Override
    public List<Department> getDeptAll() {
        return employeeMapper.selectDeptAll();
    }

    @Override
    public List<Position> getPositionAll() {
        return employeeMapper.selectPositionAll();
    }

    @Override
    public List<Employee> getEmpAll() {
        return employeeMapper.selectEmpAll();
    }
}
