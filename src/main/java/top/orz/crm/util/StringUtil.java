package top.orz.crm.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {

    public static String getLimit(String str, String limit) {
        return str.replaceAll(" ", "").replaceAll(".", limit + "$0" + limit).replaceAll(limit + limit, limit).toUpperCase();
    }

    public static boolean isChinese(String str) {
        String regEx = "[\u4e00-\u9fa5]";
        Pattern pat = Pattern.compile(regEx);
        Matcher matcher = pat.matcher(str);
        boolean flg = false;
        if (matcher.find())
            flg = true;

        return flg;
    }
}

