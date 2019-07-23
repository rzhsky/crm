package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Employee;

import java.util.List;
import java.util.Map;

@Repository
public interface AdminMapper {

    Employee login(Employee employee);
}
