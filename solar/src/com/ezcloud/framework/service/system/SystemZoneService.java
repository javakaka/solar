package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 全国省份城市信息维护
 * 
 * @author JianBoTong
 */
@Component("frameworkSystemZoneService")
public class SystemZoneService extends Service {

	/**
	 * 分页查询省份
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPageForProvince(String state, Pageable pageable) {
		Page page = null;
		sql = "select * from common_province where 1=1 ";
		if(! StringUtils.isEmptyOrNull(state))
		{
			sql +=" and state='"+state+"' ";
		}
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from common_province where 1=1 ";
		if(! StringUtils.isEmptyOrNull(state))
		{
			countSql +=" and state='"+state+"' ";
		}
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

	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 */
	public int saveProvince(Row row ) {
		int rowNum =0;
		int id =getTableSequence("common_province", "id", 1);
		row.put("id", id);
		rowNum =insert("common_province", row);
		return rowNum;
	}
	
	/**
	 * 查询省份
	 * 
	 * @Title: save
	 * @return void
	 */
	public Row findProvinceById(String id ) {
		Row row =null;
		String sql ="select * from common_province where id='"+id+"'";
		row =queryRow(sql);
		return row;
	}
	
	/**
	 * 修改
	 * 
	 * @Title: save
	 * @return void
	 */
	public int editProvince(Row row ) {
		int rowNum =0;
		String id= row.getString("id",null);
		System.out.println("row---------->>"+row);
		rowNum =update("common_province", row, " id='"+id+"'");
		return rowNum;
	}
	
	/**
	 * 删除省份
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void deleteProvince(String... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			//delete city_zone
			sql = "delete from common_city_zone where cityId in(select id from common_city where provinceId in(select id from common_province where id in ("+id+"))) ";
			update(sql);
			//delete city
			sql = "delete from common_city where provinceId in(select id from common_province where id in ("+id+") ) ";
			update(sql);
			//delete province
			sql = "delete from common_province where id in(" + id + ")";
			update(sql);
		}
	}
	
	public DataSet queryCitiesByProId(String id) 
	{
		DataSet ds =new DataSet();
		String sql ="select * from common_city where provinceId ='"+id+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public boolean isProvinceNameExisted(String name)
	{
		boolean bool=false;
		String sql ="select count(*) from common_province where name='"+name+"'";
		int num =Integer.parseInt(queryField(sql));
		if(num > 0)
		{
			bool =true;
		}
		return bool;
	}
	
	public boolean isExtraProvinceNameExisted(String id,String name)
	{
		boolean bool=false;
		String sql ="select count(*) from common_province where name='"+name+"' and id !='"+id+"'";
		System.out.println("sql---------->>"+sql);
		int num =Integer.parseInt(queryField(sql));
		if(num > 0)
		{
			bool =true;
		}
		return bool;
	}
	
	/**
	 * 分页查询城市
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPageForCity(String province_id, String state, Pageable pageable) {
		Page page = null;
		sql = "select * from (select a.*,b.name as province from common_city a left join common_province b on a.provinceId=b.id  ) as tab where 1=1 ";
		if(! StringUtils.isEmptyOrNull(state))
		{
			sql +=" and state='"+state+"' ";
		}
		if(! StringUtils.isEmptyOrNull(province_id))
		{
			sql +=" and provinceId='"+province_id+"' ";
		}
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql  = "select count(*) from (select a.*,b.name as province from common_city a left join common_province b on a.provinceId=b.id  ) as tab where 1=1 ";
		if(! StringUtils.isEmptyOrNull(state))
		{
			countSql +=" and state='"+state+"' ";
		}
		if(! StringUtils.isEmptyOrNull(province_id))
		{
			countSql +=" and provinceId='"+province_id+"' ";
		}
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

	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 */
	public int saveCity(Row row ) {
		int rowNum =0;
		int id =getTableSequence("common_city", "id", 1);
		row.put("id", id);
		rowNum =insert("common_city", row);
		return rowNum;
	}
	
	/**
	 * 查询城市
	 * 
	 * @Title: save
	 * @return void
	 */
	public Row queryCityById(String id ) {
		Row row =null;
		String sql ="select * from common_city where id='"+id+"'";
		row =queryRow(sql);
		return row;
	}
	
