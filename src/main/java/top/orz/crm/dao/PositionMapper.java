package top.orz.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.orz.crm.bean.Position;

import java.util.List;

@Repository
public interface PositionMapper {
    List<Position> selectPositions(@Param("start") Integer start, @Param("limit") Integer limit);

    Integer getPositionCount();

    void addPosition(Position position);

    void deletePosition(Integer id, String deleteTime);

    void updatePosition(Position position);
}
