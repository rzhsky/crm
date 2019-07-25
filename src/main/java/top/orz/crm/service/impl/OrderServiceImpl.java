package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Orders;
import top.orz.crm.dao.OrderMapper;
import top.orz.crm.service.OrderService;
import top.orz.crm.utils.GetIds;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Orders> getOrdAll(Integer page,Integer limit) {
        return orderMapper.selectOrdAll(limit * (page - 1),limit);
    }

    @Override
    public int OrdCount() {
        return orderMapper.OrdCount();
    }

    @Override
    public void deleteOrder(int orderId) {
        orderMapper.deleteOrder(orderId);
    }

    @Override
    public void deleteOrderAll(GetIds ids) {
        List list = ids.getIds();
        orderMapper.deleteOrderAll(list);
    }

    @Override
    public void addOrder(Orders order) {
        orderMapper.addOrder(order);
    }

    @Override
    public List<Orders> selectOrdInfoAll() {
        return orderMapper.selectOrdInfoAll();
    }

    @Override
    public List<Contract> selectContract() {
        return orderMapper.selectContract();
    }

    @Override
    public void updateOrder(Orders o) {
        orderMapper.updateOrder(o);
    }

    @Override
    public List<Orders> searchOrder(Orders orders, Integer page, Integer limit) {
        return orderMapper.searchOrder(orders,limit * (page - 1), limit);
    }

    @Override
    public Integer searchConCount(Orders order) {
        return orderMapper.searchOrdCount(order);
    }


}