	/**
	 * 修改
	 * 
	 * @Title: save
	 * @return void
	 */
	public int editCity(Row row ) {
		int rowNum =0;
		String id= row.getString("id",null);
		rowNum =update("common_city", row, " id='"+id+"'");
		return rowNum;
	}
	
	/**
	 * 删除城市
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void deleteCity(String... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			//delete city_zone
			sql = "delete from common_city_zone where cityId in(select id from common_city where id in ("+id+") )";
			update(sql);
			//delete city
			sql = "delete from common_city where id in ("+id+") ";
			update(sql);
		}
	}
	
	public boolean isCityNameExisted(String name)
	{
		boolean bool=false;
		String sql ="select count(*) from common_city where name='"+name+"'";
		int num =Integer.parseInt(queryField(sql));
		if(num > 0)
		{
			bool =true;
		}
		return bool;
	}
	
	public boolean isExtraCityNameExisted(String id,String name)
	{
		boolean bool=false;
		String sql ="select count(*) from common_city where name='"+name+"' and id !='"+id+"'";
		System.out.println("sql---------->>"+sql);
		int num =Integer.parseInt(queryField(sql));
		if(num > 0)
		{
			bool =true;
		}
		return bool;
	}

	
	/**
	 * 分页查询城市辖区
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPageForRegion(String province_id,String city_id, String state, Pageable pageable) {
		Page page = null;
		sql = "select * from (select a.*,b.name as city,b.provinceId from common_city_zone a left join common_city b on a.cityId=b.id  ) as tab where 1=1 ";
		if(! StringUtils.isEmptyOrNull(state))
		{
			sql +=" and state='"+state+"' ";
		}
		if(! StringUtils.isEmptyOrNull(city_id))
		{
			sql +=" and cityId='"+city_id+"' ";
		}
		if(! StringUtils.isEmptyOrNull(province_id))
		{
			sql +=" and provinceId in('"+province_id+"') ";
		}
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql  = "select count(*) from (select a.*,b.name as city,b.provinceId from common_city_zone a left join common_city b on a.cityId=b.id  ) as tab where 1=1 ";
		if(! StringUtils.isEmptyOrNull(state))
		{
			countSql +=" and state='"+state+"' ";
		}
		if(! StringUtils.isEmptyOrNull(city_id))
		{
			countSql +=" and cityId='"+city_id+"' ";
		}
		if(! StringUtils.isEmptyOrNull(province_id))
		{
			countSql +=" and provinceId in('"+province_id+"') ";
		}
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

	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 */
	public int saveRegion(Row row ) {
		int rowNum =0;
		int id =getTableSequence("common_city_zone", "id", 1);
		row.put("id", id);
		rowNum =insert("common_city_zone", row);
		return rowNum;
	}
	
	/**
	 * 查询城市辖区
	 * 
	 * @Title: save
	 * @return void
	 */
	public Row queryRegionById(String id ) {
		Row row =null;
		String sql ="select * from common_city_zone where id='"+id+"'";
		row =queryRow(sql);
		return row;
	}
	
	/**
	 * 查询城市辖区所属的省份编号
	 * 
	 * @Title: save
	 * @return void
	 */
	public String queryProvinceIdByRegionId(String id ) {
		String pro_id="";
		String sql ="select provinceId from common_city where id in (select cityId from common_city_zone where id='"+id+"') ";
		pro_id =queryField(sql);
		return pro_id;
	}
	
	/**
	 * 修改
	 * 
	 * @Title: save
	 * @return void
	 */
	public int editRegion(Row row ) {
		int rowNum =0;
		String id= row.getString("id",null);
		rowNum =update("common_city_zone", row, " id='"+id+"'");
		return rowNum;
	}
	
