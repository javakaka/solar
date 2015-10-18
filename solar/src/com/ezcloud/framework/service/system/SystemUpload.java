package com.ezcloud.framework.service.system;

import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.utility.FileUtil;
/**
 * 框架上传文件服务
 * @author JianBoTong
 *
 */

@Component("frameworkUploadService")
public class SystemUpload extends Service{

	public  int insertFileUploadControl(Row row) throws SQLException
	{
		int rowNum =0;
		insert("file_attach_control",row);
		return rowNum ;
	}
	
	public  int insertFileAttachUpload(Row row) throws SQLException
	{
		int rowNum =0;
		insert("file_attach_upload", row);
		return rowNum ;
	}
	
	public  boolean swfUpload( Row controlRow,Row attachRow)
	{
		boolean f =true;
		String control_id = "1";
		try {
			control_id =String.valueOf(getTableSequence("file_attach_control", "control_id", 1));
			controlRow.put("control_id", control_id);
				insertFileUploadControl(controlRow);
				attachRow.put("control_id", control_id);
				insertFileAttachUpload(attachRow);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return f;
	}
	
	
	@SuppressWarnings("unchecked")
	public  DataSet getAttachList(String deal_code,String deal_type)
	{
		DataSet ds =new DataSet();
		String sSql ="select a.*,b.FILE_CODE,b.FILE_PATH,b.FILE_SIZE from file_attach_control a "+ 
		",file_attach_upload b where a.control_id =b.control_id and a.deal_code='"+deal_code+"' and DEAL_TYPE='"+deal_type+"'";
		String path ="";
		String pre_path ="";
		int iPos =-1;
		ds =queryDataSet(sSql);
		for(int i=0; i< ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			path =row.getString("file_path");
			iPos =path.indexOf("resources");
			if(iPos !=-1)
			{
				pre_path =path.substring(0,iPos+"resources".length());
				path ="../"+path.substring(iPos);
			}
			row.put("path", path);
			row.put("pre_path", pre_path);
			ds.set(i, row);
		}
		return ds;
	}
	
	@SuppressWarnings("unchecked")
	public  DataSet getAttachList(String deal_code,String deal_type,String type,String sub_type)
	{
		DataSet ds =new DataSet();
		String sSql ="select a.*,b.FILE_CODE,b.FILE_PATH,b.FILE_SIZE from file_attach_control a "+ 
		",file_attach_upload b where a.control_id =b.control_id " +
		"and a.deal_code='"+deal_code+"' and DEAL_TYPE='"+deal_type+"' " +
		"and a.type='"+type+"' and a.sub_type='"+sub_type+"' ";
		String path ="";
		String pre_path ="";
		int iPos =-1;
		ds =queryDataSet(sSql);
		for(int i=0; i< ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			path =row.getString("file_path");
			iPos =path.indexOf("resources");
			if(iPos !=-1)
			{
				pre_path =path.substring(0,iPos+"resources".length());
				path ="../"+path.substring(iPos);
			}
			row.put("path", path);
			row.put("pre_path", pre_path);
			ds.set(i, row);
		}
		return ds;
	}
	
	public  int deleteAttach(String id)
	{
		int rowNum =0;
		String sSql ="select a.*,b.FILE_CODE,b.FILE_PATH,b.FILE_SIZE from file_attach_control a "+ 
		",file_attach_upload b where a.control_id =b.control_id and a.control_id='"+id+"'";
		String file_path ="";
		DataSet ds =queryDataSet(sSql);
		for(int i=0; i< ds.size(); i++)
		{
			Row row =(Row)ds.get(i);
			file_path =row.getString("file_path");
			if(file_path != null){
				FileUtil.delete(file_path);
			}
		}
			sSql ="delete from file_attach_upload where control_id='"+id+"'";
			update(sSql);
			sSql ="delete from file_attach_control where control_id='"+id+"'";
			rowNum = update(sSql);
		return rowNum;
	}

}