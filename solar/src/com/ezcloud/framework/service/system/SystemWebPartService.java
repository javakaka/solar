package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 系统OA桌面
 * 
 * @ClassName: SystemWebPartService
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-16 下午07:05:27
 */
@Component("frameworkSystemWebPartService")
public class SystemWebPartService extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage(Pageable pageable) {
		Page page = null;
		sql = "select * from oa_desktop_system_webpart where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from oa_desktop_system_webpart where 1=1 ";
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
	public void save(Row row) {
		String WEBPART_NO = String.valueOf(getTableSequence("oa_desktop_system_webpart", "webpart_no", 1));
		row.put("WEBPART_NO", WEBPART_NO);
		insert("oa_desktop_system_webpart", row);
	}

	/**
	 * 根据id查找
	 * 
	 * @return Row
	 * @throws
	 */
	public Row find(String id) {
		Row row = new Row();
		sql = "select * from oa_desktop_system_webpart where webpart_no='" + id + "'";
		row = queryRow(sql);
		return row;
	}
	
	public DataSet findAll() {
		DataSet ds =null;
		sql = "select * from oa_desktop_system_webpart ";
		ds = queryDataSet(sql);
		return ds;
	}
	
	public String getStaffWebPartSerial(String staff_no)
	{
		String serial ="";
		String sql ="select part_serial from oa_desktop_style where staff_no='"+staff_no+"' ";
		serial =queryField(sql);
		if(StringUtils.isEmptyOrNull(serial))
		{
			sql ="select webpart_no from oa_desktop_system_webpart where must_selected=1 ";
			DataSet ds =queryDataSet(sql);
			serial ="";
			String str3 = "";
		    String str4 = "";
		    String str5 = "";
		    int i = 0;
		    for( i=0;i<ds.size();i++)
		    {
		    	Row temp =(Row)ds.get(i);
		    	 if (i % 3 == 0)
		         {
		           if (str3.length() > 0)
		             str3 = str3 + ",";
		           str3 = str3 + temp.getString("webpart_no");
		         }
		         else if (i % 3 == 1)
		         {
		           if (str4.length() > 0)
		             str4 = str4 + ",";
		           str4 = str4 + temp.getString("webpart_no");
		         }
		         else if (i % 3 == 2)
		         {
		           if (str5.length() > 0)
		             str5 = str5 + ",";
		           str5 = str5 + temp.getString("webpart_no");
		         }
		    }
		    serial = str3 + "|" + str4 + "|" + str5;
		}
		return serial;
	}
	
	public void setStaffWebPartSerial(String part_serial,String staff_no)
	{
		String sql ="select count(*) from oa_desktop_style where staff_no='"+staff_no+"' ";
		int num =Integer.parseInt(queryField(sql));
		if(num >0)
		{
			sql ="update oa_desktop_style set part_serial='"+part_serial+"' where staff_no='"+staff_no+"' ";
			update(sql);
		}
		else
		{
			sql ="insert into oa_desktop_style (staff_no,part_serial,default_style) values ('"+staff_no+"','"+part_serial+"','0') ";
			update(sql);
		}
	}
	
	public String getStaffPortletSerial(String staff_no)
	{
		String serial ="";
		String sql ="select part_serial from oa_desktop_style where staff_no='"+staff_no+"' ";
		serial =queryField(sql);
		if(StringUtils.isEmptyOrNull(serial))
		{
			sql ="select webpart_no from oa_desktop_system_webpart where must_selected=1 ";
			DataSet ds =queryDataSet(sql);
			serial ="";
			int i = 0;
			for( i=0;i<ds.size();i++)
			{
				Row temp =(Row)ds.get(i);
				if (serial.length()>0)
				{
					serial +=",";
				}
				serial +=temp.getString("webpart_no");
			}
		}
		return serial;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update(Row row) {
		String WEBPART_NO =row.getString("WEBPART_NO","");
		update("oa_desktop_system_webpart", row, "webpart_no='" + WEBPART_NO + "'");
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
			sql = "delete from oa_desktop_system_webpart where webpart_no in(" + id + ")";
			update(sql);
		}
	}
}