	/**
	 * 删除城市
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void deleteRegion(String... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			//delete city
			sql = "delete from common_city_zone where id in ("+id+") ";
			update(sql);
		}
	}
	
	public boolean isRegionNameExisted(String name)
	{
		boolean bool=false;
		String sql ="select count(*) from common_city_zone where name='"+name+"'";
		int num =Integer.parseInt(queryField(sql));
		if(num > 0)
		{
			bool =true;
		}
		return bool;
	}
	
	public boolean isExtraRegionNameExisted(String id,String name)
	{
		boolean bool=false;
		String sql ="select count(*) from common_city_zone where name='"+name+"' and id !='"+id+"'";
		int num =Integer.parseInt(queryField(sql));
		if(num > 0)
		{
			bool =true;
		}
		return bool;
	}
	
	/**
	 * 根据id查找
	 * 
	 * @return Row
	 * @throws
	 */
	public Row find() {
		Row row = new Row();
		String id = getRow().getString("id");
		sql = "select * from sm_window where win_id='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String WIN_ID = getRow().getString("WIN_ID", null);
		String WIN_TARGET = getRow().getString("WIN_TARGET", null);
		String WIN_DESC = getRow().getString("WIN_DESC", null);
		Row row = new Row();
		row.put("WIN_ID", WIN_ID);
		row.put("WIN_TARGET", WIN_TARGET);
		row.put("WIN_DESC", WIN_DESC);
		update("sm_window", row, "WIN_ID='" + WIN_ID + "'");
	}

	/**
	 * 删除
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void delete(Long... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from sm_window where win_id in(" + id + ")";
			update(sql);
		}
	}

	/**
	 * 查询所有的城市和城市所辖区域
	 */
	public Row queryAllCityAndZone()
	{
		Row row =new Row();
		//city 
		sql ="select a.* from common_city a left join common_province b on a.provinceId =b.id and b.state='1' where a.state='1'";
		DataSet cityDataSet =queryDataSet(sql);
		//zone
		sql ="select a.* from common_city_zone a left join common_city b on a.cityId=b.id and b.state='1' where a.state='1'";
		DataSet zoneDataSet =queryDataSet(sql);
		row.put("city", cityDataSet);
		row.put("zone", zoneDataSet);
		return row;
	}
	
	/**
	 * 查询指定城市
	 */
	public Row findCityById(String id)
	{
		Row row =new Row();
		sql ="select * from common_city where id='"+id+"'";
		row =queryRow(sql);
		return row;
	}
	
	/**
	 * 查询指定辖区
	 */
	public Row findZoneById(String id)
	{
		Row row =new Row();
		sql ="select * from common_city_zone where id='"+id+"'";
		row =queryRow(sql);
		return row;
	}
	
	/**
	 * 根据城市id查询城市的 辖区
	 */
	public DataSet findZoneByCityId(String id)
	{
		DataSet ds =new DataSet();
		String sql ="select * from common_city_zone where cityId='"+id+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 查询所有已开放的省份
	 */
	public DataSet findAllOpenedProvince()
	{
		DataSet ds =new DataSet();
		String sql ="select id,name from common_province where state='1' ";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 查询所有省份
	 */
	public DataSet findAllProvince()
	{
		DataSet ds =new DataSet();
		String sql ="select id,name from common_province ";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 查询所有已开放的城市
	 */
	public DataSet findAllOpenedCities()
	{
		DataSet ds =new DataSet();
		String sql ="select id,name,provinceId from common_city where state='1' ";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 查询所有已开放的城市
	 */
	public DataSet findAllCities()
	{
		DataSet ds =new DataSet();
		String sql ="select id,name,provinceId from common_city  ";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 根据省份编号查询城市
	 */
	public DataSet findCitiesByProId(String pro_id)
	{
		DataSet ds =new DataSet();
		String sql ="select * from common_city where provinceId='"+pro_id+"' ";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 根据省份编号查询已开放的城市
	 */
	public DataSet findOpenedCitiesByProId(String pro_id)
	{
		DataSet ds =new DataSet();
		String sql ="select * from common_city where provinceId='"+pro_id+"' and state='"+1+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 查询所有已开放的城市的区域
	 */
	public DataSet findAllOpenedZone()
	{
		DataSet ds =new DataSet();
		String sql ="select id,name,cityId from common_city_zone where state='1' ";
		ds =queryDataSet(sql);
		return ds;
	}

}