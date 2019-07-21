package top.orz.crm.bean;

/**
 * 职务表
 */
public class Position {
    private Integer id;
    private String positionname;
    private String createtime;
    private String level;
    private Integer idelete;
    private String deletetime;

    public Position() {
    }

    public Position(Integer id, String positionname, String createtime, String level, Integer idelete, String deletetime) {
        this.id = id;
        this.positionname = positionname;
        this.createtime = createtime;
        this.level = level;
        this.idelete = idelete;
        this.deletetime = deletetime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
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
        return "Position{" +
                "id=" + id +
                ", positionname='" + positionname + '\'' +
                ", createtime='" + createtime + '\'' +
                ", level=" + level +
                ", idelete=" + idelete +
                ", deletetime='" + deletetime + '\'' +
                '}';
    }
}
