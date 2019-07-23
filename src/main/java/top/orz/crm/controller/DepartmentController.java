package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Department;
import top.orz.crm.service.DepartmentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @PostMapping(value = "/department")
    public String addDepartment(Department department) {

        System.err.println(department);
        try {
            departmentService.addDepartment(department);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @GetMapping("/department")
    public Map<String, Object> getDepartments(@RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();
        List<Department> departments = departmentService.selectDepartments(page, limit);
        Integer departmentCount = departmentService.getDepartmentCount();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", departmentCount);
        map.put("data", departments);
        return map;
    }

    @GetMapping("/department/del")
    public Map<String, Object> getDelDepartments(@RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();
        List<Department> departments = departmentService.selectDelDepartments(page, limit);
        Integer departmentCount = departmentService.getDelDepartmentCount();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", departmentCount);
        map.put("data", departments);
        return map;
    }

    @PutMapping("/department/{id}")
    public String delDepartment(@PathVariable Integer id) {
        try {
            departmentService.delDepartment(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @PutMapping("/department/batchdel")
    public String batchDeleteDepartment(@RequestParam String ids) {
        try {
            departmentService.batchDeleteDepartment(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @PutMapping("/department")
    public String updateDepartment(@RequestBody Department department) {
        try {
            departmentService.updateDepartment(department);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @PutMapping("/department/restore/{id}")
    public String restoreDepartment(@PathVariable Integer id) {
        try {
            departmentService.restoreDepartment(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @DeleteMapping("/department/{id}")
    public String completeDelDepartment(@PathVariable Integer id) {
        try {
            departmentService.completeDelDepartment(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }


    @PutMapping("/department/batchrestore")
    public String batchRestoreDepartment(@RequestParam String ids) {
        try {
            departmentService.batchRestoreDepartment(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @DeleteMapping("/department/batchredelcomp")
    public String batchCompleteDelDepartment(@RequestParam String ids) {
        try {
            departmentService.batchCompleteDelDepartment(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

}
