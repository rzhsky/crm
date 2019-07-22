package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;
import top.orz.crm.service.EmployeeService;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, Object> getEmpAll(@RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();
        List<Employee> empAll = employeeService.getEmpAll(page, limit);
        Integer empCount = employeeService.getEmpCount();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", empCount);
        map.put("data", empAll);

        return map;
    }

    @PutMapping(value = "/emp/{id}")
    public String deleteEmp(@PathVariable Integer id) {

        System.out.println(id);
        try {
            employeeService.deleteEmp(id, new Date());
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping(value = "/emp/batchdel")
    public String batchDeleteEmp(@RequestParam String ids) {

        String[] split = ids.split(",");

        try {
            for (String s : split) {
                employeeService.deleteEmp(Integer.valueOf(s), new Date());
            }
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @PutMapping(value = "/emp")
    public String updateEmp(@RequestBody Employee employee) {
        System.out.println("修改的员工信息" + employee);
        try {
            employeeService.updateEmp(employee);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @GetMapping(value = "/emp/search")
    public Map<String, Object> searchEmp(@RequestParam String empname, @RequestParam String phone, @RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();

        System.out.println(empname);
        System.out.println(phone);
        System.out.println(page);
        System.out.println(limit);
        Employee employee = new Employee();
        employee.setEmpname(empname);
        employee.setPhone(phone);

        List<Employee> employees = employeeService.searchEmp(employee, page, limit);
        for (Employee emp : employees) {
            System.out.println(emp);
        }
        Integer searchEmpCount = employeeService.searchEmpCount(employee);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", searchEmpCount);
        map.put("data", employees);
        return map;
    }
}
