package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 岗位角色
 * @author JianBoTong
 *
 */

@Component("frameworkPositionRoleService")
public class SystemPositionRole extends Service {

	public DataSet queryPositionRole()
	{
		DataSet ds =new DataSet();
		String posi_no =this.getRow().getString("posi_no",null);
		if(posi_no == null)
		return ds;
		sql ="select * from sm_position_role where posi_no='"+posi_no+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public void savePositionRoleAuth(String posi_no,  DataSet ds)
	{
		if(ds == null || ds.size() ==0 ){
			sql ="update sm_position_role set use_state=0,assign_state=0 where posi_no ='"+posi_no+"'";
			update(sql);
			return ;
		}
		sql ="delete from sm_position_role where posi_no ='"+posi_no+"'";
		update(sql);
		for(int i=0; i< ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			insert("sm_position_role", row);
		}
	}
}
