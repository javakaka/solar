package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.Row;

/**
 * 系统模块维护
 * 
 * @ClassName: SystemMoudleController
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-16 下午07:05:27
 */
@Component("frameworkSystemMoudleService")
public class SystemMoudle extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from sm_moudle where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_moudle where 1=1 ";
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
		String MOUDLE_NAME = getRow().getString("MOUDLE_NAME", null);
		String MOUDLE_BEGIN_TAB = getRow().getString("MOUDLE_BEGIN_TAB", null);
		String MOUDLE_DESC = getRow().getString("MOUDLE_DESC", null);
		row.put("MOUDLE_NAME", MOUDLE_NAME);
		row.put("MOUDLE_BEGIN_TAB", MOUDLE_BEGIN_TAB);
		row.put("MOUDLE_DESC", MOUDLE_DESC);
		int MOUDLE_ID = getTableSequence("sm_moudle", "moudle_id", 1);
		row.put("MOUDLE_ID", MOUDLE_ID);
		insert("sm_moudle", row);
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
		sql = "select * from sm_moudle where moudle_id='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String MOUDLE_ID = getRow().getString("MOUDLE_ID", null);
		String MOUDLE_NAME = getRow().getString("MOUDLE_NAME", null);
		String MOUDLE_BEGIN_TAB = getRow().getString("MOUDLE_BEGIN_TAB", null);
		String MOUDLE_DESC = getRow().getString("MOUDLE_DESC", null);
		Row row = new Row();
		row.put("MOUDLE_ID", MOUDLE_ID);
		row.put("MOUDLE_NAME", MOUDLE_NAME);
		row.put("MOUDLE_BEGIN_TAB", MOUDLE_BEGIN_TAB);
		row.put("MOUDLE_DESC", MOUDLE_DESC);
		update("sm_moudle", row, "MOUDLE_ID='" + MOUDLE_ID + "'");
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
			sql = "delete from sm_moudle where moudle_id in(" + id + ")";
			update(sql);
		}
	}
}
