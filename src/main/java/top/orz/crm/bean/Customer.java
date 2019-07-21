package top.orz.crm.bean;

/**
 * 客户表
 */
public class Customer {
    private Integer id;
    private String name;
    private Integer sex;
    private String compary;
    private String department;
    private String position;
    private String birthday;
    private String tel;
    private String email;
    private String qq;
    private String mob;
    private String address;
    private String remark;
    private Integer idelete;
    private String deletetime;

    public Customer() {
    }

    public Customer(Integer id, String name, Integer sex, String compary, String department, String position, String birthday, String tel, String email, String qq, String mob, String address, String remark, Integer idelete, String deletetime) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.compary = compary;
        this.department = department;
        this.position = position;
        this.birthday = birthday;
        this.tel = tel;
        this.email = email;
        this.qq = qq;
        this.mob = mob;
        this.address = address;
        this.remark = remark;
        this.idelete = idelete;
        this.deletetime = deletetime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getCompary() {
        return compary;
    }

    public void setCompary(String compary) {
        this.compary = compary;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMob() {
        return mob;
    }

    public void setMob(String mob) {
        this.mob = mob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", compary='" + compary + '\'' +
                ", department='" + department + '\'' +
                ", position='" + position + '\'' +
                ", birthday='" + birthday + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", qq='" + qq + '\'' +
                ", mob='" + mob + '\'' +
                ", address='" + address + '\'' +
                ", remark='" + remark + '\'' +
                ", idelete=" + idelete +
                ", deletetime='" + deletetime + '\'' +
                '}';
    }
}
