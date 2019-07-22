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
        return positionMapper.selectPositions(limit * (page - 1), limit);
    }

    @Override
    public Integer getPositionCount() {
        return positionMapper.getPositionCount();
    }

    @Override
    public void addPosition(Position position) {
        positionMapper.addPosition(position);
    }

    @Override
    public void deletePosition(Integer id) {

        positionMapper.deletePosition(id, sdf.format(new Date()));
    }

    @Override
    public void updatePosition(Position position) {
        positionMapper.updatePosition(position);
    }

    @Override
    @Transactional
    public void batchDeletePosition(String ids) {
        String[] split = ids.split(",");

        for (String s : split) {
            positionMapper.deletePosition(Integer.valueOf(s), sdf.format(new Date()));
        }
    }
}
