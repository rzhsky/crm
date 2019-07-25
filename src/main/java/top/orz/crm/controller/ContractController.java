package top.orz.crm.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Orders;
import top.orz.crm.service.ContractService;
import top.orz.crm.utils.GetIds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ContractController {

    @Autowired
    private ContractService contractService;

    @RequestMapping(value = "/contract")
    public String addContract(Contract c){
        System.out.println(c.toString());
        try {
            contractService.addContract(c);
            System.out.println(c);
            return "1";
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("这里是错误情况");
            return "0";
        }
    }

    @RequestMapping(value = "/contract/all")
    public Map<String,Object> getConAll(@RequestParam Integer page, @RequestParam Integer limit){
        Map<String,Object> map = new HashMap<>();
        List<Contract> data = contractService.getConAll(page,limit);
        int count  = contractService.conCount();

        System.out.println("合同条数为"+count);

        System.out.println(data);

        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",data);

        return map;
    }

    @DeleteMapping(value = "/contract/{id}")
    public String deleteContract(@PathVariable Integer id){
        try {
            contractService.deleteContract(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping(value = "/contractAll")
    public String deleteContractAll(GetIds ids){
        System.out.println(ids.getIds());
        try{
            contractService.deleteContractAll(ids);
            return "1";
        }catch (Exception e){
            return "0";
        }
    }

    @RequestMapping(value = "/employee/all")
    public List<Employee> getEmpALl(){
        return contractService.selectEmpAll();
    }


    @RequestMapping(value = "/customer/all")
    public List<Customer> getCusALl(){
        return contractService.selectCusAll();
    }


    @PutMapping(value = "/updatecontract")
    public String updateContract(@RequestBody Contract c){
        System.out.println("要修改的合同的信息是："+c);
        try{
            contractService.updateContract(c);
            return "1";
        }catch (Exception e){
            e.printStackTrace();
            return "0";
        }
    }

    @GetMapping(value = "/searchContract")
    public Map<String,Object> searchContract(@RequestParam String contractName,@RequestParam String customerName,@RequestParam String employeeName,@RequestParam Integer page,@RequestParam Integer limit){
        Map<String,Object> map = new HashMap<>();

        Contract contract = new Contract();
        Customer customer = new Customer();
        Employee employee = new Employee();

        customer.setName(customerName);
        employee.setEmpname(employeeName);

        contract.setName(contractName);
        contract.setEmployee(employee);
        contract.setCustomer(customer);


        System.err.println(contract);
        System.err.println(contractName);
        System.err.println(customerName);
        System.err.println(employeeName);
        List<Contract> contracts = contractService.searchContract(contract,page,limit);

        Integer searchConCount = contractService.searchConCount(contract);
        System.err.println(searchConCount);

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", searchConCount);
        map.put("data", contracts);

        return map;
    }
}
