package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.Row;

/**
 * 静态参数值服务类
 * @author JianBoTong
 *
 */
@Component("frameworkSystemParamsItemService")
public class SystemParamsItem extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from sm_dictory where 1=1 ";
		String id =row.getString("di",null);
		if(id != null )
		{
			sql +=" and field_ename='"+id+"'";
		}
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_dictory where 1=1 ";
		if(id != null )
		{
			sql +=" and field_ename='"+id+"'";
		}
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
		String FIELD_ENAME = getRow().getString("FIELD_ENAME", null);
		String USED_VIEW = getRow().getString("USED_VIEW", null);
		String DISP_VIEW = getRow().getString("DISP_VIEW", null);
		String DISP_ORDER = getRow().getString("DISP_ORDER", "0");
		String NOTES = getRow().getString("NOTES", "");
		
		row.put("FIELD_ENAME", FIELD_ENAME);
		row.put("USED_VIEW", USED_VIEW);
		row.put("DISP_VIEW", DISP_VIEW);
		row.put("DISP_ORDER", DISP_ORDER);
		row.put("NOTES", NOTES);
		insert("sm_dictory", row);
	}

	/**
	 * 根据id查找
	 * 
	 * @return Row
	 * @throws
	 */
	public Row find() {
		Row row = new Row();
		String field_ename = getRow().getString("field_ename");
		String used_view = getRow().getString("used_view");
		sql = "select * from sm_dictory where field_ename='" + field_ename + "'  and  used_view='"+used_view+"'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		Row row = new Row();
		String FIELD_ENAME = getRow().getString("FIELD_ENAME", null);
		String USED_VIEW = getRow().getString("USED_VIEW", null);
		String DISP_VIEW = getRow().getString("DISP_VIEW", null);
		String DISP_ORDER = getRow().getString("DISP_ORDER", "0");
		String NOTES = getRow().getString("NOTES", "");
		
		row.put("DISP_VIEW", DISP_VIEW);
		row.put("DISP_ORDER", DISP_ORDER);
		row.put("NOTES", NOTES);
		update("sm_dictory", row, "field_ename='" + FIELD_ENAME + "' and used_view='"+USED_VIEW+"'");
	}

	/**
	 * 删除
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void delete(String... ids) {
		if (ids != null) {
			String arr[]=null;
			String field_ename=null;
			String used_view =null;
			for (int i = 0; i < ids.length; i++) {
				arr =ids[i].split("@");
				field_ename =arr[0];
				used_view =arr[1];
				sql = "delete from sm_dictory where field_ename='"+field_ename+"' && used_view='"+used_view+"'";
				update(sql);
			}
			
		}
	}
}
