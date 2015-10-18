package com.ezcloud.framework.service.system;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 系统帮助服务类
 * @author JianBoTong
 *
 */

@Component("frameworkSystemFaqService")
public class SystemFaqService extends Service {

	/**
	 * 分页查询
	 * 
	 * @Title: queryPage
	 * @return Page
	 */
	public Page queryPage() {
		Page page = null;
		Pageable pageable = (Pageable) row.get("pageable");
		sql = "select a.* ,b.real_name from sm_log a left join sm_staff b on a.staff_no=b.staff_no where 1=1 ";
		String restrictions = addRestrictions(pageable);
		String orders = addOrders(pageable);
		sql += restrictions;
		sql += orders;
		String countSql = "select count(*) from sm_log a left join sm_staff b on a.staff_no=b.staff_no where 1=1 ";
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
	 * faq 树
	 * @return
	 */
	public DataSet getFaqTree()
	{
		DataSet treeDs =new DataSet();
		sql ="select faq_no, pfaq_no, subject from sm_faq order by faq_no";
		treeDs =queryDataSet(sql);
		return treeDs;
	}
	
	/**
	 * 下属faq列表
	 * @param pfaq_no
	 * @return
	 */
	public DataSet getSubFaqList(String pfaq_no)
	{
		DataSet treeDs =new DataSet();
		sql ="select faq_no, pfaq_no, subject from sm_faq where pfaq_no='"+pfaq_no+"' order by faq_no";
		treeDs =queryDataSet(sql);
		return treeDs;
	}
	
	
	/**
	 * faq详情
	 * @param pfaq_no
	 * @return
	 */
	public DataSet getFaqInfo(String faq_no)
	{
		DataSet treeDs =new DataSet();
		sql ="select * from sm_faq where faq_no='"+faq_no+"'";
		treeDs =queryDataSet(sql);
		return treeDs;
	}
	
	/**
	 * 相关faq列表
	 * @param pfaq_no
	 * @return
	 */
	public DataSet getReferFaqList(String faq_no)
	{
		DataSet treeDs =new DataSet();
		sql ="select a.subject, a.faq_no from sm_faq a , sm_refer_faq b where a.faq_no=b.refer_faq_no and b.faq_no='"+faq_no+"'";
		treeDs =queryDataSet(sql);
		return treeDs;
	}

	/**
	 * 保存
	 * 
	 * @Title: save
	 * @return void
	 */
	public void save(Row row) {
		int id = getTableSequence("sm_faq", "faq_no", 1);
		row.put("faq_no", id);
		insert("sm_faq", row);
	}

	/**
	 * 根据id查找
	 * 
	 * @return Row
	 * @throws
	 */
	public Row find(String id) {
		Row row = null;
		sql = "select * from sm_faq where faq_no='"+id+"'";
		row = queryRow(sql);
		return row;
	}

	public int  update(Row row) {
		int rowNum =0;
		String faq_no =row.getString("faq_no","");
		rowNum =update("sm_faq", row, " faq_no='"+faq_no+"'");
		return rowNum;
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
			sql = "delete from sm_faq where faq_no in(" + id + ")";
			update(sql);
		}
	}
}
