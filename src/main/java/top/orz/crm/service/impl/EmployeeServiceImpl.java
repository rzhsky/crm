package top.orz.crm.service.impl;
import	java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;
import top.orz.crm.dao.EmployeeMapper;
import top.orz.crm.service.EmployeeService;

import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

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
    public List<Employee> getEmpAll(Integer page, Integer limit) {
        return employeeMapper.selectEmpAll(limit * (page - 1), limit);
    }

    @Override
    public Integer getEmpCount() {
        return employeeMapper.getEmpCount();
    }

    @Override
    public void deleteEmp(Integer id) {
        employeeMapper.deleteEmp(id, sdf.format(new Date()));
    }

    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateEmp(employee);
    }

    @Override
    public List<Employee> searchEmp(Employee employee, Integer page, Integer limit) {
        return employeeMapper.searchEmp(employee, limit * (page - 1), limit);
    }

    @Override
    public Integer searchEmpCount(Employee employee) {
        return employeeMapper.searchEmpCount(employee);
    }

    @Override
    public List<Employee> getEmployees() {
        return employeeMapper.getEmployees();
    }

    @Override
    public List<Employee> getEmpDel(Integer page, Integer limit) {
        return employeeMapper.getEmpDel(limit * (page - 1), limit);
    }

    @Override
    public Integer getEmpDelCount() {
        return employeeMapper.getEmpDelCount();
    }

    @Override
    public void restoreEmp(Integer id) {
        employeeMapper.restoreEmp(id);
    }

    @Override
    public void completeDelEmp(Integer id) {
        employeeMapper.completeDelEmp(id);
    }

    @Override
    public void batchDeleteEmp(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            employeeMapper.deleteEmp(Integer.valueOf(s), sdf.format(new Date()));
        }
    }

    @Override
    public void batchRestoreEmp(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            employeeMapper.restoreEmp(Integer.valueOf(s));
        }
    }

    @Override
    public void batchCompleteDelEmp(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            employeeMapper.completeDelEmp(Integer.valueOf(s));
        }
    }
}
