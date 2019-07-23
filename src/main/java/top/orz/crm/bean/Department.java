package top.orz.crm.bean;

/**
 * 部门表
 */
public class Department {
    private Integer id;
    private String deptname;
    private Integer parentid;
    private String deptdesc;
    private String empid;
    private Integer idelete;
    private String deletetime;

    private Employee employee;
    private Department parent;

    public Department() {
    }

    public Department(Integer id, String deptname, Integer parentid, String deptdesc, String empid, Integer idelete, String deletetime) {
        this.id = id;
        this.deptname = deptname;
        this.parentid = parentid;
        this.deptdesc = deptdesc;
        this.empid = empid;
        this.idelete = idelete;
        this.deletetime = deletetime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getDeptdesc() {
        return deptdesc;
    }

    public void setDeptdesc(String deptdesc) {
        this.deptdesc = deptdesc;
    }

    public String getEmpid() {
        return empid;
    }

    public void setEmpid(String empid) {
        this.empid = empid;
    }

    public Integer getIdelete() {
        return idelete;
    }

    public void setIdelete(Integer idelete) {
        this.idelete = idelete;
    }

    public String getDeletetime() {
        return deletetime;
    }

    public void setDeletetime(String deletetime) {
        this.deletetime = deletetime;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Department getParent() {
        return parent;
    }

    public void setParent(Department parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", deptname='" + deptname + '\'' +
                ", parentid=" + parentid +
                ", deptdesc='" + deptdesc + '\'' +
                ", empid='" + empid + '\'' +
                ", idelete=" + idelete +
                ", deletetime='" + deletetime + '\'' +
                '}';
    }
}
