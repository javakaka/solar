package com.ezcloud.framework.service.system;


import org.springframework.stereotype.Component;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 系统通用配置项服务类
 * @author TongJianbo
 *
 */
@Component("frameworkSystemConfigService")
public class SystemConfigService extends Service{

	/**
	 * 获取单个配置项数据
	 * @param busiType
	 * @param busiCode
	 * @return
	 */
	public String[] getConfigData(String busiType, String busiCode)
	{
		String[] configArr = null;
		String sql = "select busi_code_set,set_memo from comm_system_signle_data_set  where busi_type='"
				+ busiType
				+ "' and busi_code='"
				+ busiCode
				+ "'";
		configArr =new String[2];
		DataSet temp =queryDataSet(sql);
		if(temp != null && temp.size() >=1)
		{
			Row row =(Row)temp.get(0);
			configArr[0] = row.getString("busi_code_set");
			configArr[1] = row.getString("set_memo");
		}
		
		return configArr;
	}
	
	public String getConfigValue(String busiType, String busiCode)
	{
		String value = null;
		String sql = "select busi_code_set from comm_system_signle_data_set  where busi_type='"
				+ busiType
				+ "' and busi_code='"
				+ busiCode
				+ "'";
		value=queryField(sql);
		return value;
	}
	
	public DataSet getConfigData(String busiType)
	{
		String sql = "select busi_code,busi_code_set,set_memo from comm_system_signle_data_set  where busi_type='"+ busiType+ "' ";
		DataSet ds =queryDataSet(sql);
		return ds;
	}
	
	/**
	 * 读取项目参数
	 * @param paramKey
	 * @return
	 */
	public String getParam(String paramKey)
	{
		String keyValue =null;
		String sql = "select para_value from pm_params where para_name='"
				+ paramKey + "'";
		keyValue =queryField(sql);
		if(keyValue == null )
		{
			keyValue ="";
		}
		return keyValue;
	}
	
	/**
	 * 设置通用配置项，如果busi_code_set为null，则删除该配置项；<br/>如果已经存在改配置项，则更新该配置项；否则新建配置项
	 * @param busi_type
	 * @param busi_code
	 * @param busi_code_set
	 * @param set_memo
	 * @throws JException
	 */
	public  void setConfigData(String busi_type, String busi_code,
			String busi_code_set, String set_memo)
	{
		String sql;
		if (busi_code_set == null) 
		{
			sql = "delete from comm_system_signle_data_set where busi_type='"
					+ busi_type
					+ "' and busi_code='"
					+ busi_code
					+ "'";
			update(sql);
		} 
		else 
		{
			sql = "select data_set_id from comm_system_signle_data_set  where busi_type='"
					+ busi_type
					+ "' and busi_code='"
					+ busi_code + "'";
			Row oRow = new Row();
			String data_set_id =queryField(sql);
			if (data_set_id != null) {
				oRow.put("BUSI_CODE_SET", busi_code_set);
				oRow.put("SET_MEMO", set_memo);
				update("comm_system_signle_data_set", oRow,"data_set_id=" + data_set_id);
			} 
			else 
			{
				data_set_id =String.valueOf(getTableSequence("COMM_SYSTEM_SIGNLE_DATA_SET", "DATA_SET_ID", 1));
				oRow.put("DATA_SET_ID", data_set_id);
				oRow.put("BUSI_TYPE", busi_type);
				oRow.put("BUSI_CODE", busi_code);
				oRow.put("BUSI_CODE_SET", busi_code_set);
				oRow.put("SET_MEMO", set_memo);
				insert("COMM_SYSTEM_SIGNLE_DATA_SET", oRow);
			}
			oRow.clear();
			oRow = null;
		}
		
	}
	
	public String querySingleConfig(String busi_type, String busi_code) {
		String value =null;
		
		sql = "select BUSI_CODE_SET from comm_system_signle_data_set where BUSI_TYPE='"+busi_type+"' and BUSI_CODE='"+busi_code+"' ";
		value =queryField(sql);
		return value;
	}
}
