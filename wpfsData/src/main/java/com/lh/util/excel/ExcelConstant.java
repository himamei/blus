package com.lh.util.excel;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author DT
 * @version 1.0
 * @description: TODOS
 * @date 2021/7/23 10:20
 */
public class ExcelConstant {
    /**
     * 生成文件存放路径
     */
    public static final String FILE_PATH = "E:\\EXCEL\\";

    /**
     * 表格默认名称
     */
    public String getFileName(String fileName) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String datef = sdf.format(date);
        return datef + "-" + fileName + ".xls";
    }

}
