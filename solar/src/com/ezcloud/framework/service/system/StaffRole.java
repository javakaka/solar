package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;
/**
 * 系统用户权限服务类
 * @author JianBoTong
 *
 */
@Component("frameworkStaffRoleService")
public class StaffRole extends Service{

	public void save()
	{
		Row staffRole =getRow();
		insert("sm_staff_role",staffRole);
	}
	

	public DataSet queryStaffRole()
	{
		DataSet ds =new DataSet();
		String staff_no =this.getRow().getString("staff_no",null);
		if(staff_no == null)
		return ds;
		sql ="select * from sm_staff_role where staff_no='"+staff_no+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public void saveStaffRoleAuth(String staff_no,DataSet ds)
	{
		if(ds == null || ds.size() ==0){
			sql ="update sm_staff_role set use_state=0,assign_state=0 where staff_no='"+staff_no+"'";
			update(sql);
			return ;
		}
		sql ="delete from sm_staff_role where staff_no='"+staff_no+"'";
		update(sql);
		for(int i=0; i< ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			insert("sm_staff_role",row);
		}
	}
}
