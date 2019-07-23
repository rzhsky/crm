package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import top.orz.crm.bean.Employee;
import top.orz.crm.service.AdminService;

import javax.servlet.http.HttpSession;

@RestController
public class AdminController {

    @Autowired
    private AdminService adminService;

    @PostMapping(value = "/admin/login")
    public String login( Employee employee, HttpSession session){
        Employee e=adminService.login(employee);
        if (e==null){
            return "0";
        }else {
            session.setAttribute("employee",e);
            return "1";
        }
    }

}
