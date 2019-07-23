package top.orz.crm.service;

import top.orz.crm.bean.Position;

import java.util.List;

public interface PositionService {
    List<Position> selectPositions(Integer page, Integer limit);

    Integer getPositionCount();

    void addPosition(Position position);

    void deletePosition(Integer id);

    void updatePosition(Position position);

    void batchDeletePosition(String ids);

    List<Position> getDelPositions(Integer page, Integer limit);

    Integer getDelPositionCount();

    void completeDelPosition(Integer id);

    void batchRestorePosition(String ids);

    void batchCompleteDelPosition(String ids);

    void restorePosition(Integer id);
}
