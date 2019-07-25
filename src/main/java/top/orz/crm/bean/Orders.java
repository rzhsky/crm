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
    private String okdate;
    private String reminddate;

    private Contract contract;

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Orders() {
    }

    public Orders(Integer id, Integer ordernumber, Integer coid, Double ordermoney, Integer state, String okdata, String reminddata) {
        this.id = id;
        this.ordernumber = ordernumber;
        this.coid = coid;
        this.ordermoney = ordermoney;
        this.state = state;
        this.okdate = okdate;
        this.reminddate = reminddate;
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
        return okdate;
    }

    public void setOkdata(String okdata) {
        this.okdate = okdate;
    }

    public String getReminddata() {
        return reminddate;
    }

    public void setReminddata(String reminddata) {
        this.reminddate = reminddata;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", ordernumber=" + ordernumber +
                ", coid=" + coid +
                ", ordermoney=" + ordermoney +
                ", state=" + state +
                ", okdate='" + okdate + '\'' +
                ", reminddata='" + reminddate + '\'' +
                '}';
    }
}
