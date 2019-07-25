package top.orz.crm.dao;

import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Department;

import java.util.List;

@Repository
public interface DepartmentMapper {
    List<Department> selectDepartments(Integer start, Integer limit);

    Integer getDepartmentCount();

    Integer delDepartment(Integer id, String createTime);

    void addDepartment(Department department);

    void updateDepartment(Department department);

    List<Department> selectDelDepartments(int i, Integer limit);

    Integer getDelDepartmentCount();

    void restoreDepartment(Integer id);

    void completeDelDepartment(Integer id);

    Integer getEmpCountByDeptId(Integer id);
}
