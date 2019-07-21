package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;
import top.orz.crm.service.EmployeeService;

import java.util.List;

@RestController
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/emp")
    public String addEmployee(Employee employee) {
        try {
            employeeService.addEmployee(employee);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @RequestMapping(value = "/dept/all")
    public List<Department> getDeptAll() {
        return employeeService.getDeptAll();
    }

    @RequestMapping(value = "/position/all")
    public List<Position> getPositionAll() {
        return employeeService.getPositionAll();
    }

    @RequestMapping(value = "/emp/all")
    public List<Employee> getEmpAll() {
        return employeeService.getEmpAll();
    }
}
