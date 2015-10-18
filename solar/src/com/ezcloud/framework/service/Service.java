/**
 * @Title: Service.java
 * @Package com.ezcloud.framework.service
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-11 上午10:45:50
 * @version V1.0
 */
package com.ezcloud.framework.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;


import com.ezcloud.framework.page.jdbc.Direction;
import com.ezcloud.framework.page.jdbc.Filter;
import com.ezcloud.framework.page.jdbc.Filter.Operator;
import com.ezcloud.framework.page.jdbc.Order;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.util.DBUtil;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 基于spring jdbc的基础服务类
 * 
 * @ClassName: Service
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-11 上午10:45:50
 */
public class Service {

	@Resource(name = "jdbcTemplate")
	protected JdbcTemplate jdbcTemplate;
	protected DataSet dataSet;
	protected Row row;
	protected ResultSet oResultSet;
	protected String sql;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public DataSet getDataSet() {
		return dataSet;
	}

	public void setDataSet(DataSet dataSet) {
		this.dataSet = dataSet;
	}

	public Row getRow() {
		return row;
	}

	public void setRow(Row row) {
		this.row = row;
	}

	public ResultSet getoResultSet() {
		return oResultSet;
	}

	public void setoResultSet(ResultSet oResultSet) {
		this.oResultSet = oResultSet;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public Service() {
		super();
		dataSet = new DataSet();
		row = new Row();
		sql = "";
	}

	// 计算表记录总数
	@SuppressWarnings("deprecation")
	public int count(String sql) {
		int total = 0;
		total = jdbcTemplate.queryForInt(sql);
		return total;
	}

	// 更新
	public int update(String tableName, Row row, String where) {
		int rowNum = 0;
		if (tableName == null || tableName.replace(" ", "").length() == 0)
			return rowNum;
		if (where == null || where.replace(" ", "").length() == 0)
			return rowNum;
		if (row == null)
			return rowNum;
		if (row.keySet().size() == 0)
			return rowNum;
		Object[] colnums = row.keySet().toArray();
		sql = "update " + tableName + " set ";
		String colName = "";
		String colValue = "";
		int notNullValueIndex =0;
		for (int i = 0; i < colnums.length; i++) {
			colName = (String) colnums[i];
			colValue = row.getString(colName,null);
			if(colValue != null && colValue.replace(" ", "").length() > 0)
			{
				if (notNullValueIndex > 0) {
					sql += ",";
				}
				sql += colName + "='" + colValue + "' ";
				notNullValueIndex ++;
			}
		}
		sql += " where " + where;
		rowNum = jdbcTemplate.update(sql);
		return rowNum;
	}
	// 更新
	public int updateIncludeEmpty(String tableName, Row row, String where) {
		int rowNum = 0;
		if (tableName == null || tableName.replace(" ", "").length() == 0)
			return rowNum;
		if (where == null || where.replace(" ", "").length() == 0)
			return rowNum;
		if (row == null)
			return rowNum;
		if (row.keySet().size() == 0)
			return rowNum;
		Object[] colnums = row.keySet().toArray();
		sql = "update " + tableName + " set ";
		String colName = "";
		String colValue = "";
		int notNullValueIndex =0;
		for (int i = 0; i < colnums.length; i++) {
			colName = (String) colnums[i];
			colValue = row.getString(colName,null);
			if(colValue != null)
			{
				if (notNullValueIndex > 0) {
					sql += ",";
				}
				sql += colName + "='" + colValue + "' ";
				notNullValueIndex ++;
			}
		}
		sql += " where " + where;
		rowNum = jdbcTemplate.update(sql);
		return rowNum;
	}

	// 更新
	public int update(String sql) {
		int rowNum = 0;
		rowNum = jdbcTemplate.update(sql);
		return rowNum;
	}

	// 批量更新
	public int updateBatch(DataSet ds) {
		int rowNum = 0;
		if (ds == null || ds.size() == 0)
			return rowNum;
		for (int i = 0; i < ds.size(); i++) {
			String sqll = (String) ds.get(i);
			rowNum += update(sqll);
		}
		return rowNum;
	}

	// 新增
	public int insert(String tableName, Row row) {
		int rowNum = 0;
		if (tableName == null || tableName.replace(" ", "").length() == 0)
			return rowNum;
		if (row == null)
			return rowNum;
		if (row.keySet().size() == 0)
			return rowNum;
		Object[] colnums = row.keySet().toArray();

		String colNames = "";
		String colName = "";
		String colValues = "";
		for (int i = 0; i < colnums.length; i++) {
			if (i > 0) {
				colNames += ",";
				colValues += ",";
			}
			colName = (String) colnums[i];
			colNames += colName;
			colValues += "'" + row.getString(colName) + "'";
		}
		String sql = "";
		sql += "insert into " + tableName + "(" + colNames + ") values (" + colValues + ")";
		System.out.println("sql:" + sql);
		rowNum = jdbcTemplate.update(sql);
		return rowNum;
	}

	// 新增
	public int insert(String sql) {
		int rowNum = 0;
		rowNum = jdbcTemplate.update(sql);
		return rowNum;
	}

	// 查询
	public int query(String sql) {
		int rowNum = 0;
		return rowNum;
	}

	// 查询一个字段
	public String queryField(String sql) {
		String fieldValue = null;
		try {
			fieldValue = (String) jdbcTemplate.queryForObject(sql, new RowMapper<Object>() {
				public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					String value = null;
					value = rs.getString(1);
					return value;
				}
			});
		} catch (Exception exp) {
			System.out.println("jdbc:没有此记录" + sql);
			fieldValue = null;
		}
		return fieldValue;
	}

