package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.Customer;

public class CustomerMapperTest extends BaseTest {
    @Autowired
    private CustomerMapper customerMapper;

    @Test
    public void addCustomer(){
        Customer customer=new Customer("111",1,"华润万家","销售部","主管","3月4日","1243545","58475489@qq.com","74384548","12364578903","西角路574号","首次合作");
        customerMapper.addCustomer(customer);
    }
}