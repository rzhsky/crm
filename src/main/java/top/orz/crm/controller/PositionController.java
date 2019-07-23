package top.orz.crm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.orz.crm.bean.Employee;
import top.orz.crm.bean.Position;
import top.orz.crm.service.PositionService;

import java.util.List;

@RestController
public class PositionController {

    @Autowired
    private PositionService positionService;

    @GetMapping("/position")
    public Map<String, Object> getPositions(@RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();
        List<Position> positions = positionService.selectPositions(page, limit);
        Integer positionCount = positionService.getPositionCount();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", positionCount);
        map.put("data", positions);

        return map;
    }

    @PostMapping("/position/")
    public String addPosition(Position position) {
        System.err.println(position);
        try {
            positionService.addPosition(position);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @PutMapping("/position/{id}")
    public String deletePosition(@PathVariable Integer id) {
        try {
            positionService.deletePosition(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @PutMapping("/position")
    public String updatePosition(@RequestBody Position position) {
        try {
            positionService.updatePosition(position);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }


    @PutMapping("/position/batchdel")
    public String batchDeletePosition(@RequestParam String ids) {
        try {
            positionService.batchDeletePosition(ids);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @GetMapping("/position/del")
    public Map<String, Object> getDelPositions(@RequestParam Integer page, @RequestParam Integer limit) {
        Map<String, Object> map = new HashMap<>();
        List<Position> delPositions = positionService.getDelPositions(page, limit);
        Integer delPositionCount = positionService.getDelPositionCount();

        map.put("code", 0);
        map.put("msg", "");
        map.put("count", delPositionCount);
        map.put("data", delPositions);

        return map;
    }

    @PutMapping(value = "/position/restore/{id}")
    public String restoreEmp(@PathVariable Integer id) {
        try {
            positionService.restorePosition(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @DeleteMapping("/position/{id}")
    public String completeDelPosition(@PathVariable Integer id) {
        try {
            positionService.completeDelPosition(id);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @PutMapping("/position/batchrestore")
    public String batchRestorePosition(@RequestParam String ids) {
        try {
            positionService.batchRestorePosition(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

    @DeleteMapping("/position/batchredelcomp")
    public String batchCompleteDelPosition(@RequestParam String ids) {
        try {
            positionService.batchCompleteDelPosition(ids);
            return "1";
        } catch (Exception e) {
            return "0";
        }
    }

}
