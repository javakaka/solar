package com.ezcloud.framework.service.system;

import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

@Component("frameworkSystemOrgQueryService")
public class SystemOrgQuery extends Service {
	
	@SuppressWarnings("unchecked")
	public DataSet getOrgPosiStaffXTree() {
		 String bureau_no = this.getRow().get("bureau_no", "").toString();
		    if (bureau_no.length() == 0)
		    {
//		    	bureau_no = this.getRow().get("bureau-no").toString();
		    	bureau_no = "10001";
		    }
		    DataSet localDataSet = new DataSet();
		    sql = "select bureau_no, bureau_name from sm_bureau where bureau_no='" + bureau_no + "'";
		    DataSet tempDataSet = new DataSet();
		    tempDataSet =queryDataSet(sql);
		    for(int i=0; i<tempDataSet.size(); i++)
		    {
		    	Row row1 =new Row();
		    	Row row2 =new Row();
		    	row1 =(Row)tempDataSet.get(i);
		    	row2.put("ID","B" + bureau_no);
		    	row2.put("UP_ID", "0");
		    	row2.put("NAME", row1.getString("bureau_name"));
		    	row2.put("TYPE", "0");
		    	localDataSet.add(row2);
		    }
//		    this.oResultSet = DataAccess.query(sql, this.oStatement);
//		    while (this.oResultSet.next())
//		    {
//		      Row row = new Row();
//		      row.put("ID", "B" + bureau_no);
//		      row.put("UP_ID", "-1");
//		      row.put("NAME", this.oResultSet.getString("bureau_name"));
//		      row.put("TYPE", "0");
//		      localDataSet.add(row);
//		    }
		    sql = "select posi_no, up_posi_no, posi_name from sm_position where state=1 and site_no in(select site_no from sm_site where bureau_no='" + bureau_no + "')";
		    tempDataSet =queryDataSet(sql);
		    for(int i=0; i<tempDataSet.size(); i++)
		    {
		    	Row row1 =new Row();
		    	Row row2 =new Row();
		    	row1 =(Row)tempDataSet.get(i);
		    	row2.put("ID","P" +row1.getString("posi_no"));
		    	String up_id =row1.getString("up_posi_no");
		    	if(up_id == null || up_id.equals("0"))
		    	{
		    		row2.put("UP_ID", "B" + bureau_no);
		    	}
		    	else
		    	{
		    		row2.put("UP_ID", "P" + up_id);
		    	}
		    	row2.put("NAME", row1.getString("posi_name"));
		    	row2.put("TYPE", "1");
		    	localDataSet.add(row2);
		    }
//		    this.oResultSet = DataAccess.query(sql, this.oStatement);
//		    while (this.oResultSet.next())
//		    {
//		      Row row = new Row();
//		      row.put("ID", "P" + this.oResultSet.getString("posi_no"));
//		      if ((this.oResultSet.getString("up_posi_no") == null) || (this.oResultSet.getString("up_posi_no").equals("0")))
//		      {
//		    	  row.put("UP_ID", "B" + bureau_no);
//		      }
//		      else
//		      {
//		    	  row.put("UP_ID", "P" + this.oResultSet.getString("up_posi_no"));
//		      }
//		      row.put("NAME", this.oResultSet.getString("posi_name"));
//		      row.put("TYPE", "1");
//		      localDataSet.add(row);
//		    }
//		    this.oResultSet.close();
		    sql = "select count(*) as num,a.staff_no as staffno from sm_staff a,sm_staff_position b, sm_position c where a.staff_no=b.staff_no and b.posi_no=c.posi_no and a.state=1 and c.state=1 and a.site_no in (select site_no from sm_site where bureau_no='" + bureau_no + "') group by a.staff_no";
		    DataSet staffDataSet = new DataSet();
		    tempDataSet =queryDataSet(sql);
		    DataSet tempDataSet2 =null;
		    for(int i=0;i<tempDataSet.size(); i++)
		    {
		    	Row row1 =new Row();
		    	Row row2 =new Row();
		    	row1 =(Row)tempDataSet.get(i);
		    	int num =Integer.parseInt(row1.getString("num"));
		    	if ( num > 1 )
		    		staffDataSet.add(row1.getString("staffno"));
		    	sql = "select a.staff_no,b.posi_no,a.real_name from sm_staff a, sm_staff_position b, sm_position c where a.staff_no=b.staff_no and b.posi_no=c.posi_no and c.state=1 and a.state=1  and a.site_no in (select site_no from sm_site where bureau_no='" + bureau_no + "')";
		    	tempDataSet2 =queryDataSet(sql);
		    	for(int j =0;j<tempDataSet2.size(); j++)
		    	{
		    		Row row3 =(Row)tempDataSet2.get(j);
		    		row2.put("ID", "S" + row3.getString("staff_no"));
		    		row2.put("UP_ID", "P" + row3.getString("posi_no"));
		    		String str2 = row3.getString("real_name");
//一个人员有多个岗位的情况		    		
//				      if (((DataSet)staffDataSet).contains(this.oResultSet.getString("staff_no").substring(1)))
//				        str2 = str2 + "*";
		    		row2.put("NAME", str2);
		    		row2.put("TYPE", "2");
		    		localDataSet.add(row2);
		    	}
		    }
//		    this.oResultSet = DataAccess.query(sql, this.oStatement);
//		    while (this.oResultSet.next())
//		    {
//			    if (this.oResultSet.getInt(1) > 1)
//			       ((DataSet)staffDataSet).add(this.oResultSet.getString(2));
//			    sql = ("select a.staff_no,b.posi_no,a.real_name from sm_staff a, sm_staff_position b, sm_position c where a.staff_no=b.staff_no and b.posi_no=c.posi_no and c.state=1 and a.state=1  and a.site_no in (select site_no from sm_site where bureau_no='" + bureau_no + "')");
//			    this.oResultSet = DataAccess.query(sql, this.oStatement);
//			    while (this.oResultSet.next())
//			    {
//			      Row localRow = new Row();
//			      localRow.put("ID", "S" + this.oResultSet.getString("staff_no"));
//			      localRow.put("UP_ID", "P" + this.oResultSet.getString("posi_no"));
//			      String str2 = Row.getString(this.oResultSet, "real_name");
//			      if (((DataSet)staffDataSet).contains(this.oResultSet.getString("staff_no").substring(1)))
//			        str2 = str2 + "*";
//			      localRow.put("NAME", str2);
//			      localRow.put("TYPE", "2");
//			      localDataSet.add(localRow);
//			    }
//			    this.ovo.set("POSISTAFF", localDataSet);
//		    }
		    System.out.print("posi ====>>"+localDataSet);
		    return localDataSet;
	}
	
	
	/** 部门岗位树*/
	@SuppressWarnings("unchecked")
	public DataSet getDeptPostionXTree() throws JException, SQLException
	{
		DataSet localDataSet =new DataSet();
//		Row localRow1 = (Row)this.ivo.get("staff-sub-fun", null);
		String bureau_no = null;
//		if ((localRow1 != null) && (localRow1.containsKey("2")))
//		{
//			bureau_no = this.ivo.get("bureau-no").toString();
//		}
		sql = "select bureau_no, bureau_name from sm_bureau";
		if (bureau_no != null)
		{
			sql = sql + " where bureau_no='" + bureau_no + "'";
		}
		DataSet tempDataSet = queryDataSet(sql);
		for(int i=0; i<tempDataSet.size(); i++)
		{
			Row row1 =new Row();
			row1 =(Row)tempDataSet.get(i);
			Row row2 =new Row();
			row2.put("ID", "B" + row1.getString("bureau_no"));
			row2.put("NAME", row1.getString("bureau_name"));
			row2.put("UP_ID", "0");
			row2.put("TYPE", "0");
			localDataSet.add(row2);
		}
//		while (this.oResultSet.next())
//		{
//			localRow2 = new Row();
//			localRow2.put("ID", "B" + this.oResultSet.getString("bureau_no"));
//			localRow2.put("NAME", this.oResultSet.getString("bureau_name"));
//			localRow2.put("UP_ID", "-1");
//			localRow2.put("TYPE", "0");
//			localDataSet.add(localRow2);
//		}
//		this.oResultSet.close();
		sql = "select posi_no, posi_name, site_no from sm_position where state=1";
		tempDataSet =queryDataSet(sql);
		for(int i=0;i<tempDataSet.size(); i++)
		{
			Row row1 =(Row)tempDataSet.get(i);
			Row row2 =new Row();
			row2.put("ID", "P" + row1.getString("posi_no"));
			row2.put("NAME", row1.getString("posi_name"));
			row2.put("UP_ID", row1.getString("site_no"));
			row2.put("TYPE", "1");
			localDataSet.add(row2);
		}
//		while (this.oResultSet.next())
//		{
//			localRow2 = new Row();
//			localRow2.put("ID", "P" + this.oResultSet.getString("posi_no"));
//			localRow2.put("NAME", this.oResultSet.getString("posi_name"));
//			localRow2.put("UP_ID", this.oResultSet.getString("site_no"));
//			localRow2.put("TYPE", "1");
//			localDataSet.add(localRow2);
//		}
		sql = "select site_no, site_name, bureau_no from sm_site where ISNULL(up_site_no)=1";
		tempDataSet =queryDataSet(sql);
		for(int i=0;i<tempDataSet.size(); i++)
		{
			Row row1 =(Row)tempDataSet.get(i);
			Row row2 =new Row();
			row2.put("ID", row1.getString("site_no"));
			row2.put("NAME", row1.getString("site_name"));
			row2.put("UP_ID","B" +  row1.getString("bureau_no"));
			row2.put("TYPE", "0");
			localDataSet.add(row2);
		}
//		while (this.oResultSet.next())
//		{
//			localRow2 = new Row();
//			localRow2.put("ID", this.oResultSet.getString("site_no"));
//			localRow2.put("NAME", this.oResultSet.getString("site_name"));
//			localRow2.put("UP_ID", "B" + this.oResultSet.getString("bureau_no"));
//			localRow2.put("TYPE", "0");
//			localDataSet.add(localRow2);
//		}
//		this.oResultSet.close();
		sql = "select site_no, site_name, up_site_no from sm_site where ISNULL(up_site_no)=0";
		tempDataSet =queryDataSet(sql);
		for(int i=0;i<tempDataSet.size(); i++)
		{
			Row row1 =(Row)tempDataSet.get(i);
			Row row2 =new Row();
			row2.put("ID", row1.getString("site_no"));
			row2.put("NAME", row1.getString("site_name"));
			row2.put("UP_ID",row1.getString("up_site_no"));
			row2.put("TYPE", "0");
			localDataSet.add(row2);
		}
//		while (this.oResultSet.next())
//		{
//			localRow2 = new Row();
//			localRow2.put("ID", this.oResultSet.getString("site_no"));
//			localRow2.put("NAME", this.oResultSet.getString("site_name"));
//			localRow2.put("UP_ID", this.oResultSet.getString("up_site_no"));
//			localRow2.put("TYPE", "0");
//			localDataSet.add(localRow2);
//		}
//		this.oResultSet.close();
//		this.ovo.set("DEPTPOSITION", localDataSet);
		return localDataSet;
	}

}
