package com.ezcloud.framework.util;

import com.ezcloud.framework.service.system.SystemConfigService;
import com.ezcloud.utility.DateUtil;
import com.ezcloud.utility.OSUtil;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2015-3-13 上午10:19:06  
 * 类说明: mysql 数据库备份工具，支持windows,linux系统备份
 */
public class MysqlBackUpUtils {

	public MysqlBackUpUtils() {
	}
	
	private static String BASE_PATH= "";
	private static String DB_NAME= "";
	private static String USERNAME= "";
	private static String PASSWORD= "";

    private static SystemConfigService configService =SpringUtils.getBean("frameworkSystemConfigService", SystemConfigService.class);
    static{
    	BASE_PATH =configService.querySingleConfig("DB_BACKUP","BASE_PATH");
    	DB_NAME =configService.querySingleConfig("DB_BACKUP","DB_NAME");
    	USERNAME =configService.querySingleConfig("DB_BACKUP","USERNAME");
    	PASSWORD =configService.querySingleConfig("DB_BACKUP","PASSWORD");
    }
    public static boolean backwindows() {
    	boolean bool =true;
	    try {
	        String sqlname = BASE_PATH + "/"+DB_NAME+"_"
	            + DateUtil.getCurrentDateTime().replaceAll(" ", "_").replaceAll("-", "_").replaceAll(":", "_")+ ".sql";
	        String mysql = "mysqldump --user="+USERNAME+" --password="+PASSWORD+" --opt "+DB_NAME+" > "
	            + sqlname;
	        java.lang.Runtime.getRuntime().exec("cmd /c " + mysql);
	    } catch (Exception e) {
	        e.printStackTrace();
	        bool =false;
	    }
	    return bool;
    }

    public static boolean backlinux() {
    	boolean bool =true;
	    try {
	    	
	        String sqlname = BASE_PATH + "/"+DB_NAME+"_"
	            + DateUtil.getCurrentDateTime().replaceAll(" ", "_").replaceAll("-", "_").replaceAll(":", "_")+ ".sql";
	        String mysql = "mysqldump --user="+USERNAME+" --password="+PASSWORD+" --opt "+DB_NAME+" > "
	                + sqlname;
	        java.lang.Runtime.getRuntime().exec(
	            new String[] { "sh", "-c", mysql });
	    } catch (Exception e) {
	        e.printStackTrace();
	        bool =false;
	    }
	    return bool;
    }

    public static boolean executeBackUp()
    {
    	boolean bool =true;
    	String osName =OSUtil.getOSName();
    	int iPos =osName.indexOf("windwos");
    	if(iPos != -1)
    	{
    		bool =backwindows();
    	}
    	else
    	{
    		bool =backlinux();
    	}
    	return bool;
    }
  
}
