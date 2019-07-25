package top.orz.crm.service;

import org.apache.ibatis.annotations.Param;
import top.orz.crm.bean.Record;
import top.orz.crm.utils.GetIds;

import java.util.List;
import java.util.Map;

public interface RecordService {
    List<Record> getRecordAll(Integer page, Integer limit);

    Integer RecordCount();

    void deleteRecord(int recordid);

    void deleteRecordAll(GetIds ids);

    List<Record> searchRecord(Record record, Integer start, Integer page);

    Integer searchRecordCount(Record record);

    List<Map<String, Object>> selectRecord();

    List<Map<String, Object>> selectMonth();
}
