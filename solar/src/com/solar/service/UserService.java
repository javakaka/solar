/**
 * 
 */
package com.solar.service;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.util.Md5Util;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2014-12-26 下午3:14:51  
 */

@Component("solarUserService")
public class UserService extends Service{

	public UserService() {
		
	}

	/**
	 * mobile login 
	 * @return
	 */
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row login(String username)
	{
		Row row =null;
		String sSql =" select * from solar_userinfo where ( username='"+username+"'  or telephone='"+username+"' )";
		row =queryRow(sSql);
		return row;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row findByTelephone(String telephone)
	{
		Row row =null;
		String sSql =" select * from solar_userinfo where  telephone='"+telephone+"' ";
		row =queryRow(sSql);
		return row;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row findByOpenid(String from_user)
	{
		Row row =null;
		String sSql =" select * from solar_userinfo where  from_user='"+from_user+"' ";
		row =queryRow(sSql);
		return row;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public int getUserTotalNum()
	{
		int total=0;
		String sSql =" select count(*) from solar_userinfo ";
		total =Integer.parseInt(queryField(sSql));
		return total;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row findByUserName(String username)
	{
		Row row =null;
		String sSql =" select * from solar_userinfo where  username='"+username+"' ";
		row =queryRow(sSql);
		return row;
	}
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row findByEmail(String email)
	{
		Row row =null;
		String sSql =" select * from solar_userinfo where  email='"+email+"' ";
		row =queryRow(sSql);
		return row;
	}
	
	
	
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row find(String id)
	{
		Row row =null;
		String sSql =" select * from solar_userinfo where id='"+id+"' ";
		row =queryRow(sSql);
		return row;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public int findTotalNum()
	{
		int num =0;
		String sSql =" select count(*) from solar_userinfo ";
		num =Integer.parseInt(queryField(sSql));
		return num;
	}
	
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public int insert(Row row)
	{
		int num =0;
//		int id =getTableSequence("solar_userinfo", "id", 1);
//		row.put("id", id);
		num =insert("solar_userinfo", row);
		return num;
	}
	
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public int update(Row row)
	{
		int num =0;
		String id =row.getString("id",null);
		Assert.notNull(id);
		row.remove("ID");
		System.out.println("row ------>>"+row);
		num =update("solar_userinfo", row, " id='"+id+"'");
		return num;
	}
	
	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from solar_userinfo where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from solar_userinfo where 1=1 ";
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
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public DataSet queryLatestTop5Users() {
		DataSet dataSet =new DataSet();
		String sql="select * from solar_userinfo order by create_time desc limit 0,5 ";
		dataSet =queryDataSet(sql);
		return dataSet;
	}
	
	/**
	 * change password
	 * @param user_id
	 * @param oldPwd
	 * @param newPwd
	 * @return 
	 */
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public int changePassword(String user_id,String oldPwd,String newPwd)
	{
		int status =0;
		String sSql ="select * from solar_userinfo where id='"+user_id+"'";
		Row staff =queryRow(sSql);
		if(staff == null){
			status =1;// user not exist
		}
		else
		{
			String password =staff.getString("password","");
			if( !password.equals(oldPwd)){
				status =2;// oldpassword not correct
			}
			else 
			{
				sSql ="update solar_userinfo set password='"+newPwd+"' where id='"+user_id+"'";
				int rowNum = update(sSql);
				if(rowNum ==0 ){
					status =3;// update failure
				}
			}
		}
		return status;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public boolean isEmailExisted(String id,String email)
	{
		boolean existed =false;
		String sSql =" select count(*) from solar_userinfo where  email='"+email+"' and id !='"+id+"'";
		String num =queryField(sSql);
		if(Integer.parseInt(num)>0)
		{
			existed =true;
		}
		return existed;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public boolean isUsernameExisted(String id,String username)
	{
		boolean existed =false;
		String sSql =" select count(*) from solar_userinfo where  username='"+username+"' and id !='"+id+"'";
		String num =queryField(sSql);
		if(Integer.parseInt(num)>0)
		{
			existed =true;
		}
		return existed;
	}
	
	/**
	 * 删除
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public void delete(Long... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from solar_userinfo where id in(" + id + ")";
			update(sql);
		}
	}
	
	/**
	 * reset pwd
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public void resetPassword(String id) {
		String password =Md5Util.Md5("000000");
		sql = "update solar_userinfo set password='"+password+"'  where id='"+id+"'";
		System.out.println("sql-------->>"+sql);
		update(sql);
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public boolean isTelephoneExisted(String telephone)
	{
		boolean bool =true;
		String sql ="select count(*) from solar_userinfo where telephone ='"+telephone+"'";
		String count =queryField(sql);
		int sum =Integer.parseInt(count);
		if(sum >0)
			bool =false;
		else
			bool =true;
		return bool;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public boolean isUserNameExisted(String user_name)
	{
		boolean bool =true;
		String sql ="select count(*) from solar_userinfo where username ='"+user_name+"'";
		String count =queryField(sql);
		int sum =Integer.parseInt(count);
		if(sum >0)
			bool =false;
		else
			bool =true;
		return bool;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public boolean isEmailExisted(String email)
	{
		boolean bool =true;
		String sql ="select count(*) from solar_userinfo where email ='"+email+"'";
		String count =queryField(sql);
		int sum =Integer.parseInt(count);
		if(sum >0)
			bool =false;
		else
			bool =true;
		return bool;
	}
	
	
}