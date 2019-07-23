package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Customer;
import top.orz.crm.dao.CustomerMapper;
import top.orz.crm.service.CustomerService;

import java.text.SimpleDateFormat;
import java.util.Date;
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
    public void addCustomer(Customer customer) {
        System.out.println("se---"+customer);
        customerMapper.addCustomer(customer); }

    /**
     *显示所有客户列表
     */
    @Override
    public List<Customer> getAllCus() {
        return customerMapper.selectAllCus();
    }

    /**
     * 统计客户数量
     * @return
     */
    @Override
    public int cusCount() {
        return customerMapper.cusCount();
    }

    /**
     * 删除单个客户资料
     * @param id
     * @param deleteTime
     */
    @Override
    public void deleteCum(Integer id, Date deleteTime) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        customerMapper.deleteCum(id,simpleDateFormat.format(deleteTime));
    }

    /**
     * 条件搜索
     * @param customer
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<Customer> searchCum(Customer customer, Integer page, Integer limit) {
        return customerMapper.searchCum(customer, limit * (page - 1), limit);
    }

    /**
     * 搜索到的数量
     * @param customer
     * @return
     */
    @Override
    public Integer searchCount(Customer customer) {
        return customerMapper.searchCount(customer);
    }


    /**
     * 修改客户信息
     * @param customer
     */
    @Override
    public void updateCum(Customer customer) {
        customerMapper.updateCum(customer);
    }
}
