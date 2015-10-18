package com.ezcloud.framework.service.system;

import java.net.URLEncoder;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 区域
 * @author JianBoTong
 *
 */
@Component("frameworkSystemSiteService")
public class SystemSite  extends Service{

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() 
	{
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		String org_id =row.getString("org_id",null);
		sql = "select a.site_no, a.site_name ,a.up_site_no ,b.site_name as up_site_name from sm_site a left join sm_site b on a.up_site_no=b.site_no where 1=1 ";
		if (org_id != null && org_id.replace(" ", "").length() >0){
			sql +="  and a.bureau_no='"+org_id+"'";
		}
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_site where 1=1 ";
		if (org_id != null && org_id.replace(" ", "").length() >0){
			countSql +="  and bureau_no='"+org_id+"'";
		}
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
		page = new Page(dataSet, total, pageable);
		return page;
	}
	
	public Page queryPageForTree() 
	{
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		String org_id =row.getString("org_id");
		String up_id =row.getString("up_id");
		sql = "select a.bureau_no,a.site_no, a.site_name ,a.up_site_no ,a.rela_phone,a.notes,a.state,a.addr,b.site_name as up_site_name "
				+ "from sm_site a left join sm_site b on a.up_site_no=b.site_no where 1=1 ";
		if (org_id != null && org_id.replace(" ", "").length() >0)
		{
			sql +="  and a.bureau_no='"+org_id+"'";
		}
		if (up_id != null && up_id.replace(" ", "").length() >0 && !up_id.replace(" ", "").equals("0"))
		{
			sql +="  and a.up_site_no='"+up_id+"'";
		}
		System.out.println("===========>>"+sql);
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_site where 1=1 ";
		if (org_id != null && org_id.replace(" ", "").length() >0){
			countSql +="  and bureau_no='"+org_id+"'";
		}
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
		page = new Page(dataSet, total, pageable);
		return page;
	}

	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 * @throws Exception 
	 */
	@SuppressWarnings("deprecation")
	public void save() throws Exception {
		Row row = new Row();
		String BUREAU_NAME=getRow().getString("BUREAU_NAME","");
		String UP_BUREAU_NO=getRow().getString("UP_BUREAU_NO","");
		String AREA_CODE=getRow().getString("AREA_CODE","");
		String LINKS=getRow().getString("LINKS","");
		String NOTES=getRow().getString("NOTES","");
		row.put("BUREAU_NAME", BUREAU_NAME);
		row.put("UP_BUREAU_NO", UP_BUREAU_NO);
		row.put("AREA_CODE", AREA_CODE);
		row.put("LINKS", LINKS);
		
		int BUREAU_NO = getTableSequence("sm_site", "bureau_no", 10000);
		row.put("BUREAU_NO", BUREAU_NO);
		
		//NOTES 字段为企业登陆 url,拼接token,token的值是bureau_no的AES加密字符串
		String token= AesUtil.encode(String.valueOf(BUREAU_NO));
		token =URLEncoder.encode(token);
		NOTES =NOTES +"?token="+token;
		row.put("NOTES", NOTES);
		insert("sm_site", row);
		this.getRow().put("BUREAU_NO", BUREAU_NO);
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
		sql = "select * from sm_site where site_no='" + id + "'";
		row = queryRow(sql);
		return row;
	}

	/**
	 * 更新
	 * 
	 * @return void
	 */
	public void update() {
		String BUREAU_NO=getRow().getString("BUREAU_NO","");
		String BUREAU_NAME=getRow().getString("BUREAU_NAME","");
		String UP_BUREAU_NO=getRow().getString("UP_BUREAU_NO","");
		String AREA_CODE=getRow().getString("AREA_CODE","");
		String LINKS=getRow().getString("LINKS","");
		String NOTES=getRow().getString("NOTES","");
		Row row = new Row();
		row.put("BUREAU_NAME", BUREAU_NAME);
		row.put("UP_BUREAU_NO", UP_BUREAU_NO);
		row.put("AREA_CODE", AREA_CODE);
		row.put("LINKS", LINKS);
		row.put("NOTES", NOTES);
		update("sm_site", row, "BUREAU_NO='" + BUREAU_NO + "'");
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
			sql = "delete from sm_site where bureau_no in(" + id + ")";
			update(sql);
			//delete staff_role
			sql ="delete from sm_staff_role where staff_no in (select staff_no from sm_staff where bureau_no in("+id+"))  ";
			update(sql);
			//delete staff
			sql ="delete from sm_staff where bureau_no in("+id+") ";
			update(sql);
			
			//delete mcn_org_modules
			sql ="delete from mcn_org_modules where org_id in ("+id+")";
			update(sql);
		}
	}
	
	
	public void deleteOrgSite(Long... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from sm_site where site_no in(" + id + ")";
			update(sql);
//			//delete staff_role
//			sql ="delete from sm_staff_role where staff_no in (select staff_no from sm_staff where bureau_no in("+id+"))  ";
//			update(sql);
//			//delete staff
//			sql ="delete from sm_staff where bureau_no in("+id+") ";
//			update(sql);
//			
//			//delete mcn_org_modules
//			sql ="delete from mcn_org_modules where org_id in ("+id+")";
//			update(sql);
		}
	}
	
	public DataSet queryOrgSite(String org_id)
	{
		DataSet ds=new DataSet();
		sql ="select * from sm_site  where bureau_no='"+org_id+"'";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public String queryBureauNo(String id)
	{
		String bureau_no =null;
		sql ="select bureau_no from sm_site  where site_no='"+id+"'";
		bureau_no =queryField(sql);
		return bureau_no;
	}
	
	public void insertOrgSite(Row row)
	{
		String id =String.valueOf(getTableSequenceOfVarcharField("sm_site", "site_no", 1));
		row.put("site_no", id);
		insert("sm_site",row);
	}
	
	public void saveOrgSite(Row row)
	{
		String site_no =row.getString("site_no",null);
		update("sm_site",row, " site_no='"+site_no+"'");
	}
}
