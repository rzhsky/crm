package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Orders;
import top.orz.crm.utils.GetIds;

import java.util.List;

@Repository
public interface ContractMapper {
    void addContract(Contract c);

    int ConCount();

    void deleteContract(int contractId);

    void deleteContractAll(List<Integer> ids);

    List<Employee> selectEmpAll();

    List<Customer> selectCusAll();

    List<Contract> selectConAll(Integer start, Integer limit);

    List<Contract> searchContract(@Param("contract") Contract contract,@Param("start") Integer start,@Param("limit") Integer limit);

    void updateContract(Contract c);

    Integer searchConCount(@Param("contract") Contract contract);

}
