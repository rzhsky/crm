package top.orz.crm.service;

import top.orz.crm.bean.Department;

import java.util.List;

public interface DepartmentService {
    List<Department> selectDepartments(Integer page, Integer limit);

    Integer getDepartmentCount();

    void delDepartment(Integer id);

    void batchDeleteDepartment(String ids);

    void addDepartment(Department department);

    void updateDepartment(Department department);

    List<Department> selectDelDepartments(Integer page, Integer limit);

    Integer getDelDepartmentCount();

    void restoreDepartment(Integer id);

    void completeDelDepartment(Integer id);

    void batchRestoreDepartment(String ids);

    void batchCompleteDelDepartment(String ids);
}
