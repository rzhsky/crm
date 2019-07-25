package top.orz.crm.service;

import org.apache.ibatis.annotations.Param;
import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Orders;
import top.orz.crm.utils.GetIds;

import java.util.List;

public interface ContractService {
    void addContract(Contract c);

    List<Contract> getConAll(Integer page,Integer limit);

    List<Contract> searchContract(Contract contract,Integer start,Integer limit);

    List<Employee> selectEmpAll();

    List<Customer> selectCusAll();

    int conCount();

    void deleteContract(int contractId);


    void deleteContractAll(GetIds ids);

    void updateContract(Contract c);

    Integer searchConCount(Contract c);


}
