package top.orz.crm.service.impl;
import	java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.orz.crm.bean.Department;
import top.orz.crm.dao.DepartmentMapper;
import top.orz.crm.service.DepartmentService;

import java.util.Date;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:dd:ss");

    @Override
    public List<Department> selectDepartments(Integer page, Integer limit) {
        return departmentMapper.selectDepartments(limit * (page - 1), limit);
    }

    @Override
    public Integer getDepartmentCount() {
        return departmentMapper.getDepartmentCount();
    }

    @Override
    public void delDepartment(Integer id) {
        departmentMapper.delDepartment(id, sdf.format(new Date()));
    }

    @Override
    @Transactional
    public void batchDeleteDepartment(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            departmentMapper.delDepartment(Integer.valueOf(s), sdf.format(new Date()));
        }
    }

    @Override
    public void addDepartment(Department department) {
        departmentMapper.addDepartment(department);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentMapper.updateDepartment(department);
    }

    @Override
    public List<Department> selectDelDepartments(Integer page, Integer limit) {
        return departmentMapper.selectDelDepartments(limit * (page - 1), limit);
    }

    @Override
    public Integer getDelDepartmentCount() {
        return departmentMapper.getDelDepartmentCount();
    }

    @Override
    public void restoreDepartment(Integer id) {
        departmentMapper.restoreDepartment(id);
    }

    @Override
    public void completeDelDepartment(Integer id) {
        departmentMapper.completeDelDepartment(id);
    }

    @Override
    public void batchRestoreDepartment(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            departmentMapper.restoreDepartment(Integer.valueOf(s));
        }
    }

    @Override
    public void batchCompleteDelDepartment(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            departmentMapper.completeDelDepartment(Integer.valueOf(s));
        }
    }
}
