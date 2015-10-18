package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 系统帐户服务类
 * @author JianBoTong
 *
 */
@Component("frameworkStaffService")
public class Staff extends Service{

	public int insert(Row row)
	{
		int rowNum =0;
		int id =getTableSequence("sm_staff", "staff_no", 10000);
		row.put("staff_no", id);
		insert("sm_staff",row);
		return rowNum;
	}
	
	public Row find(String id)
	{
		Row row =null;
		sql ="select * from sm_staff where staff_no ='"+id+"'";
		row =queryRow(sql);
		return row;
	}
	
	public void save()
	{
		Row staff =getRow();
		String staff_no =String.valueOf(getTableSequence("sm_staff", "staff_no", 10001));
		staff.put("staff_no", staff_no);
		insert("sm_staff", staff);
		getRow().put("staff_no", staff_no);
	}
	
	public int update(Row row)
	{
		int rowNum =0;
		String staff_no =row.getString("staff_no","");
		rowNum =update("sm_staff", row, " staff_no='"+staff_no+"'");
		return rowNum;
	}
	
	public DataSet queryStaffBySiteNo(String site_no)
	{
		DataSet ds =new DataSet();
		String sql ="select * from sm_staff where site_mo='"+site_no+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public Page queryStaffBySiteNo() 
	{
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		String site_no =row.getString("site_no",null);
		String sql ="select * from (select a.*,b.site_name from sm_staff a,sm_site b where a.site_no=b.site_no) as tab1 where site_no='"+site_no+"'";
		System.out.println("===========>>"+sql);
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql ="select count(*) from (select a.*,b.site_name from sm_staff a,sm_site b where a.site_no=b.site_no) as tab1 where site_no='"+site_no+"'";
		countSql += restrictions;
		long total = count(countSql);
		int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
		if (totalPages < pageable.getPageNumber()) {
			pageable.setPageNumber(totalPages);
		}
		int startPos = (pageable.getPageNumber() - 1) * pageable.getPageSize();
		sql += " limit " + startPos + " , " + pageable.getPageSize();
		dataSet =queryDataSet(sql);
		page = new Page(dataSet, total, pageable);
		return page;
	}
	
	public DataSet queryStaffByPosiNo(String site_no)
	{
		DataSet ds =new DataSet();
		
		return ds;
	}
	
	public Page queryStaffByPosiNo() 
	{
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		String posi_no =row.getString("posi_no",null);
		String sql ="select * from (select a.*,b.posi_no,b.posi_name,d.SITE_NAME from sm_staff a,sm_position b ,sm_staff_position c,sm_site d where a.STAFF_NO=c.STAFF_NO and b.POSI_NO=c.POSI_NO and b.SITE_NO=d.SITE_NO) as tab1 where posi_no='"+posi_no+"'";
		System.out.println("===========>>"+sql);
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql ="select count(*) from (select a.*,b.posi_no,b.posi_name,d.SITE_NAME from sm_staff a,sm_position b ,sm_staff_position c,sm_site d where a.STAFF_NO=c.STAFF_NO and b.POSI_NO=c.POSI_NO and b.SITE_NO=d.SITE_NO) as tab1 where posi_no='"+posi_no+"'";
		countSql += restrictions;
		long total = count(countSql);
		int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
		if (totalPages < pageable.getPageNumber()) {
			pageable.setPageNumber(totalPages);
		}
		int startPos = (pageable.getPageNumber() - 1) * pageable.getPageSize();
		sql += " limit " + startPos + " , " + pageable.getPageSize();
		dataSet =queryDataSet(sql);
		page = new Page(dataSet, total, pageable);
		return page;
	}
	
	
	public void deleteStaff(Long... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from sm_staff where staff_no in(" + id + ")";
			update(sql);
			//delete staff_role
			sql ="delete from sm_staff_role where staff_no in (select staff_no from sm_staff where bureau_no in("+id+"))  ";
			update(sql);
		}
	}
	
	public boolean isStaffNameExisted(String staff_name,String bureau_no)
	{
		boolean bool =false;
		sql ="select count(*) as num from sm_staff where staff_name ='"+staff_name+"' and site_no in ( select site_no from sm_site where bureau_no='"+bureau_no+"')";
		int num =Integer.parseInt(queryField(sql));
		if(num >0)
		{
			bool =true;
		}
		return bool;
		
	}
	
	public boolean isStaffNameExisted(String staff_no,String staff_name,String bureau_no)
	{
		boolean bool =false;
		sql ="select count(*) as num from sm_staff where staff_no !='"+staff_no+"' and staff_name ='"+staff_name+"' and site_no in ( select site_no from sm_site where bureau_no='"+bureau_no+"')";
		int num =Integer.parseInt(queryField(sql));
		if(num >0)
		{
			bool =true;
		}
		return bool;
		
	}
	
}
