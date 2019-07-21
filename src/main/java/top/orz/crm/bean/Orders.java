package top.orz.crm.bean;

/**
 * 订单表
 */
public class Orders {
    private Integer id;
    private Integer ordernumber;
    private Integer coid;
    private Double ordermoney;
    private Integer state;
    private String okdata;
    private String reminddata;

    public Orders() {
    }

    public Orders(Integer id, Integer ordernumber, Integer coid, Double ordermoney, Integer state, String okdata, String reminddata) {
        this.id = id;
        this.ordernumber = ordernumber;
        this.coid = coid;
        this.ordermoney = ordermoney;
        this.state = state;
        this.okdata = okdata;
        this.reminddata = reminddata;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

    public Integer getCoid() {
        return coid;
    }

    public void setCoid(Integer coid) {
        this.coid = coid;
    }

    public Double getOrdermoney() {
        return ordermoney;
    }

    public void setOrdermoney(Double ordermoney) {
        this.ordermoney = ordermoney;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getOkdata() {
        return okdata;
    }

    public void setOkdata(String okdata) {
        this.okdata = okdata;
    }

    public String getReminddata() {
        return reminddata;
    }

    public void setReminddata(String reminddata) {
        this.reminddata = reminddata;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", ordernumber=" + ordernumber +
                ", coid=" + coid +
                ", ordermoney=" + ordermoney +
                ", state=" + state +
                ", okdata='" + okdata + '\'' +
                ", reminddata='" + reminddata + '\'' +
                '}';
    }
}
