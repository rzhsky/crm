package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;

import java.util.List;

@Repository
public interface CustomerMapper {

    void addCustomer(Customer customer);

    List<Customer> selectAllCus();

    int cusCount();

    void deleteCum(Integer id,String deleteTime);

    List<Customer> searchCum(@Param("customer") Customer customer, @Param("start") Integer start, @Param("limit") Integer limit);

    Integer searchCount(Customer customer);

    void updateCum(Customer customer);
}
