
package com.solar.service;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2014-12-26 下午3:14:51  
 */

@Component("solarCompanyInfoService")
public class CompanyInfoService extends Service{

	public CompanyInfoService() {
		
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row find(String id)
	{
		Row row =null;
		String sSql =" select * from solar_companyinfo where id='"+id+"' ";
		row =queryRow(sSql);
		return row;
	}
	
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public Row findOneRecord()
	{
		Row row =null;
		String sSql =" select top 1 * from solar_companyinfo ";
		row =queryRow(sSql);
		return row;
	}
	
	
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public int insert(Row row)
	{
		int num =0;
//		int id =getTableSequence("solar_companyinfo", "id", 1);
//		row.put("id", id);
		num =insert("solar_companyinfo", row);
		return num;
	}
	
	@Transactional(value="jdbcTransactionManager",propagation=Propagation.REQUIRED)
	public int update(Row row)
	{
		int num =0;
		String id =row.getString("id",null);
		row.remove("ID");
		num =update("solar_companyinfo", row, " id='"+id+"'");
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
		sql = "select * from solar_companyinfo where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from solar_companyinfo where 1=1 ";
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
	
	@SuppressWarnings("unchecked")
	@Transactional(value="jdbcTransactionManager",readOnly = true)
	public DataSet list(String type_id,String page,String page_size) 
	{
		StringUtils.string2Json("");
		int iStart =(Integer.parseInt(page)-1)*Integer.parseInt(page_size)+1;
		DataSet dataSet =new DataSet();
		String sql="select top 10 * "
		+" from  "
		+" ( "
		+" select row_number() over(order by id) as rownumber,* from solar_companyinfo where type !='7' ";
		if(! StringUtils.isEmptyOrNull(type_id))
		{
			sql +=" and type='"+type_id+"' ";
		}
		sql +=" ) temp "
		+" where rownumber >  " +iStart;
		dataSet =queryDataSet(sql);
		if( dataSet != null )
		{
			for(int i=0; i < dataSet.size(); i++ )
			{
				Row row =(Row)dataSet.get(i);
				String remarks =row.getString("REMARKS","");
				if( ! StringUtils.isEmptyOrNull(remarks) )
				{
					remarks =StringUtils.string2Json(remarks);
					row.put("remarks", remarks);
					dataSet.set(i, row);
				}
			}
		}
		
		return dataSet;
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
			sql = "delete from solar_companyinfo where id in(" + id + ")";
			update(sql);
		}
	}
}