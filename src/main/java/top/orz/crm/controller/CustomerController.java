package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Customer;
import top.orz.crm.service.CustomerService;

import java.util.Date;
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


    /**
     * 添加员工信息
     */
    @RequestMapping(value="/customer/add")
    public String addCustomer(Customer customer){
        try {
            System.out.println(customer);
            customerService.addCustomer(customer);
            return "1";
        }catch (Exception e){
            return "0";
        }

    }

    /**
     * 删除员工信息
     */
    @PutMapping(value = "/customer/{id}")
    public String deleteCum(@PathVariable Integer id){
        System.out.println(id);
        try{
            customerService.deleteCum(id,new Date());
            return "1";
        }catch (Exception e){
            return "0";
        }
    }

    /**
     * 批量删除
     */
    @PutMapping(value = "/customer/delAll")
    public String delAll(@RequestParam String ids){
        String[] split=ids.split(",");
        try {
            for (String s : split) {
                customerService.deleteCum(Integer.valueOf(s),new Date());
            }
            return "1";
        }catch (Exception e){
            return "0";
        }
    }

    /**
     * 搜索
     */
    @GetMapping(value = "/customer/searchcum")
    public Map<String,Object> searchcum(@RequestParam String name,@RequestParam String company, @RequestParam Integer page, @RequestParam Integer limit){
        Map<String, Object> map = new HashMap<>();

        Customer customer=new Customer();
        customer.setName(name);
        customer.setCompany(company);

        List<Customer> customers=customerService.searchCum(customer,page,limit);

        Integer searchCount=customerService.searchCount(customer);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", searchCount);
        map.put("data", customers);
        return map;
    }

    /**
     * 修改顾客资料
     */
    @PutMapping(value = "/customer/update")
    public String updateCum(@RequestBody Customer customer) {
        System.out.println("修改的客户信息" + customer);
        try {
            customerService.updateCum(customer);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

}
