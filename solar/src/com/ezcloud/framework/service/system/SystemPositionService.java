package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 岗位
 * @author JianBoTong
 *
 */

@Component("frameworkPositionService")
public class SystemPositionService extends Service {
	
	public int insert(Row row )
	{
		int rowNum =0;
		int posi_no =getTableSequence("sm_position", "posi_no", 1);
		row.put("posi_no", posi_no);
		System.out.print("===inssert row===>>"+row);
		rowNum = insert("sm_position", row);
		return rowNum;
	}
	
	public Row find(String posi_no)
	{
		Row row =null;
		sql ="select * from sm_position where posi_no='"+posi_no+"'";
		row =queryRow(sql);
		return row;
	}
	
	public int update(Row row)
	{
		int rowNum =0;
		String posi_no =row.getString("posi_no","");
		rowNum =update("sm_position", row, " posi_no ='"+posi_no+"'");
		return rowNum;
	}

	/**
	 * 
	 * 查询部门下属岗位
	 * @return
	 */
	public DataSet queryPositionsBySiteNo()
	{
		DataSet ds =new DataSet();
		String site_no =this.getRow().getString("site_no",null);
		if(site_no == null)
		return ds;
		sql ="select * from sm_position where site_no='"+site_no+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 
	 * 查询区域所有岗位
	 * @return
	 */
	public DataSet queryBureauPositions(String bureau_no)
	{
		DataSet ds =new DataSet();
		sql ="select * from sm_position where site_no in (select site_no from sm_site where bureau_no='"+bureau_no+"')";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 
	 * 查询部门下属岗位
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Page querySitePositions() 
	{
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		String site_no =row.getString("site_no",null);
//		sql ="select * from sm_position where site_no='"+site_no+"' ";
		sql ="select * from (select a.*,b.SITE_NAME from sm_position a,sm_site b where  a.SITE_NO=b.SITE_NO ) as tab1 where site_no='"+site_no+"' ";
		System.out.println("===========>>"+sql);
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql ="select count(*) from (select a.*,b.SITE_NAME from sm_position a,sm_site b where  a.SITE_NO=b.SITE_NO ) as tab1 where site_no='"+site_no+"' ";
		countSql += restrictions;
//		countSql += orders;
		long total = count(countSql);
		int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
		if (totalPages < pageable.getPageNumber()) {
			pageable.setPageNumber(totalPages);
		}
		int startPos = (pageable.getPageNumber() - 1) * pageable.getPageSize();
		sql += " limit " + startPos + " , " + pageable.getPageSize();
		dataSet = queryDataSet(sql);
		for(int i=0;i<dataSet.size();i++)
		{
			Row temp =(Row)dataSet.get(i);
			String up_id =temp.getString("up_posi_no","");
			String up_posi_name =getUpPositionName(up_id,dataSet);
			temp.put("up_posi_name", up_posi_name);
			dataSet.set(i, temp);
		}
		page = new Page(dataSet, total, pageable);
		return page;
	}
	
	public static String getUpPositionName(String up_id,DataSet ds)
	{
		String posi_name ="";
		String row_id ="";
		for (int i=0; i<ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			row_id =row.getString("posi_no","");
			if(row_id != null && row_id.replace(" ", "").length() >0 && row_id.equals(up_id))
			{
				posi_name =row.getString("posi_name","");
				break;
			}
		}
		return posi_name;
	}
	
	public void savePositionRoleAuth(String posi_no,  DataSet ds)
	{
		if(ds == null || ds.size() ==0 ){
			return ;
		}
		sql ="delete from sm_position where posi_no ='"+posi_no+"'";
		update(sql);
		for(int i=0; i< ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			insert("sm_position", row);
		}
	}
}
