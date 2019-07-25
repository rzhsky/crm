package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.*;

import java.util.List;

public class RecordMapperTest extends BaseTest{
    @Autowired
    private RecordMapper recordMapper;

    @Test
    public void selectRecordAll() {
        List<Record> records = recordMapper.getRecordAll(0,10);
        for (Record r : records) {
            System.out.println(r);
        }
    }
    @Test
    public void getRecordCount() {
        int record = recordMapper.RecordCount();
        System.out.println(record);
    }

    @Test
    public void searchRecord() {
        Record record = new Record();
        Customer customer= new Customer();
        Employee employee = new Employee();
        record.setCustomer(customer);
        record.setEmployee(employee);
        customer.setName("张三");
        employee.setEmpname("李四");
        List<Record> records = recordMapper.searchRecord(record,0,10);
        for (int i = 0; i < records.size(); i++) {
            System.out.println(records.get(i));
        }
        Integer integer = recordMapper.searchRecordCount(record);
        System.out.println(integer);
    }

    @Test
    public void aaa(){

    }
}
