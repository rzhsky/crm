package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Customer;
import top.orz.crm.dao.CustomerMapper;
import top.orz.crm.service.CustomerService;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    private CustomerMapper customerMapper;

    /**
     * 添加客户信息
     * @param customer
     */
    @Override
    public void addCustomer(Customer customer) { customerMapper.addCustomer(customer); }

    /**
     *显示所有客户列表
     */
    @Override
    public List<Customer> getAllCus() {
        return customerMapper.selectAllCus();
    }

    @Override
    public int cusCount() {
        return customerMapper.cusCount();
    }
}
