package top.orz.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.*;
import top.orz.crm.service.ContractService;
import top.orz.crm.service.OrderService;
import top.orz.crm.utils.GetIds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/orders/all")
    public Map<String,Object> getOrdAll(@RequestParam Integer page, @RequestParam Integer limit){
        List<Orders> data = orderService.getOrdAll(page,limit);
        Map<String,Object> map = new HashMap<>();
        int count  = orderService.OrdCount();
        System.out.println("订单条数为"+count);
        System.out.println(data);
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",data);
        return map;
    }

    @DeleteMapping(value = "/order/{id}")
    public String deleteOrder(@PathVariable Integer id){
        try {
            orderService.deleteOrder(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping(value = "/orderAll")
    public String deleteOrderAll(GetIds ids){
        System.out.println(ids.getIds());
        try{
            orderService.deleteOrderAll(ids);
            return "1";
        }catch (Exception e){
            return "0";
        }
    }

    @RequestMapping(value = "/order")
    public String addOrder(Orders order){
        System.out.println(order.toString());
        try {
            orderService.addOrder(order);
            System.out.println(order);
            return "1";
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("这里是错误情况");
            return "0";
        }
    }

    @RequestMapping(value = "/order/all")
    public List<Orders> getOrdALl(){
        return orderService.selectOrdInfoAll();
    }

    @RequestMapping(value = "/contracts")
    public List<Contract> getContAll(){
        return orderService.selectContract();
    }

    @PutMapping(value = "/updateOrder")
    public String updateOrder(@RequestBody Orders o){
        System.out.println("要修改的订单的信息是："+o.toString());
        System.out.println("这里是修改订单信息的方法");
        try{
            orderService.updateOrder(o);
            System.out.println("成功进入修改订单信息的方法");
            return "1";
        }catch (Exception e){
            e.printStackTrace();
            return "0";
        }
    }

    @GetMapping(value = "/searchOrder")
    public Map<String,Object> searchOrder(@RequestParam int orderId,@RequestParam String contractName,@RequestParam Integer page,@RequestParam Integer limit){

        Map<String,Object> map = new HashMap<>();
        Orders order = new Orders();
        Contract contract = new Contract();
        contract.setName(contractName);
        order.setOrdernumber(orderId);
        order.setContract(contract);
        System.err.println(order);
        System.err.println(contract);
        System.err.println(contractName);
        List<Orders> list = orderService.searchOrder(order,page,limit);
        Integer searchOrdCount = orderService.searchConCount(order);
        System.err.println(searchOrdCount);
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", searchOrdCount);
        map.put("data", list);
        return map;
    }
}
