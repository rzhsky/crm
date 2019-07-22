package top.orz.crm.dao;

import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Customer;

import java.util.List;

@Repository
public interface CustomerMapper {

    void addCustomer(Customer customer);
    List<Customer> selectAllCus();
    int cusCount();
}