	// 查询一个字段,指定默认值
	public String queryField(String sql, String defaultValue) {
		String fieldValue = null;
		try {
			fieldValue = (String) jdbcTemplate.queryForObject(sql, new RowMapper<Object>() {
				public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					String value = null;
					value = rs.getString(1);
					return value;
				}
			});
		} catch (Exception exp) {
			fieldValue = null;
		}
		if (fieldValue == null) {
			fieldValue = defaultValue;
		}
		return fieldValue;
	}

	// 查询一行数据
	public Row queryRow(String sql) {
		Row row = null;
		try {
			row = jdbcTemplate.queryForObject(sql, new RowMapper<Row>() {
				public Row mapRow(ResultSet rs, int row) throws SQLException {
					ArrayList<String> list = DBUtil.getResultSetColnumNames(rs);
					Row tempRow = new Row();
					String fieldName = null;
					String fieldValue = null;
					for (int i = 0; i < list.size(); i++) {
						fieldName = list.get(i);
						fieldValue = rs.getString(fieldName);
						if(fieldValue == null || fieldValue.replace(" ", "").length() ==0)
						{
							fieldValue ="";
						}
						tempRow.put(fieldName, fieldValue);
					}
					return tempRow;
				}
			});
		} catch (EmptyResultDataAccessException exp) {
			System.out.println("jdbc:没有此记录" + sql);
			row = null;
		}
		return row;
	}

	// 查询多行数据
	public DataSet queryDataSet(String sql) {
		final DataSet ds = new DataSet();
		jdbcTemplate.query(sql, new RowCallbackHandler() {
			@SuppressWarnings( { "unchecked" })
			public void processRow(ResultSet rs) throws SQLException {
				Row row = new Row();
				ArrayList<String> list = DBUtil.getResultSetColnumNames(rs);
				String fieldName = null;
				String fieldValue = null;
				for (int i = 0; i < list.size(); i++) {
					fieldName = list.get(i);
					fieldValue = rs.getString(fieldName);
					if(fieldValue == null || fieldValue.replace(" ","").equals(""))
					{
						fieldValue ="";
					}
					row.put(fieldName, fieldValue);
				}
				ds.add(row);
			}
		});
		return ds;
	}

	// 新增记录时查询主键id的值
	@SuppressWarnings("deprecation")
	public int getTableSequence(String tableName, String fieldName, int defaultSequenceValue) {
		int sequence = 1000;
		String sql = "select max(" + fieldName + ") from " + tableName;
		sequence = jdbcTemplate.queryForInt(sql) + 1;
		if (sequence == 1) {
			sequence = defaultSequenceValue;
		}
		return sequence;
	}
	
	@SuppressWarnings("deprecation")
	public int getTableSequenceOfVarcharField(String tableName, String fieldName, int defaultSequenceValue) {
		int sequence = 1000;
		String sql = "select max(" + fieldName + "*1) from " + tableName;
		sequence = jdbcTemplate.queryForInt(sql) + 1;
		if (sequence == 0) {
			sequence = defaultSequenceValue;
		}
		return sequence;
	}
	
	// 新增记录时查询主键id的值
		@SuppressWarnings("deprecation")
		public int getTableSequenceOfStringToInteger(String tableName, String fieldName, int defaultSequenceValue) {
			int sequence = 1000;
			String sql = "select max(" + fieldName + "*1) from " + tableName;
			sequence = jdbcTemplate.queryForInt(sql) + 1;
			if (sequence == 0) {
				sequence = defaultSequenceValue;
			}
			return sequence;
		}

	// 从请求中抽取查询限制条件，并拼接为字符串
	public String addRestrictions(Pageable pageable) {
		String restrictions = "";
		if (pageable == null) {
			return restrictions;
		}
		if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
			restrictions += " and " + pageable.getSearchProperty() + " like " + "'%" + pageable.getSearchValue() + "%'";
		}
		if (pageable.getFilters() != null) {
			for (Filter filter : pageable.getFilters()) {
				if (filter == null || StringUtils.isEmpty(filter.getProperty())) {
					continue;
				}
				if (filter.getOperator() == Operator.eq && filter.getValue() != null) {
					// 忽略大小写
					if (filter.getIgnoreCase() != null && filter.getIgnoreCase() && filter.getValue() instanceof String) {
						restrictions += " and " + filter.getProperty() + "='" + ((String) filter.getValue()).toLowerCase() + "'";
					} else {
						restrictions += " and " + filter.getProperty() + "='" + ((String) filter.getValue()) + "'";
					}
				} else if (filter.getOperator() == Operator.ne && filter.getValue() != null) {
					// 忽略大小写
					if (filter.getIgnoreCase() != null && filter.getIgnoreCase() && filter.getValue() instanceof String) {
						restrictions += " and " + filter.getProperty() + "!='" + ((String) filter.getValue()).toLowerCase() + "'";
					} else {
						restrictions += " and " + filter.getProperty() + "!='" + ((String) filter.getValue()) + "'";
					}
				} else if (filter.getOperator() == Operator.gt && filter.getValue() != null) {
					restrictions += " and " + filter.getProperty() + ">'" + ((String) filter.getValue()) + "'";
				} else if (filter.getOperator() == Operator.lt && filter.getValue() != null) {
					restrictions += " and " + filter.getProperty() + "<'" + ((String) filter.getValue()) + "'";
				} else if (filter.getOperator() == Operator.ge && filter.getValue() != null) {
					restrictions += " and " + filter.getProperty() + ">='" + ((String) filter.getValue()) + "'";
				} else if (filter.getOperator() == Operator.le && filter.getValue() != null) {
					restrictions += " and " + filter.getProperty() + "<='" + ((String) filter.getValue()) + "'";
				} else if (filter.getOperator() == Operator.like && filter.getValue() != null && filter.getValue() instanceof String) {
					restrictions += " and " + filter.getProperty() + "like'" + ((String) filter.getValue()) + "'";
				} else if (filter.getOperator() == Operator.in && filter.getValue() != null) {
					restrictions += " and " + filter.getProperty() + "in ('" + ((String) filter.getValue()) + "')";
				} else if (filter.getOperator() == Operator.isNull) {
					restrictions += " and " + filter.getProperty() + " IS NULL ";
				} else if (filter.getOperator() == Operator.isNotNull) {
					restrictions += " and " + filter.getProperty() + " IS NOT NULL ";
				}
			}
		}
		return restrictions;
	}

	// 从请求中抽取排序条件，并拼接为字符串
	public String addOrders(Pageable pageable) {
		String orders = "";
		if (pageable == null) {
			return orders;
		}
		if (StringUtils.isNotEmpty(pageable.getOrderProperty()) && pageable.getOrderDirection() != null) {
			if (pageable.getOrderDirection() == Direction.asc) {
				orders += " order by " + pageable.getOrderProperty() + " asc ";
			} else if (pageable.getOrderDirection() == Direction.desc) {
				orders += " order by " + pageable.getOrderProperty() + " desc ";
			}
		}
		if (pageable.getOrders() != null) {
			for (Order order : pageable.getOrders()) {
				if (order.getDirection() == Direction.asc) {
					if (orders.length() == 0) {
						orders += " order by " + order.getProperty() + " asc ";
					} else {
						orders += "," + order.getProperty() + " asc ";
					}
				} else if (order.getDirection() == Direction.desc) {
					if (orders.length() == 0) {
						orders += " order by " + order.getProperty() + " desc ";
					} else {
						orders += "," + order.getProperty() + " desc ";
					}
				}
			}
		}
		return orders;
	}
}
