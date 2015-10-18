/**
 * @Title: DBUtil.java
 * @Package com.ezcloud.framework.util
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-11 下午08:43:17
 * @version V1.0
 */
package com.ezcloud.framework.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @ClassName: DBUtil
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-11 下午08:43:17
 */
public class DBUtil {
	/**
	 * 获取ResultSet的字段名称信息
	 * 
	 * @return DataSet
	 * @throws SQLException
	 */
	public static ArrayList<String> getResultSetColnumNames(ResultSet rs) throws SQLException {
		ArrayList<String> list = null;
		if (rs == null)
			return list;
		list = new ArrayList<String>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		for (int i = 1; i <= colCount; i++) {
			String colName = rsmd.getColumnName(i);
			String colLabel = rsmd.getColumnLabel(i);
			if(colName.equals(colLabel))
			{
				list.add(colName);
			}
			else
			{
				list.add(colLabel);
			}
		}
		return list;
	}
}
