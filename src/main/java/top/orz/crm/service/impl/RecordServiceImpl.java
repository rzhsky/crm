package top.orz.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.orz.crm.bean.Record;
import top.orz.crm.dao.RecordMapper;
import top.orz.crm.service.RecordService;
import top.orz.crm.utils.GetIds;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordMapper recordMapper;
    @Override
    public List<Record> getRecordAll(Integer page, Integer limit) {
        return recordMapper.getRecordAll((page-1)*limit,limit);
    }

    @Override
    public Integer RecordCount() {
        return recordMapper.RecordCount();
    }

    @Override
    public void deleteRecord(int recordid) {
        recordMapper.deleteRecord(recordid);
    }

    @Override
    public void deleteRecordAll(GetIds ids) {
        List list = ids.getIds();
        recordMapper.deleteRecordAll(list);

    }

    @Override
    public List<Record> searchRecord(Record record, Integer start, Integer page) {
        return recordMapper.searchRecord(record,start,page);
    }

    @Override
    public Integer searchRecordCount(Record record) {
        return recordMapper.RecordCount();
    }

    @Override
    public List<Map<String, Object>> selectRecord() {
        List<Map<String,Object>> data =new ArrayList<>();
        List<Map<String, Object>> listdata=recordMapper.selectRecord();
        if(listdata.size()>0){
            for(int i=0;i<listdata.size();i++){
                Map<String,Object> map=new HashMap<>();
                map.put("name", listdata.get(i).get("payway"));
                map.put("value", listdata.get(i).get("count"));
                data.add(map);
            }
        }
        return data;
    }

    @Override
    public List<Map<String, Object>> selectMonth() {
        List<Map<String,Object>> data =new ArrayList<>();
        List<Map<String, Object>> listdata=recordMapper.selectMonth();
        if(listdata.size()>0){
            for(int i=0;i<listdata.size();i++){
                Map<String,Object> map=new HashMap<>();
                map.put("name", listdata.get(i).get("month"));
                map.put("value", listdata.get(i).get("count"));
                data.add(map);
            }
        }
        return data;
    }
}
