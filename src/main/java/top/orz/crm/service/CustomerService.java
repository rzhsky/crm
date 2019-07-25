package top.orz.crm.service;


import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;

import java.util.Date;
import java.util.List;

public interface CustomerService {
    void addCustomer(Customer customer);

    List<Customer> getAllCus();

    int cusCount();

    void deleteCum(Integer id,Date deleteTime);

    List<Customer> searchCum(Customer customer,Integer page,Integer limit);

    Integer searchCount(Customer customer);

    void updateCum(Customer customer);
}
