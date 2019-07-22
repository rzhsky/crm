package top.orz.crm.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.orz.crm.bean.Department;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;

import java.util.List;

public class PositionMapperTest extends BaseTest {

    @Autowired
    private PositionMapper positionMapper;

    @Test
    public void selectPosition() {
        List<Position> positions = positionMapper.selectPositions(0, 10);
        for (Position position : positions) {
            System.out.println(position);
        }
    }
}