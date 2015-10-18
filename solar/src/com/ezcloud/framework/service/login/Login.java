/**
 * @Title: Login.java
 * @Package com.ezcloud.framework.service.login
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-11 上午10:56:05
 * @version V1.0
 */
package com.ezcloud.framework.service.login;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.service.system.Permission;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.util.DESUtils;
import com.ezcloud.framework.util.SpringUtils;
import com.ezcloud.framework.vo.Row;

/**
 * 登陆系统
 * 
 * @ClassName: Login
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-11 上午10:56:05
 */
@Component("frameworkLoginService")
public class Login extends Service {

	public void login() throws JException {
		String username = row.getString("username", null);
		String password = row.getString("password", null);
		String token = row.getString("token", null);
		sql = "select * from sm_staff where staff_name='" + username + "' and is_sys_user='1' ";
		if(token != null && token.length() >0)
		{
			try {
				token =AesUtil.decode(token);
			} catch (Exception e) {
				e.printStackTrace();
			}
			sql +=  " and bureau_no='"+token+"'";
		}
		Row staff = queryRow(sql);
		System.out.println("row===>" + row);
		// 判断密码是否正确
		if (staff == null) {
			throw new JException(-1001, "账号不存在");
		}
		String md5_pwd = staff.getString("password");
		if (!password.equals(md5_pwd)) {
			throw new JException(-1002, "账号或者密码错误!");
		}
		row = staff;
	}
	public void thirdLogin() throws JException {
		String username = row.getString("username", null);
		String password = row.getString("password", null);
		String rtx_id = row.getString("rtx_id", null);
		String token = row.getString("token", null);
		sql = "select * from sm_staff where staff_name='" + username + "' and rtx_id='"+rtx_id+"' ";
		if(token != null && token.length() >0)
		{
			try {
				token =AesUtil.decode(token);
			} catch (Exception e) {
				e.printStackTrace();
			}
			sql +=  " and bureau_no='"+token+"'";
		}
		Row staff = queryRow(sql);
		System.out.println("row===>" + row);
		// 判断密码是否正确
		if (staff == null) {
			throw new JException(-1001, "账号不存在");
		}
		String md5_pwd = staff.getString("password");
		if (!password.equals(md5_pwd)) {
			throw new JException(-1002, "账号或者密码错误!");
		}
		row = staff;
	}

	public void insert() {
		Row row = new Row();
		row.put("staff_no", "10002");
		row.put("staff_name", "tong");
		row.put("password", DESUtils.getEncryptString("1234"));
		String tableName = "sm_staff";
		insert(tableName, row);
	}

	public void update() {
		Row row = new Row();
		row.put("staff_name", "123456");
		row.put("password", "123456");
		String tableName = "sm_staff";
		update(tableName, row, " staff_no='10001'");
	}

	/**
	 * @param args
	 */
	@SuppressWarnings({ "resource", "unused" })
	public static void main(String args[]) {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext-jdbc.xml");
		Login login = (Login) context.getBean("frameworkLoginService");
		// /login.login();
		// login.insert();
		// int i =login.getTableSequence("sm_staff", "staff_no", 10001);
		// System.out.println("seq===>>"+i);
		// String sqll="select password  from sm_staff where staff_no='10001'";
		//		
		// System.out.println(login.queryField(sqll, "123"));
		// System.out.println(login.queryField(sqll));

		// System.out.println(login.queryDataSet("select * from sm_staff"));
		// login.update();
		// System.out.println(login.queryRow("select * from sm_staff where staff_no='10001'"));
		// try {
		// login.login();
		// } catch (JException e) {
		// e.printStackTrace();
		// }
		Permission permission = (Permission) context.getBean("frameworkPermissionService");
		permission.getStaffPermission();

		String resString = SpringUtils.getMessage("framework.message.error", "@@@", "####", "^^^");
		System.out.println("res:" + resString);
	}
}
