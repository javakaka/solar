/**
 * @Title: Permission.java
 * @Package com.ezcloud.framework.service.system
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-14 下午04:00:55
 * @version V1.0
 */
package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.service.Service;

/**
 * 权限服务
 * 
 * @ClassName: Permission
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-14 下午04:00:55
 */
@Component("frameworkPermissionService")
public class Permission extends Service {

	/**
	 * 根据用户编号获取用户的权限
	 * 
	 * @return void
	 */
	public void getStaffPermission() {
		String staff_no = row.getString("staff_no");
		//直接根据人员权限获取菜单，并集
		sql = "select DISTINCT c.FUN_ID,d.FUN_NAME,d.FUN_DESC,d.WIN_ID,d.WIN_MODE,d.ICO_NAME,d.LEVEL_INDEX,d.UP_FUN_ID,e.WIN_TARGET,e.WIN_DESC "
				+ "from sm_staff a,sm_staff_role b ,sm_role_fun c,sm_fun d LEFT JOIN sm_window e on d.WIN_ID=e.WIN_ID " + "where a.STAFF_NO=b.STAFF_NO " + "and a.STAFF_NO='" + staff_no + "' "
				+ "and b.ROLE_ID=c.ROLE_ID " + "and c.FUN_ID=d.FUN_ID and (b.use_state=1 or b.assign_state=1 ) order by d.level_index ";
		dataSet = queryDataSet(sql);
		//根据人员所属岗位获取岗位的菜单，并集
		if(dataSet.size() == 0)
		{
			sql ="select DISTINCT srf.FUN_ID,sf.FUN_NAME,sf.FUN_DESC,sf.WIN_ID,sf.WIN_MODE,sf.ICO_NAME, "
		+" sf.LEVEL_INDEX,sf.UP_FUN_ID,sw.WIN_TARGET,sw.WIN_DESC "
		+" from sm_fun sf "
		+" left join sm_role_fun srf on srf.FUN_ID=sf.FUN_ID " 
		+" left join sm_window sw on sw.WIN_ID = sf.WIN_ID "
		+" where  srf.ROLE_ID in ( "
		+" select DISTINCT a.ROLE_ID from sm_position_role a,sm_staff_position b "  
		+" where a.POSI_NO=b.POSI_NO and b.STAFF_NO='"+staff_no+"' and (a.use_state=1 or a.assign_state=1)"
		+" ) order by sf.level_index ";
			System.out.println("---------------------->>"+sql);
			dataSet = queryDataSet(sql);
			
		}
	}

	public static void main(String args[]) {

	}
}