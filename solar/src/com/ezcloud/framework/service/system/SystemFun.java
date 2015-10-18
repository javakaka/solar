package com.ezcloud.framework.service.system;


import org.springframework.stereotype.Component;

import com.ezcloud.framework.service.Service;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

@Component("frameworkSystemFunService")
public class SystemFun extends Service {

	@SuppressWarnings("unchecked")
	public DataSet getFunXTree() {
		DataSet ds = new DataSet();
		String sql = "select a.*,b.WIN_TARGET from sm_fun a left join sm_window b " + "on a.WIN_ID=b.WIN_ID " + "order by UP_FUN_ID,LEVEL_INDEX ";
		ds = queryDataSet(sql);
		for (int i = 0; i < ds.size(); i++) {
			Row temp = (Row) ds.get(i);
			String up_id = temp.getString("up_fun_id", "");
			if (up_id == null || up_id.replace(" ", "").length() == 0) {
				up_id = "0";
				temp.put("up_fun_id", up_id);
				ds.set(i, temp);
			}
		}
		return ds;
	}

	public DataSet getFunInclude() {
		DataSet ds = new DataSet();
		String fun_id = getRow().getString("fun_id", null);
		String sql = "";
		if (fun_id == null) {
			sql = "select * from sm_fun where UP_FUN_ID is null";
		} else {
			sql = "select * from sm_fun where UP_FUN_ID='" + fun_id + "'";
		}
		ds = queryDataSet(sql);
		return ds;
	}

	public Row edit() {
		Row funRow = new Row();
		String fun_id = getRow().getString("fun_id", null);
		if (fun_id != null) {
			String sql = "select a.*,b.WIN_TARGET from sm_fun a left join sm_window b on a.WIN_ID=b.WIN_ID where FUN_ID='" + fun_id + "'";
			funRow = queryRow(sql);
		}
		return funRow;
	}
	
	public String save(Row fun)
	{
		String s="";
		String fun_id =fun.getString("FUN_ID",null);
		if(fun_id ==null){
			fun_id =String.valueOf(getTableSequence("sm_fun", "fun_id",1));
			//获取功能项ID
			String up_id =fun.getString("UP_FUN_ID",null);
			//first level fun
			if( up_id == null || up_id.replace(" ", "").length()==0 )
			{
//				String sql ="select count(*)  from sm_fun where UP_FUN_ID is null ";
//				fun_id = queryField(sql, "0");
//				int f_id =Integer.parseInt(fun_id);
				String sql ="select max(fun_id) from sm_fun where UP_FUN_ID is null";
				int f_id =Integer.parseInt(queryField(sql, "0"));
//				if(f_id < max_f_id){
//					f_id =max_f_id;
//				}
				f_id++;
				if(f_id <10)
				{
					fun_id="0"+f_id;
				}
				else
					fun_id=String.valueOf(f_id);
				
			}
			//child level fun  根据子节点的最大id，取下一个子节点的id
			else
			{
//				String sql="select count(*) from sm_fun where up_fun_id='"+up_id+"'";
//				fun_id =queryField(sql);
//				int childCount=Integer.parseInt(fun_id);
				String sql ="select max(fun_id) from sm_fun where up_fun_id='"+up_id+"'";
				String s_max_f_id =queryField(sql,"0");
				int childCount=Integer.parseInt(s_max_f_id);
				if(childCount ==0)
				{
					fun_id =up_id+"01";
				}
				else
				{
					String child_max_id="";
					if(!s_max_f_id.equals(up_id.replace(" ", "")))
					{
						child_max_id=s_max_f_id.replaceFirst(up_id, "");
					}
					else{
						child_max_id=up_id;
					}
					int c_max_id =Integer.parseInt(child_max_id);
					c_max_id++;
					if(c_max_id <10)
					{
						fun_id =up_id +"0"+c_max_id;
					}
					else
					{
						fun_id =up_id +c_max_id;
					}
				}
			}
			fun.put("FUN_ID", fun_id);
			insert("sm_fun", fun);
		}
		else{
			update("sm_fun", fun," fun_id='"+fun_id+"'");
		}
		s=fun_id;
		return s;
	}
	
	public int delete()
	{
		int rowNum =0;
		String fun_id =getRow().getString("fun_id");
		String sql ="select * from sm_fun ";
		DataSet funDataSet =queryDataSet(sql);
		StringBuilder ids=new StringBuilder();
		ids.append("'"+fun_id+"'");
		getDeleteIds(ids,fun_id,funDataSet);
//		System.out.println("ids=======>>>"+ids.toString());
		sql ="delete from sm_fun where fun_id in ("+ids.toString()+")";
		rowNum =update(sql);
		//sm_role_fun
		sql ="delete from sm_role_fun where fun_id in ("+ids.toString()+")";
		rowNum =update(sql);
		return rowNum;
	}
	
