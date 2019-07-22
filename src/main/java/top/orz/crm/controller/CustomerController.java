package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.orz.crm.bean.Customer;
import top.orz.crm.service.CustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    /**
     *显示所有客户的列表
     */
    @RequestMapping(value="/customer/all")
    public Map<String,Object> getAllCus(){
        List<Customer> data=customerService.getAllCus();
        Map<String,Object> map=new HashMap<>();
        int count=customerService.cusCount();

        map.put("code",0);
        map.put("mag","");
        map.put("count",count);
        map.put("data",data);

        return map;

    }

   /* *//**
     * 添加客户
     *//*
    @RequestMapping(value="/customer/add")
    public */

}
