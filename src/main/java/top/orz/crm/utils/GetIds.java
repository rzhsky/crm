package top.orz.crm.utils;

import java.io.Serializable;
import java.util.List;

public class GetIds<T> implements Serializable {
    private List<T> ids;

    public List<T> getIds() {
        return ids;
    }

    public void setIds(List<T> ids) {
        this.ids = ids;
    }
}
