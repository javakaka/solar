package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

@Component("frameworkSystemRoleService")
public class SystemRole extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from sm_role where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_role where 1=1 ";
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
		String BUREAU_NO=getRow().getString("BUREAU_NO","");
		String ROLE_NAME=getRow().getString("ROLE_NAME","");
		String ROLE_DESC=getRow().getString("ROLE_DESC","");
		String ROLE_BEGINTIME=getRow().getString("ROLE_BEGINTIME","");
		String ROLE_ENDTIME=getRow().getString("ROLE_ENDTIME","");
		// default 0 
		String STATE=getRow().getString("STATE","0");
		row.put("BUREAU_NO", BUREAU_NO);
		row.put("ROLE_NAME", ROLE_NAME);
		row.put("ROLE_DESC", ROLE_DESC);
		row.put("ROLE_BEGINTIME", ROLE_BEGINTIME);
		row.put("ROLE_ENDTIME", ROLE_ENDTIME);
		row.put("STATE", STATE);
		
		int ROLE_ID = getTableSequence("sm_role", "role_id", 10001);
		row.put("ROLE_ID", ROLE_ID);
		insert("sm_role", row);
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
		sql = "select * from sm_role where role_id='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String ROLE_ID=getRow().getString("ROLE_ID","");
		String BUREAU_NO=getRow().getString("BUREAU_NO","");
		String ROLE_NAME=getRow().getString("ROLE_NAME","");
		String ROLE_DESC=getRow().getString("ROLE_DESC","");
		String ROLE_BEGINTIME=getRow().getString("ROLE_BEGINTIME","");
		String ROLE_ENDTIME=getRow().getString("ROLE_ENDTIME","");
		// default 0 
		String STATE=getRow().getString("STATE","0");
		Row row = new Row();
		row.put("ROLE_ID", ROLE_ID);
		row.put("BUREAU_NO", BUREAU_NO);
		row.put("ROLE_NAME", ROLE_NAME);
		row.put("ROLE_DESC", ROLE_DESC);
		row.put("ROLE_BEGINTIME", ROLE_BEGINTIME);
		row.put("ROLE_ENDTIME", ROLE_ENDTIME);
		row.put("STATE", STATE);
		update("sm_role", row, " role_id='"+ROLE_ID+"'");
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
			sql = "delete from sm_role where role_id in(" + id + ")";
			update(sql);
		}
	}

	public DataSet findAll()
	{
		DataSet ds=new DataSet();
		sql ="select * from sm_role ";
		ds =queryDataSet(sql);
		return ds;
	}
}