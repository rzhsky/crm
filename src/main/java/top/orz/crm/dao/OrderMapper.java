package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Orders;
import top.orz.crm.bean.Record;

import java.util.List;

@Repository
public interface OrderMapper {
    int OrdCount();

    List<Orders> selectOrdAll(Integer start, Integer limit);

   void deleteOrder(int orderId);

    void deleteOrderAll(List<Integer> ids);

    void addOrder(Orders order);

    List<Orders> selectOrdInfoAll();

    List<Contract> selectContract();

    void updateOrder(Orders o);

    Integer searchOrdCount(@Param("orders")Orders orders);

    List<Orders> searchOrder(@Param("orders") Orders orders,@Param("start") Integer start,@Param("limit") Integer limit);

}
