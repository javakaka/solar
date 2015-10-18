package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 框架窗口维护
 * 
 * @author JianBoTong
 */
@Component("frameworkSystemWindowService")
public class SystemWindow extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from sm_window where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_window where 1=1 ";
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
		String WIN_TARGET = getRow().getString("WIN_TARGET", null);
		String WIN_DESC = getRow().getString("WIN_DESC", null);
		row.put("WIN_TARGET", WIN_TARGET);
		row.put("WIN_DESC", WIN_DESC);
		int WIN_ID = getTableSequence("sm_window", "win_id", 1);
		row.put("WIN_ID", WIN_ID);
		insert("sm_window", row);
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
		sql = "select * from sm_window where win_id='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String WIN_ID = getRow().getString("WIN_ID", null);
		String WIN_TARGET = getRow().getString("WIN_TARGET", null);
		String WIN_DESC = getRow().getString("WIN_DESC", null);
		Row row = new Row();
		row.put("WIN_ID", WIN_ID);
		row.put("WIN_TARGET", WIN_TARGET);
		row.put("WIN_DESC", WIN_DESC);
		update("sm_window", row, "WIN_ID='" + WIN_ID + "'");
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
			sql = "delete from sm_window where win_id in(" + id + ")";
			update(sql);
		}
	}

	public DataSet selectWindow() {
		DataSet ds = new DataSet();
		String sql = "select * from sm_window ";
		ds = queryDataSet(sql);
		return ds;
	}

}