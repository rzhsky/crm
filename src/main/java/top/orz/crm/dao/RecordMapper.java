package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Record;

import java.util.List;
import java.util.Map;

@Repository
public interface RecordMapper {
    List<Record> getRecordAll(Integer start, Integer limit);

    @Select("select payway,count(payway) as count from record group by payway")
    List<Map<String, Object>> selectRecord();

    @Select("SELECT count(*) as count ,CASE SUBSTRING(paydate,3,5) \n" +
            "WHEN '18-01' THEN '2018年1月' \n" +
            "WHEN '18-02' THEN '2018年2月' \n" +
            "WHEN '18-03' THEN '2018年3月' \n" +
            "WHEN '18-04' THEN '2018年4月' \n" +
            "WHEN '18-05' THEN '2018年5月'\n" +
            "WHEN '18-06' THEN '2018年6月'\n" +
            "WHEN '18-07' THEN '2018年7月'\n" +
            "WHEN '18-08' THEN '2018年8月'\n" +
            "WHEN '18-09' THEN '2018年9月'\n" +
            "WHEN '18-10' THEN '2018年10月'\n" +
            "WHEN '18-11' THEN '2018年11月'\n" +
            "WHEN '18-12' THEN '2018年12月'\n" +
            "WHEN '19-01' THEN '2019年1月' \n" +
            "WHEN '19-02' THEN '2019年2月' \n" +
            "WHEN '19-03' THEN '2019年3月' \n" +
            "WHEN '19-04' THEN '2019年4月' \n" +
            "WHEN '19-05' THEN '2019年5月'\n" +
            "WHEN '19-06' THEN '2019年6月'\n" +
            "WHEN '19-07' THEN '2019年7月'\n" +
            "WHEN '19-08' THEN '2019年8月'\n" +
            "WHEN '19-09' THEN '2019年9月'\n" +
            "WHEN '19-10' THEN '2019年10月'\n" +
            "WHEN '19-11' THEN '2019年11月'\n" +
            "ELSE '2019年12月' END  as month from record group by month")
    List<Map<String, Object>> selectMonth();

    Integer RecordCount();

    void deleteRecord(int recordid);

    void deleteRecordAll(List<Integer> ids);

    List<Record> searchRecord(@Param("record") Record record,@Param("start") Integer start,@Param("page") Integer page);

    Integer searchRecordCount(@Param("record") Record record);
}
