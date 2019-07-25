package top.orz.crm.service;

import top.orz.crm.bean.Employee;

import javax.servlet.http.HttpSession;

public interface AdminService {

    Employee login(Employee employee);

    Employee updateEmp(Employee employee);

    void updatepassword(Employee employee);
}
