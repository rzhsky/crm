package top.orz.crm.service.impl;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.orz.crm.bean.Position;
import top.orz.crm.dao.PositionMapper;
import top.orz.crm.service.PositionService;

import java.util.Date;
import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionMapper positionMapper;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public List<Position> selectPositions(Integer page, Integer limit) {
        return positionMapper.selectPositions(limit * (page - 1), limit, 0);
    }

    @Override
    public Integer getPositionCount() {
        return positionMapper.getPositionCount(0);
    }

    @Override
    public void addPosition(Position position) {
        positionMapper.addPosition(position);
    }

    @Override
    @Transactional
    public boolean deletePosition(Integer id) {
        Integer count = positionMapper.selectEmpCountByPositionId(id);

        if (count == 0) {
            positionMapper.deletePosition(id, sdf.format(new Date()));
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void updatePosition(Position position) {
        positionMapper.updatePosition(position);
    }

    @Override
    @Transactional
    public void batchDeletePosition(String ids) {
        String[] split = ids.split(",");

        Integer count = 0;
        for (String s : split) {
            Integer i = deletePosition(Integer.valueOf(s)) ? 1 : 0;
            count += i;
        }

        if (count != split.length){
            throw new RuntimeException("删除失败");
        }
    }

    @Override
    public List<Position> getDelPositions(Integer page, Integer limit) {
        return positionMapper.selectPositions(limit * (page - 1), limit, 1);
    }

    @Override
    public Integer getDelPositionCount() {
        return positionMapper.getPositionCount(1);
    }

    @Override
    public void completeDelPosition(Integer id) {
        positionMapper.completeDelPosition(id);
    }

    @Override
    public void batchRestorePosition(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            restorePosition(Integer.valueOf(s));
        }
    }

    @Override
    public void batchCompleteDelPosition(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            completeDelPosition(Integer.valueOf(s));
        }
    }

    @Override
    public void restorePosition(Integer id) {
        positionMapper.restorePosition(id);
    }

    @Override
    @Transactional
    public void addPositions(List<Position> positions) {
        for (Position position : positions) {
            positionMapper.addPosition(position);
        }
    }
}
