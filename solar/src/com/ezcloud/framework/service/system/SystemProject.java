package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 系统项目服务类
 * @author JianBoTong
 *
 */
@Component("frameworkProjectService")
public class SystemProject extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from pm_project where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from pm_project where 1=1 ";
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
		String PROJECT_NAME = getRow().getString("PROJECT_NAME", null);
		String PROJECT_ENAME = getRow().getString("PROJECT_ENAME", null);
		String PROJECT_DESC = getRow().getString("PROJECT_DESC", null);
		String BEGIN_DATE = getRow().getString("BEGIN_DATE", null);
		String DAYS = getRow().getString("DAYS", null);
		String COMPANY = getRow().getString("COMPANY", null);
		String CUSTOMER = getRow().getString("CUSTOMER", null);
		String ABOUT_US = getRow().getString("ABOUT_US", null);
		String CONTACT = getRow().getString("CONTACT", null);
		String SERVICES = getRow().getString("SERVICES", null);
		row.put("PROJECT_NAME", PROJECT_NAME);
		row.put("PROJECT_ENAME", PROJECT_ENAME);
		row.put("PROJECT_DESC", PROJECT_DESC);
		row.put("BEGIN_DATE", BEGIN_DATE);
		row.put("DAYS", DAYS);
		row.put("COMPANY", COMPANY);
		row.put("CUSTOMER", CUSTOMER);
		row.put("ABOUT_US", ABOUT_US);
		row.put("CONTACT", CONTACT);
		row.put("SERVICES", SERVICES);
		int PROJECT_ID = getTableSequence("pm_project", "project_id", 1);
		row.put("PROJECT_ID", PROJECT_ID);
		insert("pm_project", row);
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
		sql = "select * from pm_project where project_id='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String PROJECT_ID = getRow().getString("PROJECT_ID", null);
		String PROJECT_NAME = getRow().getString("PROJECT_NAME", null);
		String PROJECT_ENAME = getRow().getString("PROJECT_ENAME", null);
		String PROJECT_DESC = getRow().getString("PROJECT_DESC", null);
		String BEGIN_DATE = getRow().getString("BEGIN_DATE", null);
		String DAYS = getRow().getString("DAYS", null);
		String COMPANY = getRow().getString("COMPANY", null);
		String CUSTOMER = getRow().getString("CUSTOMER", null);
		String ABOUT_US = getRow().getString("ABOUT_US", null);
		String CONTACT = getRow().getString("CONTACT", null);
		String SERVICES = getRow().getString("SERVICES", null);
		Row row = new Row();
		row.put("PROJECT_NAME", PROJECT_NAME);
		row.put("PROJECT_ENAME", PROJECT_ENAME);
		row.put("PROJECT_DESC", PROJECT_DESC);
		row.put("BEGIN_DATE", BEGIN_DATE);
		row.put("DAYS", DAYS);
		row.put("COMPANY", COMPANY);
		row.put("CUSTOMER", CUSTOMER);
		row.put("ABOUT_US", ABOUT_US);
		row.put("CONTACT", CONTACT);
		row.put("SERVICES", SERVICES);
		update("pm_project", row, "project_id='" + PROJECT_ID + "'");
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
			sql = "delete from pm_project where project_id in(" + id + ")";
			update(sql);
		}
	}

	public DataSet selectAll()
	{
		DataSet ds =new DataSet();
		String sql ="select * from pm_project";
		ds =queryDataSet(sql);
		return ds;
	}
}
