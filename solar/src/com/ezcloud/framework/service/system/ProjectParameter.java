package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.Row;

/**
 * 项目参数服务类
 * @author JianBoTong
 *
 */
@Component("frameworkProjectParameterService")
public class ProjectParameter extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select a.* ,b.project_name from pm_params a left join pm_project b on a.project_id = b.project_id where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from pm_params  a left join pm_project b on a.project_id=b.project_id   where 1=1 ";
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
		String PROJECT_ID = getRow().getString("PROJECT_ID", null);
		String PARA_NAME = getRow().getString("PARA_NAME", null);
		String PARA_VALUE = getRow().getString("PARA_VALUE", null);
		String NOTES = getRow().getString("NOTES", null);
		row.put("PROJECT_ID", PROJECT_ID);
		row.put("PARA_NAME", PARA_NAME);
		row.put("PARA_VALUE", PARA_VALUE);
		row.put("NOTES", NOTES);
		int PARA_ID = getTableSequence("pm_params", "para_id", 1);
		row.put("PARA_ID", PARA_ID);
		insert("pm_params", row);
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
		sql = "select * from pm_params where para_id='" + id + "'";
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
		String PARA_ID = getRow().getString("PARA_ID", null);
		String PROJECT_ID = getRow().getString("PROJECT_ID", null);
		String PARA_NAME = getRow().getString("PARA_NAME", null);
		String PARA_VALUE = getRow().getString("PARA_VALUE", null);
		String NOTES = getRow().getString("NOTES", null);
		row.put("PARA_ID", PARA_ID);
		row.put("PROJECT_ID", PROJECT_ID);
		row.put("PARA_NAME", PARA_NAME);
		row.put("PARA_VALUE", PARA_VALUE);
		row.put("NOTES", NOTES);
		update("pm_params", row, "para_id='" + PARA_ID + "'");
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
			sql = "delete from pm_params where para_id in(" + id + ")";
			update(sql);
		}
	}
	
	/**
	 * find project's param value by param name and project's id;
	 * @param project_id
	 * @param paramName
	 * @return
	 */
	public String queryParamValue(String project_id,String paramName)
	{
		String value =null;
		sql =" select para_value from pm_params where project_id='"+project_id+"' and para_name='"+paramName+"'";
		value =queryField(sql);
		return value;
	}
}
