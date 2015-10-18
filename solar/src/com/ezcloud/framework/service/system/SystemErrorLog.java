package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.utility.DateUtil;

/**
 * 系统错误日志服务类
 * @author JianBoTong
 *
 */

@Component("frameworkSystemErrorLogService")
public class SystemErrorLog extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from fm_error_log where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from fm_error_log  where 1=1 ";
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
		String OPERATE_TYPE = getRow().getString("OPERATE_TYPE", "notype");
		String SITE_NO = getRow().getString("SITE_NO", "");
		String POSI_NO = getRow().getString("POSI_NO", "");
		String STAFF_NO = getRow().getString("STAFF_NO", "");
		String CONTENT = getRow().getString("CONTENT", "");
		String LOG_TIME = getRow().getString("LOG_TIME", DateUtil.getCurrentDateTime());
		row.put("OPERATE_TYPE", OPERATE_TYPE);
		row.put("SITE_NO", SITE_NO);
		row.put("POSI_NO", POSI_NO);
		row.put("STAFF_NO", STAFF_NO);
		row.put("CONTENT", CONTENT);
		row.put("LOG_TIME", LOG_TIME);
		int LOG_ID = getTableSequence("fm_error_log", "log_id", 1);
		row.put("LOG_ID", LOG_ID);
		insert("fm_error_log", row);
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
		sql = "select * from fm_error_log   where error_id='" + id + "'";
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
			sql = "delete from fm_error_log where error_id in(" + id + ")";
			update(sql);
		}
	}
}
