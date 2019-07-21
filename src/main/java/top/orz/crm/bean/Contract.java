package top.orz.crm.bean;

/**
 * 合同表
 */
public class Contract {
    private Integer id;
    private String name;
    private String createdate;
    private String content;
    private Integer cid;
    private Double amount;
    private Integer empid;
    private String remark;

    public Contract() {
    }

    public Contract(Integer id, String name, String createdate, String content, Integer cid, Double amount, Integer empid, String remark) {
        this.id = id;
        this.name = name;
        this.createdate = createdate;
        this.content = content;
        this.cid = cid;
        this.amount = amount;
        this.empid = empid;
        this.remark = remark;
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

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
