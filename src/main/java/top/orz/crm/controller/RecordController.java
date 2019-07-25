package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Orders;
import top.orz.crm.bean.Record;
import top.orz.crm.service.RecordService;
import top.orz.crm.utils.GetIds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RecordController {
    @Autowired
    private RecordService recordService;

    @RequestMapping(value = "/record/all")
    public Map<String,Object> getOrdAll(@RequestParam Integer page, @RequestParam Integer limit){
        List<Record> data = recordService.getRecordAll(page,limit);
        Map<String,Object> map = new HashMap<>();
        int count  = recordService.RecordCount();
        System.out.println("交易记录条数为"+count);
        System.out.println(data);
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",data);
        return map;
    }

    @DeleteMapping(value = "/record/{id}")
    public String deleteOrder(@PathVariable Integer id){
        try {
            recordService.deleteRecord(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping(value = "/recordAll")
    public String deleteOrderAll(GetIds ids){
        System.out.println(ids.getIds());
        try{
           recordService.deleteRecordAll(ids);
            return "1";
        }catch (Exception e){
            return "0";
        }
    }

    @GetMapping(value = "/searchRecord")
    public Map<String,Object> searchRecord(@RequestParam String cusname,@RequestParam String employeename,@RequestParam Integer page,@RequestParam Integer limit) {
        Map<String,Object> map = new HashMap<>();
        Record record = new Record();
        Customer customer= new Customer();
        Employee employee = new Employee();
        record.setCustomer(customer);
        record.setEmployee(employee);
        customer.setName(cusname);
        employee.setEmpname(employeename);
        System.out.println("交款人的姓名是："+cusname);
        System.out.println("办理人的姓名是"+employeename);
        List<Record> records = recordService.searchRecord(record,page,limit);
        Integer searchCount = recordService.searchRecordCount(record);
        System.out.println("查到的信息条数是："+searchCount);
        map.put("code",0);
        map.put("msg","");
        map.put("count",searchCount);
        map.put("data",records);
        return map;
    }

    @RequestMapping(value="/echartsData")
    @ResponseBody
    public List<Map<String, Object>> initChart(){
        return recordService.selectRecord();
    }

    @RequestMapping(value="/groupByMonth")
    @ResponseBody
    public List<Map<String, Object>> month(){
        return recordService.selectMonth();
    }


}
