<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<BODY onLoad="initPage()">
<$:NE param="action_id" value="">
	<$:A service="getDynaAction" dynamic="true">
      <$:P name="action_id" from="request" default="0"/>
      <$:P name="seq" from="request"/>
      <$:P name="compare" from="request" default="0"/>
      <$:P name="auth_level" from="request" default="0"/>
      <$:P name="db_type" from="request" default="0"/>
   </$:A>
   <$:M dtype="1"/>
</$:NE>
<$:T var="dyna_service" name="Action" pagesize="1">
	<table name="tabMain" cellpadding="2" cellspacing="1" class="table_c">	
	   <tr class="tr_c">
		  <td  width=10% nowrap align=right class="td_c">
			 <$:I item="System.framework.action_id"/>
		  </td>
		  <td><input name="action_id" desc='<$:I item="fm_dyna_action.action_id"/>' datatype="string" notnull style="width:100%" value='<$:C item="dyna_service.ACTION_ID"/>'></td>
		  <td  width=1% nowrap class="td_c">
			 <$:I item="System.framework.seq"/>
		  </td>
		  <td colspan=3><input name="seq" desc='<$:I item="fm_dyna_action.seq"/>' datatype="number" notnull min='1' size=2 value='<$:C item="dyna_service.SEQ"/>'>&nbsp;指定
		  <$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="COMPARE"/>
			 </$:A>
			 <$:M dtype="1"/>
			 <$:L name="compare" rs="COMPARE" valueField="used_view" textField="disp_view" firstText="请选择..." firstValue="0"/>
			<$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="AUTH_LEVEL"/>
			 </$:A>
			 <$:M dtype="1"/>
			 <$:L name="auth_level" rs="AUTH_LEVEL" valueField="used_view" textField="disp_view" firstText="请选择..." firstValue="0"/>
		  &nbsp;所属模块<font color=red>*</font>:<$:A service="queryMoudleList" dynamic="true"/>
				<$:M dtype="1"/>
				<$:L name="moudle_id" rs="ListValue" valueField="value" textField="text" firstText="请选择..." props="desc='动态服务所属模块' datatype='string' notnull"/>
			 </td>
	   </tr>
	   <tr class="tr_c">
		  <td nowrap align=right class="td_c">
			 <$:I item="System.framework.rsname"/>
		  </td>
		  <td>
			 <input name="rsname" size="15" value='<$:C item="dyna_service.RSNAME"/>' notnull datatype="String" desc='数据集名称'>
		  </td>
		  <td  width=1% nowrap class="td_c">
			 <$:I item="fm_dyna_action.db_type"/>
		  </td>
		  <td>	
		  <$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="DB_TYPE"/>
			 </$:A>
			 <$:M dtype="1"/>
			 <$:L name="db_type" rs="DB_TYPE" valueField="used_view" value="0" 	textField="disp_view"/>
		  </td>
		  <td  width=1% nowrap class="td_c">
			 <$:I item="fm_dyna_action.action_type"/>
		  </td>
		  <td>
		  <$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="SQL_TYPE"/>
			 </$:A>
			 <$:M dtype="1"/>
			 <$:L name="action_type" rs="SQL_TYPE" valueField="used_view" value="0" 	textField="disp_view"/>
		  </td>
	   </tr>
	   <tr class="tr_c">
		  <td  width=1% nowrap align=right class="td_c">
			 <$:I item="System.framework.action_sql"/>
		  </td>
		  <td colspan=5>
			 <TEXTAREA NAME="action_sql" ROWS="4" style="width:80%" notnull desc="动态服务SQL语句"><$:C item="dyna_service.ACTION_SQL"/></TEXTAREA>
		  </td>
	   </tr>
	   <tr class="tr_c">
		  <td  width=1% nowrap align=right class="td_c">
			 <$:I item="fm_dyna_action.action_desc"/>
		  </td>
		  <td colspan=5>
			 <input name="action_desc"  style="width:80%" value='<$:C item="dyna_service.ACTION_DESC"/>'>
			</td>
		</tr>
		<tr class="tr_c">
			<td colspan=6 height=30 valign=top align=center><input type="button" value=<$:I item="html.button.reset"/>><input type="button" name="btSubmit" value=<$:I item="html.button.save"/>  onClick="submitMe()" ><input type=button value=<$:I item="html.button.add"/>  onClick="add(this.form)"><input type=button value=<$:I item="html.button.del"/>  onClick ="del()">
			</td>
		</tr>
	</table>
	<input type="hidden" name="operate" value="0">
</$:T>
</BODY>
<script>
function add(form)
{
	$S("action_id", "");
	$E.setWrite("action_id");
	$S("seq", "");
	$S("moudle_id", "");
	$S("compare", "0");
	$S("auth_level", "0");
	$S("action_type", "0");
	$S("rsname", "");
	$S("action_sql", "");
	$S("action_desc", "");
}
function del()
{
	if(!confirm("注意，此操作将删掉系统框架配置的动态服务以及该服务对应的参数！"))
		return;
	var s=new Server("editDynamicService");
	s.setFormData();
	s.setParam("operate", "2");
	s.send(s, false, function(){alert("删除成功！");window.parent.document.location.reload();});
	
}
function initPage()
{
	$S("db_type", $E.getParameter("db_type", "0"));
	$S("action_type", $E.getParameter("action_type", "0"));
	$S("compare", $E.getParameter("compare", "0"));
	$S("auth_level", $E.getParameter("auth_level", "0"));
	$S("moudle_id", $E.getParameter("moudle_id"));
	if($V("action_id") !="")
	{
		$E.setRead("action_id");
		$S("operate", "1");
	}
}
function submitMe()
{
	if(checkForm())
	{
		var s=new Server("editDynamicService");
		s.setFormData();
		s.send(s, false, function(){
				alert("保存成功！");
				if($V("operate") =="0")
				{
					window.parent.document.location.href ="DynaServices.jsp?action_id="+$V("action_id");
				}
			}
		);
	}
}
</script>
