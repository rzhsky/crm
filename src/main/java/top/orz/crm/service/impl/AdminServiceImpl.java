package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Employee;
import top.orz.crm.dao.AdminMapper;
import top.orz.crm.service.AdminService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;


    @Override
    public Employee login(Employee employee) {
        System.out.println("ssss"+adminMapper.login(employee));
        return adminMapper.login(employee);
    }
}
