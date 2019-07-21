package top.orz.crm.bean;

/**
 * 交易记录表
 */
public class Record {
    private Integer id;
    private Double handedmoney;
    private String paydate;
    private String paycontent;
    private String payway;
    private Integer orderid;
    private Integer customerid;
    private Integer empid;

    public Record() {
    }

    public Record(Integer id, Double handedmoney, String paydate, String paycontent, String payway, Integer orderid, Integer customerid, Integer empid) {
        this.id = id;
        this.handedmoney = handedmoney;
        this.paydate = paydate;
        this.paycontent = paycontent;
        this.payway = payway;
        this.orderid = orderid;
        this.customerid = customerid;
        this.empid = empid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getHandedmoney() {
        return handedmoney;
    }

    public void setHandedmoney(Double handedmoney) {
        this.handedmoney = handedmoney;
    }

    public String getPaydate() {
        return paydate;
    }

    public void setPaydate(String paydate) {
        this.paydate = paydate;
    }

    public String getPaycontent() {
        return paycontent;
    }

    public void setPaycontent(String paycontent) {
        this.paycontent = paycontent;
    }

    public String getPayway() {
        return payway;
    }

    public void setPayway(String payway) {
        this.payway = payway;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    @Override
    public String toString() {
        return "Record{" +
                "id=" + id +
                ", handedmoney=" + handedmoney +
                ", paydate='" + paydate + '\'' +
                ", paycontent='" + paycontent + '\'' +
                ", payway='" + payway + '\'' +
                ", orderid=" + orderid +
                ", customerid=" + customerid +
                ", empid=" + empid +
                '}';
    }
}
