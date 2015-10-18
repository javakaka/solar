package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 静态参数服务类
 * @author JianBoTong
 *
 */
@Component("frameworkSystemParamsService")
public class SystemParams extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from sm_dictory_item where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_dictory_item where 1=1 ";
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
		String FIELD_NAME = getRow().getString("FIELD_NAME", null);
		String ITEM_TITLE = getRow().getString("ITEM_TITLE", null);
		String NOTES = getRow().getString("NOTES", null);
		String ONLY_VIEW = getRow().getString("ONLY_VIEW", "0");
		
		row.put("FIELD_NAME", FIELD_NAME);
		row.put("ITEM_TITLE", ITEM_TITLE);
		row.put("NOTES", NOTES);
		row.put("ONLY_VIEW", ONLY_VIEW);
		insert("sm_dictory_item", row);
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
		sql = "select * from sm_dictory_item where field_name='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String FIELD_NAME = getRow().getString("FIELD_NAME", null);
		String ITEM_TITLE = getRow().getString("ITEM_TITLE", null);
		String NOTES = getRow().getString("NOTES", null);
		String ONLY_VIEW = getRow().getString("ONLY_VIEW", "0");
		Row row = new Row();
//		row.put("FIELD_NAME", FIELD_NAME);
		row.put("ITEM_TITLE", ITEM_TITLE);
		row.put("NOTES", NOTES);
		row.put("ONLY_VIEW", ONLY_VIEW);
		update("sm_dictory_item", row, "field_name='" + FIELD_NAME + "'");
	}

	/**
	 * 删除
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void delete(String... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from sm_dictory_item where field_name in(" + id + ")";
			update(sql);
			sql = "delete from sm_dictory where field_ename in(" + id + ")";
			update(sql);
		}
	}

	public DataSet selectAll()
	{
		DataSet ds =new DataSet();
		String sql ="select * from sm_dictory_item";
		ds =queryDataSet(sql);
		return ds;
	}
}
