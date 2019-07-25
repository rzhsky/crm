package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Contract;
import top.orz.crm.bean.Customer;
import top.orz.crm.bean.Employee;
import top.orz.crm.dao.ContractMapper;
import top.orz.crm.service.ContractService;
import top.orz.crm.utils.GetIds;

import java.awt.*;
import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractMapper contractMapper;

    @Override
    public void addContract(Contract c) {
        contractMapper.addContract(c);
    }

    @Override
    public List<Contract> getConAll(Integer page, Integer limit) {
        return contractMapper.selectConAll(limit * (page - 1), limit);
    }

    @Override
    public List<Contract> searchContract(Contract contract, Integer page, Integer limit) {
        return contractMapper.searchContract(contract,limit * (page - 1), limit);
    }

    @Override
    public List<Employee> selectEmpAll() {
        return contractMapper.selectEmpAll();
    }

    @Override
    public List<Customer> selectCusAll() {
        return contractMapper.selectCusAll();
    }

    @Override
    public int conCount() {
        return contractMapper.ConCount();
    }

    @Override
    public void deleteContract(int contractId) {
        contractMapper.deleteContract(contractId);
    }

    @Override
    public void deleteContractAll(GetIds ids) {
        List list = ids.getIds();
        contractMapper.deleteContractAll(ids.getIds());

    }

    @Override
    public void updateContract(Contract c) {
        contractMapper.updateContract(c);
    }

    @Override
    public Integer searchConCount(Contract c) {
        return contractMapper.searchConCount(c);
    }

}
