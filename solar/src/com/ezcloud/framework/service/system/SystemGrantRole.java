package com.ezcloud.framework.service.system;

import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;


/**
 * 角色授权
 * @author JianBoTong
 *
 */

@Component("frameworkGrantRoleService")
public class SystemGrantRole extends Service{

//  Row localRow1 = (Row)this.ivo.get("staff-sub-fun", null);
//  String str = null;
//  if ((localRow1 != null) && (localRow1.containsKey("2")))
//{
//    str = this.ivo.get("bureau-no").toString();
// }
	//   if (str != null)
//	     this.sSql = (this.sSql + " where bureau_no='" + str + "'");
	//   this.oResultSet = DataAccess.query(this.sSql, this.oStatement);
	//   while (this.oResultSet.next())
	//{
//	     localRow2 = new Row();
//	     localRow2.put("ID", "B" + this.oResultSet.getString("bureau_no"));
//	     localRow2.put("NAME", this.oResultSet.getString("bureau_name"));
//	     localRow2.put("UP_ID", "-1");
//	     localRow2.put("TYPE", "0");
//	     treeDataSet.add(localRow2);
	//}
	//   this.oResultSet.close();
		//  sql= "select posi_no, posi_name, site_no from sm_position where state=1";
	//   this.oResultSet = DataAccess.query(this.sSql, this.oStatement);
	//   while (this.oResultSet.next())
	//{
//	     localRow2 = new Row();
//	     localRow2.put("ID", "P" + this.oResultSet.getString("posi_no"));
//	     localRow2.put("NAME", this.oResultSet.getString("posi_name"));
//	     localRow2.put("UP_ID", this.oResultSet.getString("site_no"));
//	     localRow2.put("TYPE", "1");
//	     treeDataSet.add(localRow2);
	//}

	//   sql = "select site_no, site_name, bureau_no from sm_site where up_site_no=0";
	//   this.oResultSet = DataAccess.query(this.sSql, this.oStatement);
	//   while (this.oResultSet.next())
	//{
//	     localRow2 = new Row();
//	     localRow2.put("ID", this.oResultSet.getString("site_no"));
//	     localRow2.put("NAME", this.oResultSet.getString("site_name"));
//	     localRow2.put("UP_ID", "B" + this.oResultSet.getString("bureau_no"));
//	     localRow2.put("TYPE", "0");
//	     treeDataSet.add(localRow2);
	//}
	//   this.oResultSet.close();

