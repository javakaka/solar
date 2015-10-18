package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.Row;

@Component("frameworkI18NService")
public class I18N  extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from fm_international_res where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from fm_international_res where 1=1 ";
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
		String RES_ITEM = getRow().getString("RES_ITEM", null);
		String LAN_NO = getRow().getString("LAN_NO", null);
		String RES = getRow().getString("RES", null);
		row.put("RES_ITEM", RES_ITEM);
		row.put("LAN_NO", LAN_NO);
		row.put("RES", RES);
		insert("fm_international_res", row);
	}
	
	/**
	 * 根据id查找
	 * 
	 * @return Row
	 * @throws
	 */
	public Row find() {
		Row row = new Row();
		String RES_ITEM = getRow().getString("RES_ITEM", null);
		String LAN_NO = getRow().getString("LAN_NO", null);
		sql = "select * from fm_international_res where res_item='" + RES_ITEM + "' and lan_no='"+LAN_NO+"'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String RES = getRow().getString("RES", null);
		String RES_ITEM = getRow().getString("RES_ITEM", null);
		String LAN_NO = getRow().getString("LAN_NO", null);
		Row row = new Row();
		row.put("RES", RES);
		update("fm_international_res", row, "RES_ITEM='" + RES_ITEM + "' and LAN_NO='"+LAN_NO+"'");
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
			sql = "delete from sm_window where win_id in(" + id + ")";
			update(sql);
		}
	}
}
