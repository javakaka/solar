package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.Row;

/**
 * 系统Sql执行日志服务类
 * @author JianBoTong
 *
 */

@Component("frameworkSystemSqlLogService")
public class SystemSqlLog extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from fm_execute_sql where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from fm_execute_sql  where 1=1 ";
		countSql += restrictions;
		countSql += orders;
		long total = count(countSql);
		int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
		if (totalPages < pageable.getPageNumber()) {
			pageable.setPageNumber(totalPages);
		}
		int startPos = (pageable.getPageNumber() - 1) * pageable.getPageSize();
		sql += " limit " + startPos + " , " + pageable.getPageSize();
		dataSet = queryDataSet(sql);
		page = new Page(dataSet, total, pageable);
		return page;
	}

	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 */
	public void save() {
		Row row = new Row();
		String TYPE = getRow().getString("TYPE", "notype");
		String SSQL = getRow().getString("SSQL", "");
		String START_TIME = getRow().getString("START_TIME", "");
		String END_TIME = getRow().getString("END_TIME", "");
		String SPEND_TIME = getRow().getString("SPEND_TIME", "");
		String SQL_LENGTH = getRow().getString("SQL_LENGTH","0");
		row.put("TYPE", TYPE);
		row.put("SSQL", SSQL);
		row.put("START_TIME", START_TIME);
		row.put("END_TIME", END_TIME);
		row.put("SPEND_TIME", SPEND_TIME);
		row.put("SQL_LENGTH", SQL_LENGTH);
		int id = getTableSequence("fm_execute_sql", "id", 1);
		row.put("ID", id);
		insert("fm_execute_sql", row);
	}

	/**
	 * 根据id查找
	 * 
	 * @return Row
	 * @throws
	 */
	public Row find() {
		Row row = new Row();
		String id = getRow().getString("id");
		sql = "select * from fm_execute_sql   where id='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	

	/**
	 * 删除
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void delete(Long... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from fm_execute_sql where id in(" + id + ")";
			update(sql);
		}
	}
}