		//  sql = "select site_no, site_name, up_site_no from sm_site where up_site_no !=0";
		//   this.oResultSet = DataAccess.query(this.sSql, this.oStatement);
		//   while (this.oResultSet.next())
		//{
//		     localRow2 = new Row();
//		     localRow2.put("ID", this.oResultSet.getString("site_no"));
//		     localRow2.put("NAME", this.oResultSet.getString("site_name"));
//		     localRow2.put("UP_ID", this.oResultSet.getString("up_site_no"));
//		     localRow2.put("TYPE", "0");
//		     treeDataSet.add(localRow2);
		//}
		//   this.oResultSet.close();
		//   this.oResultSet.close();
		//  sql = "select a.real_name, a.staff_no,b.posi_no,a.site_no from sm_staff a left join sm_staff_position b on a.staff_no=b.staff_no where a.state=1";
	//   this.oResultSet = DataAccess.query(this.sSql, this.oStatement);
	//   while (this.oResultSet.next())
	//{
//	     localRow2 = new Row();
//	     localRow2.put("ID", "S" + this.oResultSet.getString("staff_no"));
//	     localRow2.put("NAME", this.oResultSet.getString("real_name"));
//	     if ((this.oResultSet.getString("posi_no") == null) || (this.oResultSet.getString("posi_no").trim().length() == 0))
//	       localRow2.put("UP_ID", this.oResultSet.getString("site_no"));
	//else {
//	       localRow2.put("UP_ID", "P" + this.oResultSet.getString("posi_no"));
	//}
//	     localRow2.put("TYPE", "4");
//	     treeDataSet.add(localRow2);
	//  }
	
	
	 @SuppressWarnings("unchecked")
	public DataSet getDeptPostionStaffTree() throws JException, SQLException
  {
		 DataSet tempDs =new DataSet();
		 DataSet treeDataSet = new DataSet();
		 String sql= "select bureau_no, bureau_name from sm_bureau";

		 tempDs =queryDataSet(sql);
		 Row localRow2;
		 for(int i=0; i<tempDs.size(); i++)
		 {
		 	Row tempRow =(Row)tempDs.get(i);
		 	localRow2 = new Row();
		 	localRow2.put("ID", "B" + tempRow.getString("bureau_no"));
		 	localRow2.put("NAME",tempRow.getString("bureau_name"));
		 	localRow2.put("UP_ID", "-1");
		 	localRow2.put("TYPE", "0");
		 	treeDataSet.add(localRow2);
		 }

//		 sql= "select posi_no, posi_name, site_no from sm_position where state=1";
		 sql= "select posi_no, posi_name, site_no from sm_position ";
		 tempDs =queryDataSet(sql);
		 for(int i=0; i< tempDs.size(); i++)
		 {
		 	Row tempRow = (Row)tempDs.get(i);
		 	localRow2 = new Row();
		 	localRow2.put("ID", "P" +tempRow.getString("posi_no"));
		 	localRow2.put("NAME", tempRow.getString("posi_name"));
		 	localRow2.put("UP_ID", tempRow.getString("site_no"));
		 	localRow2.put("TYPE", "1");
		 	treeDataSet.add(localRow2);
		 }

		 sql = "select site_no, site_name, bureau_no from sm_site where up_site_no is null ";
		 tempDs =queryDataSet(sql);
		 for(int i=0; i< tempDs.size(); i++)
		 {
		 	Row tempRow = (Row)tempDs.get(i);
		 	localRow2 = new Row();
		 	localRow2.put("ID", tempRow.getString("site_no"));
		 	localRow2.put("NAME", tempRow.getString("site_name"));
		 	localRow2.put("UP_ID", "B" + tempRow.getString("bureau_no"));
		 	localRow2.put("TYPE", "0");
		 	treeDataSet.add(localRow2);
		 }


		 sql = "select site_no, site_name, up_site_no from sm_site where up_site_no is not null ";
		 tempDs =queryDataSet(sql);
		 for(int i=0; i< tempDs.size(); i++)
		 {
		 	Row tempRow = (Row)tempDs.get(i);
		 	localRow2 = new Row();
		 	localRow2.put("ID", tempRow.getString("site_no"));
		 	localRow2.put("NAME", tempRow.getString("site_name"));
		 	localRow2.put("UP_ID", tempRow.getString("up_site_no"));
		 	localRow2.put("TYPE", "0");
		 	treeDataSet.add(localRow2);
		 }

		 //   sql = "select a.real_name, a.staff_no,b.posi_no,a.site_no from sm_staff a left join sm_staff_position b on a.staff_no=b.staff_no where a.state=1";
		 sql = "select a.real_name, a.staff_no,b.posi_no,a.site_no from sm_staff a left join sm_staff_position b on a.staff_no=b.staff_no ";
		 tempDs =queryDataSet(sql);
		 for(int i=0; i< tempDs.size(); i++)
		 {
		 	Row tempRow = (Row)tempDs.get(i);
		 	localRow2 = new Row();
		 	localRow2.put("ID", "S" +tempRow.getString("staff_no"));
		 	localRow2.put("NAME", tempRow.getString("real_name"));
		 	if ((tempRow.getString("posi_no",null) == null) || (tempRow.getString("posi_no").trim().length() == 0))
		 	localRow2.put("UP_ID", tempRow.getString("site_no"));
		 	else {
		 	localRow2.put("UP_ID", "P" + tempRow.getString("posi_no"));
		 	}
		 	localRow2.put("TYPE", "4");
		 	treeDataSet.add(localRow2);
		 }
		 return treeDataSet;
  }
	 
	
	 public void getSysNoPositionStaff()
	 {
//		 String sql ="select a.* from sm_staff a where a.state=1 and a.staff_no not in (select staff_no from sm_staff_position)";
	 }
	 
}
