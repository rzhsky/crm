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

    @PostMapping(value = "/emp")
    public String addEmployee(Employee employee) {
        try {
            employeeService.addEmployee(employee);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @GetMapping(value = "/emp")
    public List<Employee> getEmployees(Employee employee) {
        return employeeService.getEmployees();
    }

    @GetMapping(value = "/dept/all")
    public List<Department> getDeptAll() {
        return employeeService.getDeptAll();
    }

    @GetMapping(value = "/position/all")
    public List<Position> getPositionAll() {
        return employeeService.getPositionAll();
    }

    @GetMapping(value = "/emp/all")
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

    @GetMapping(value = "/emp/del")
    public Map<String, Object> getEmpDel(@RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();
        List<Employee> empDel = employeeService.getEmpDel(page, limit);
        Integer empDelCount = employeeService.getEmpDelCount();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", empDelCount);
        map.put("data", empDel);

        return map;
    }


    @PutMapping(value = "/emp/{id}")
    public String deleteEmp(@PathVariable Integer id) {
        try {
            employeeService.deleteEmp(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @PutMapping(value = "/emp/batchdel")
    public String batchDeleteEmp(@RequestParam String ids) {
        try {
            employeeService.batchDeleteEmp(ids);
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

        Employee employee = new Employee();
        employee.setEmpname(empname);
        employee.setPhone(phone);

        List<Employee> employees = employeeService.searchEmp(employee, page, limit);

        Integer searchEmpCount = employeeService.searchEmpCount(employee);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", searchEmpCount);
        map.put("data", employees);
        return map;
    }

    @PutMapping(value = "/emp/restore/{id}")
    public String restoreEmp(@PathVariable Integer id) {
        try {
            employeeService.restoreEmp(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @DeleteMapping("/emp/{id}")
    public String completeDelEmp(@PathVariable Integer id) {
        try {
            employeeService.completeDelEmp(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @PutMapping("/emp/batchrestore")
    public String batchRestoreEmp(@RequestParam String ids) {
        try {
            employeeService.batchRestoreEmp(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @DeleteMapping("/emp/batchredelcomp")
    public String batchCompleteDelEmp(@RequestParam String ids) {
        try {
            employeeService.batchCompleteDelEmp(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }
}
