package top.orz.crm.bean;

/**
 * 部门表
 */
public class Department {
    private Integer id;
    private String deptname;
    private Integer parentid;
    private String desc;
    private String empid;
    private Integer idelete;
    private String deletetime;

    public Department() {
    }

    public Department(Integer id, String deptname, Integer parentid, String desc, String empid, Integer idelete, String deletetime) {
        this.id = id;
        this.deptname = deptname;
        this.parentid = parentid;
        this.desc = desc;
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
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

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", deptname='" + deptname + '\'' +
                ", parentid=" + parentid +
                ", desc='" + desc + '\'' +
                ", empid='" + empid + '\'' +
                ", idelete=" + idelete +
                ", deletetime='" + deletetime + '\'' +
                '}';
    }
}
