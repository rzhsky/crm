package top.orz.crm.util;

import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import top.orz.crm.bean.Position;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ExcelUtil {
    public static List<Position> readExcel(InputStream fileInputStream) {
        List<Position> positions = new ArrayList<>();
        BufferedInputStream bis = new BufferedInputStream(fileInputStream);
        try {
            ExcelReader reader = new ExcelReader(bis, null, new AnalysisEventListener<List<String>>() {

                @Override
                public void invoke(List<String> strings, AnalysisContext analysisContext) {
                    if (strings.get(0) != null && !strings.get(0).trim().equals("")
                             && strings.get(1).contains("级员工")) {
                        Position position = new Position();
                        position.setPositionname(strings.get(0));
                        position.setLevel(strings.get(1));
                        position.setCreatetime(strings.get(2));

                        positions.add(position);
                    }

                    System.out.println("当前sheet:" + analysisContext.getCurrentSheet().getSheetNo() + " 当前行：" + analysisContext.getCurrentRowNum()
                            + " data:" + strings);
                }

                @Override
                public void doAfterAllAnalysed(AnalysisContext analysisContext) {

                }
            });

            reader.read();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                bis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return positions;
    }
}
