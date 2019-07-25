package top.orz.crm.dao;

import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Employee;

@Repository
public interface AdminMapper {

    Employee login(Employee employee);

   void upnullEmp(Employee employee);

   void upEmp(Employee employee);

   Employee lemp(Employee employee);

   void updatepassword(Employee employee);
}
