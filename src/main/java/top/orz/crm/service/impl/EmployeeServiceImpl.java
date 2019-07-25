package top.orz.crm.service.impl;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;
import top.orz.crm.dao.EmployeeMapper;
import top.orz.crm.service.EmployeeService;
import top.orz.crm.util.StringUtil;

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
    @Transactional
    public void deleteEmp(Integer id) {
        employeeMapper.updateDeptByEmpId(id);
        employeeMapper.deleteEmp(id, sdf.format(new Date()));
    }

    @Override
    @Transactional
    public void batchDeleteEmp(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            deleteEmp(Integer.valueOf(s));
        }
    }

    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateEmp(employee);
    }

    @Override
    public List<Employee> searchEmp(Employee employee, Integer page, Integer limit) {
        if (StringUtil.isChinese(employee.getEmpname()))
            return employeeMapper.searchEmp(employee, limit * (page - 1), limit);
        else{
            String name = StringUtil.getLimit(employee.getEmpname(), "%");
            employee.setEmpname(name);
            return employeeMapper.searchEmpByPinyin(employee, limit * (page - 1), limit);
        }
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
    @Transactional
    public void restoreEmp(Integer id) {
        employeeMapper.updateDeptIdByEmpId(id);
        employeeMapper.updatePositionIdByEmpId(id);
        employeeMapper.restoreEmp(id);
    }

    @Override
    public void completeDelEmp(Integer id) {
        employeeMapper.completeDelEmp(id);
    }

    @Override
    @Transactional
    public void batchRestoreEmp(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            restoreEmp(Integer.valueOf(s));
        }
    }

    @Override
    public void batchCompleteDelEmp(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            completeDelEmp(Integer.valueOf(s));
        }
    }
}
