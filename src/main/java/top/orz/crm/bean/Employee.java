package top.orz.crm.bean;

/**
 * 员工表
 */
public class Employee {
    private Integer id;
    private String empname;
    private String password;
    private Integer sex;
    private String phone;
    private String addr;
    private String email;
    private String img = "/default.jpg";
    private Integer idelete;
    private String deletetime;
    private Integer deptid;
    private Integer pid;

    private Department department;
    private Position position;

    public Employee() {
    }

    public Employee(String empname, Integer sex, String phone, String addr, String email, Integer deptid, Integer pid) {
        this.empname = empname;
        this.sex = sex;
        this.phone = phone;
        this.addr = addr;
        this.email = email;
        this.deptid = deptid;
        this.pid = pid;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", empname='" + empname + '\'' +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", email='" + email + '\'' +
                ", img='" + img + '\'' +
                ", idelete=" + idelete +
                ", deletetime='" + deletetime + '\'' +
                ", deptid=" + deptid +
                ", pid=" + pid +
                '}';
    }
}