	public void getDeleteIds(StringBuilder sb,String rootId,DataSet ds)
	{
		Row row=null;
		String id=null;
		String p_id=null;
		if(ds !=null && ds.size() >0)
		{
			for(int i=0;i<ds.size();i++)
			{
				row=(Row)ds.get(i);
				id =row.getString("fun_id");
				p_id =row.getString("up_fun_id",null);
				//children nodes
				if(p_id != null && rootId.equals(p_id))
				{
					if(sb.length()>0){
						sb.append(",");
					}
					sb.append("'").append(id).append("'");
					getDeleteIds(sb,id,ds);
				}
			}
		}
	}
	
	// JSTree
	public DataSet findAll()
	{
		DataSet ds =new DataSet();
		String sql ="select * from sm_fun";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public String getFunJsTree(String default_up_id_value,String tree_name,String show_type,String selector_id,DataSet ds)
	{
		StringBuilder sJsonData =new StringBuilder();
		if(show_type == null)
		{
			show_type ="";
		}
		if(show_type.equalsIgnoreCase("checkbox"))
		{
			show_type ="checkbox";
		}
		sJsonData.append("{\n").append("\"json_data\"").append(" : ").append("{\n").append("\"data\"")
		.append(" : ").append("[\n");
		//设置一个默认的根节点
		sJsonData.append("{").append("\"data\" : ").append("\""+tree_name+"\"");
		//,"state":"open","attr" : {id :-1,"class" : "jstree-checked","js_node":"1"},
		if(show_type.equalsIgnoreCase("checkbox"))
		{
			sJsonData.append(",").append("\"state\":\"open\"").append(",").append("\"attr\":{\"id\":\"-1\",\"class\":\"jstree-unchecked\",\""+selector_id+"\":\""+selector_id+"\"}");
		}
		else
		{
			sJsonData.append(",").append("\"state\":\"open\"").append(",").append("\"attr\":{\"id\":\"-1\",\""+selector_id+"\":\""+selector_id+"\"}");
		}
		sJsonData.append(",").append("\"metadata\"").append(" : ")
		.append("{id :").append("-1").append("}");
		sJsonData.append(",\"children\" : [");
		if(ds.size() > 0)
		{
			String fun_id =null;
			String p_id=null;
			for(int i =0 ; i < ds.size() ; i++ )
			{
				row =(Row)ds.get(i);
				fun_id =row.getString("fun_id");
				p_id =row.getString("up_fun_id",null);
				if(p_id == null || p_id.replace(" ", "").length()==0){
					p_id ="-1";
				}
				if( !p_id.equalsIgnoreCase(default_up_id_value)){
					continue;
				}
				if(i > 0)
				{
					sJsonData.append(",");
				}
				sJsonData.append("{").append("\"data\" : ").append("\""+row.getString("fun_name")+"\"");
				if(show_type.equalsIgnoreCase("checkbox"))
				{
					sJsonData.append(",").append("\"state\":\"open\"").append(",").append("\"attr\":{\"id\":\""+fun_id+"\",\"class\":\"jstree-unchecked\",\""+selector_id+"\":\""+selector_id+"\"}");
				}
				else
				{
					sJsonData.append(",").append("\"state\":\"open\"").append(",").append("\"attr\":{\"id\":\""+fun_id+"\",\""+selector_id+"\":\""+selector_id+"\"}");
				}
				sJsonData.append(",").append("\"metadata\"").append(" : ").append("{id :").append(fun_id).append("}");
				//取子节点数据
				if(isHaveChildNodes(fun_id, ds))
				{
					getChildrenNodesJsonData(fun_id, ds, sJsonData,show_type,selector_id);
				}
				sJsonData.append("}");
			}
			
		}
		sJsonData.append("]}");
		//初始节点结束标志
		sJsonData.append("]}");
		//plugins : [ "themes", "json_data", "checkbox", "ui" ]   //加载插件

		sJsonData.append(",").append("\"plugins\"").append(" : ").append("[ \"themes\",\"json_data\", \""+show_type+"\",\"ui\" ]")
		.append("}");
		return sJsonData.toString();
	}
	
	//判断某个节点有子节点
	public static boolean isHaveChildNodes(String fun_id,DataSet ds)
	{
		boolean bool=false;
		if(ds == null || ds.size() ==0 )
			return bool;
		String p_id=null;
		Row funRow=null;
		for(int i=0; i<ds.size(); i++)
		{
			funRow=(Row)ds.get(i);
			p_id =funRow.getString("up_fun_id",null);
			if(p_id != null && p_id.equalsIgnoreCase(fun_id)){
				bool =true;
				break;
			}
		}
		return bool;
	}
	
	//取子节点列表
	@SuppressWarnings("unchecked")
	public static DataSet getChildrenNodes(String fun_id, DataSet ds)
	{
		DataSet childrenDataSet =new DataSet();
		if(ds == null || ds.size() ==0)
			return childrenDataSet;
		String p_id=null;
//		String f_id =null;
		Row funRow=null;
		for(int i=0; i< ds.size(); i++)
		{
			funRow=(Row)ds.get(i);
			p_id =funRow.getString("up_fun_id",null);
			if(p_id != null && p_id.equals(fun_id))
			{
				childrenDataSet.add(funRow);
			}
		}
		return childrenDataSet;
	}
	
	//取子节点的树结构数据
	public static void getChildrenNodesJsonData(String id,DataSet ds,StringBuilder sb,String show_type,String selector_id)
	{
		Row row=null;
		DataSet childrenDataSet=getChildrenNodes(id,ds);
		if(childrenDataSet != null && childrenDataSet.size() > 0)
		{
			
			String sFUN_ID =null;
			sb.append(",\"children\" : [");
			for(int i=0; i<childrenDataSet.size(); i++)
			{
				row =(Row)childrenDataSet.get(i);
				sFUN_ID =row.getString("fun_id");
				if(i > 0)
				{
					sb.append(",");
				}
				sb.append("{")
				.append("\"data\" : ").append("\""+row.getString("fun_name")+"\"");
				if(show_type.equalsIgnoreCase("checkbox"))
				{
					sb.append(",").append("\"state\":\"open\"").append(",").append("\"attr\":{\"id\":\""+row.getString("fun_id")+"\",\"class\":\"jstree-unchecked\",\""+selector_id+"\":\""+selector_id+"\"}");
				}
				else
				{
					sb.append(",").append("\"state\":\"open\"").append(",").append("\"attr\":{\"id\":\""+row.getString("fun_id")+"\",\""+selector_id+"\":\""+selector_id+"\"}");
				}
				sb.append(",").append("\"metadata\" :{id : ").append(row.getString("fun_id")).append("}");
				
				if(isHaveChildNodes(sFUN_ID, ds))
				{
					getChildrenNodesJsonData(sFUN_ID, ds, sb,show_type,selector_id);
				}
				sb.append("}");
			}
			sb.append("]");
		}
	}
	
	//将所有功能目录按等级从上到下排序
	@SuppressWarnings("unchecked")
	public DataSet getSortedFuns(DataSet ds)
	{
		DataSet sortDs =new DataSet();
		if(ds == null){
			return sortDs;
		}
		String f_id=null;
		String p_id=null;
		Row row =null;
		for(int i=0;i<ds.size();i++)
		{
			row =(Row)ds.get(i);
			f_id =row.getString("fun_id",null);
			p_id =row.getString("up_fun_id",null);
			if(p_id == null || p_id.replace(" ","").length()==0)
			{
				sortDs.add(row);
				if(isHaveChildNodes(f_id, ds))
				{
					pushSortChildren(f_id, ds, sortDs);
				}
			}
		}
		return sortDs;
	}
	
	@SuppressWarnings("unchecked")
	public void pushSortChildren(String fun_id,DataSet ds,DataSet sortDs)
	{
		DataSet childDs =getChildrenNodes(fun_id, ds);
		String f_id=null;
		Row row =null;
		if(childDs != null && childDs.size() >0)
		{
			for(int i=0;i<childDs.size();i++)
			{
				row =(Row)childDs.get(i);
				sortDs.add(row);
				f_id =row.getString("fun_id",null);
				if(isHaveChildNodes(f_id, ds))
				{
					pushSortChildren(f_id, ds, sortDs);
				}
			}
		}
	}
	//根据角色 编号获取这个角色所有的权限
	public DataSet getFunByRoleId(String id)
	{
		DataSet ds=new DataSet();
//		String sql ="select b.* from sm_role_fun a left join sm_fun b on a.fun_id=b.fun_id  where a.ROLE_ID='"+id+"' ";
		String sql ="select b.* from sm_role_fun a,sm_fun b where a.ROLE_ID='"+id+"' and a.fun_id=b.fun_id ";
		ds =queryDataSet(sql);
		return ds;
	}
	
	public int saveRoleFuns(String role_id,String fun_id)
	{
		int rowNum =0;
		String arr[]=fun_id.split(",");
		String sql ="delete from sm_role_fun where role_id='"+role_id+"'";
		update(sql);
		Row role_fun =null;
		for(int i=0; i<arr.length; i++)
		{
			role_fun=new Row();
			role_fun.put("role_id", role_id);
			role_fun.put("fun_id", arr[i]);
			// current default value is 1
			role_fun.put("role_type", "1");
			rowNum+=insert("sm_role_fun", role_fun);
		}
		return rowNum;
	}
	public static void main(String args[])
	{
		System.out.println(Integer.parseInt("01221"));
	}
}