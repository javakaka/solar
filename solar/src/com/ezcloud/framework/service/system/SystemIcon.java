package com.ezcloud.framework.service.system;

import java.io.File;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 框架窗口维护
 * 
 * @author JianBoTong
 */
@Component("frameworkSystemIconService")
public class SystemIcon extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select * from sm_stockico where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_stockico where 1=1 ";
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
	public Page queryPageByRealPath() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		String path=(String)row.getString("realPath");
		File file=new File(path);
		Long count=0l;
		if(file.isDirectory()){
			File files[]=file.listFiles();
			count=(long)(files.length);
			for(int i=0;i<files.length;i++)
			{
				File tempFile=files[i];
				if(tempFile.isDirectory()){
					continue;
				}
				Row fileRow=new Row();
				fileRow.put("ICO_NAME", tempFile.getName());
				if(dataSet ==null)
					dataSet =new DataSet();
				dataSet.add(fileRow);
			}
		}
		page = new Page(dataSet, count, pageable);
		return page;
	}

	@SuppressWarnings("unchecked")
	public DataSet getSystemSelectIcons()
	{
		String path=(String)row.getString("realPath");
		File file=new File(path);
		if(file.isDirectory()){
			File files[]=file.listFiles();
			for(int i=0;i<files.length;i++)
			{
				File tempFile=files[i];
				if(tempFile.isDirectory()){
					continue;
				}
				Row fileRow=new Row();
				fileRow.put("ICO_NAME", tempFile.getName());
				if(dataSet ==null)
					dataSet =new DataSet();
				dataSet.add(fileRow);
			}
		}
		return dataSet;
	}
	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 */
	public void save() {
		Row row = new Row();
		String ICO_NAME = getRow().getString("ICO_NAME", null);
		row.put("ICO_NAME", ICO_NAME);
		insert("sm_stockico", row);
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
		sql = "select * from sm_stockico where win_id='" + id + "'";
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
		update("sm_stockico", row, "WIN_ID='" + WIN_ID + "'");
	}

	/**
	 * 删除
	 * 
	 * @Title: delete
	 * @param @param ids
	 * @return void
	 */
	public void delete(String... ids) {
		String id = "";
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				if (id.length() > 0) {
					id += ",";
				}
				id += "'" + String.valueOf(ids[i]) + "'";
			}
			sql = "delete from sm_stockico where ico_name in(" + id + ")";
			update(sql);
		}
	}

	public DataSet selectIcon() {
		DataSet ds = new DataSet();
		String sql = "select * from sm_stockico ";
		ds = queryDataSet(sql);
		return ds;
	}

}