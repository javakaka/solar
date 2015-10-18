package com.ezcloud.framework.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
/**
 * 
 * 
 * Excel工具类
 * @author JianBoTong
 *
 */
public class ExcelUtil {

	
	 private static Logger logger = Logger.getLogger(ExcelUtil.class);

	    
	 public static List<Map<String ,Object>> parseExcel(String filePath) throws FileNotFoundException, IOException
	 {
	    	List<Map<String ,Object>>sheetList =new ArrayList<Map<String,Object>>();
	    	List<Object> sheetData =null;
	    	HSSFWorkbook  workbook = new HSSFWorkbook(new FileInputStream(filePath));
	    	HSSFSheet sheet=null;
	    	Map <String ,Object>sheetMap=null;
	    	int sheetNum = workbook.getNumberOfSheets();
	    	System.out.println("\n");
	    	System.out.println("\n=============sheet num====>>"+sheetNum);
	    	for(int i=0; i< sheetNum; i++)
	    	{
	    		sheet = workbook.getSheetAt(i);
	    		String sheetName =sheet.getSheetName();
	    		sheetData =getDatasInSheet(workbook,i);
	    		sheetMap =new HashMap<String ,Object>();
	    		sheetMap.put("index", String.valueOf(i));
	    		sheetMap.put("name", sheetName);
	    		sheetMap.put("data", sheetData);
	    		sheetMap.put("rows", sheetData.size());
	    		sheetList.add(sheetMap);
	    	}
	    	return sheetList;
	    }
	    

	    /**
	     * 获得表中的数据
	     * 
	     * @param sheetNumber
	     *            表格索引(EXCEL 是多表文档,所以需要输入表索引号)
	     * @return 由LIST构成的行和表
	     * @throws FileNotFoundException
	     * @throws IOException
	     * 
	     */
	    public static List<Object> getDatasInSheet(HSSFWorkbook workbook,int sheetNumber)
	            throws FileNotFoundException, IOException {
	        List<Object> result = new ArrayList<Object>();
	        // 获得指定的表
	        HSSFSheet sheet = workbook.getSheetAt(sheetNumber);
	        // 获得数据总行数
	        int rowCount = sheet.getLastRowNum();
	        logger.info("found excel rows count: " + rowCount);
	        if (rowCount < 1) {
	            return result;
	        }

	        // 逐行读取数据
	        for (int rowIndex = 0; rowIndex <= rowCount; rowIndex++) {
	            // 获得行对象
	            HSSFRow row = sheet.getRow(rowIndex);
	            if (row != null) {
	                List<Object> rowData = new ArrayList<Object>();
	                // 获得本行中单元格的个数
	                int columnCount = row.getLastCellNum();
	                // 获得本行中各单元格中的数据
	                for (short columnIndex = 0; columnIndex < columnCount; columnIndex++) {
	                    @SuppressWarnings("deprecation")
						HSSFCell cell = row.getCell(columnIndex);
	                    // 获得指定单元格中数据
	                    Object cellStr = getCellString(cell);
	                    rowData.add(cellStr);
	                }
	                result.add(rowData);
	            }
	        }
	        return result;
	    }

	    /**
	     * 获得单元格中的内容
	     * 
	     * @param cell
	     * @return
	     */
	    protected static Object getCellString(HSSFCell cell) {
	        Object result = null;
	        if (cell != null) {
	            int cellType = cell.getCellType();
	            switch (cellType) {
	            case HSSFCell.CELL_TYPE_STRING:
	                result = cell.getRichStringCellValue().getString();
	                break;
	            case HSSFCell.CELL_TYPE_NUMERIC:
	            {
	            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
//	                result = cell.getNumericCellValue();
	            	 result = cell.getRichStringCellValue().getString();
	                break;
	            }
	            	
	            case HSSFCell.CELL_TYPE_FORMULA:
	            {
	            	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
//	            	result = cell.getNumericCellValue();
	            	result = cell.getRichStringCellValue().getString();
	                break;
	            }
	            case HSSFCell.CELL_TYPE_ERROR:
	                result = null;
	                break;
	            case HSSFCell.CELL_TYPE_BOOLEAN:
	                result = cell.getBooleanCellValue();
	                break;
	            case HSSFCell.CELL_TYPE_BLANK:
	                result = null;
	                break;
	            }
	        }
	        return result;
	    }

	    @SuppressWarnings("unchecked")
		public static void main(String[] args) throws Exception {
	    	String filePath="/users/JianBoTong/Desktop/test.xls";
	       List<Map<String,Object>>sheetlist =ExcelUtil.parseExcel(filePath);
	       String index ="";
	       String sheetName="";
	       List<Object> sheetData=null;
	        for (int i = 0; i < sheetlist.size(); i++) {// 显示数据
	            Map<String,Object> map=  (Map<String,Object>)sheetlist.get(i);
	            index=(String)map.get("index");
	            sheetName=(String)map.get("name");
	            sheetData=(List<Object>)map.get("data");
	            System.out.println("=============sheet:"+index+" sheet name:"+sheetName);
	            for (short n = 0; n < sheetData.size(); n++) {
	            	List<Object> rowData =(List<Object>)sheetData.get(n);
//	            	System.out.println("row----------------------->> "+n);
	            	for(int m=0;m<rowData.size();m++)
	            	{
	            		Object value = rowData.get(m);
	 	                String data = String.valueOf(value);
	 	                System.out.print(data + "\t");
	            	}
	            	System.out.println();
	            }
	            System.out.println();
	        }
	    }

}
