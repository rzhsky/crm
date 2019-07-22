package top.orz.crm.service;


import top.orz.crm.bean.Customer;

import java.util.List;

public interface CustomerService {
    void addCustomer(Customer customer);
    List<Customer> getAllCus();
    int cusCount();
}
