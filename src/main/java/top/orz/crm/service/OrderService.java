package top.orz.crm.service;

import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Orders;
import top.orz.crm.utils.GetIds;

import java.util.List;

public interface OrderService {
    /**
     * 获取所有订单信息
     * @param page
     * @param limit
     * @return
     */
    List<Orders> getOrdAll(Integer page,Integer limit);

    /**
     * 订单条数
     * @return
     */
    int OrdCount();

    /**
     * 删除单条订单
     * @param orderId
     */
    void deleteOrder(int orderId);

    /**
     * 删除全部订单
     * @param ids
     */
    void deleteOrderAll(GetIds ids);

    /**
     * 添加订单
     * @param order
     */
    void addOrder(Orders order);

    List<Orders> selectOrdInfoAll();

    List<Contract> selectContract();

    void updateOrder(Orders o);

    List<Orders> searchOrder(Orders orders,Integer start,Integer limit);

    Integer searchConCount(Orders orders);
}
