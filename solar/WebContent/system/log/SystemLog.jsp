<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="系统日志">
<table id="tabMain" name="tabMain" bordercolor="3B87D1" bordercolorlight="#FFFFFF" cellpadding="0" cellspacing="0" border="1" width="100%" onClick="row()">
	<tr class="tr_tilte">
		<td class="td_c" width=1% nowrap>行号</td>
		<td class="td_c" width=1% nowrap>操作序号</td>
		<td class="td_c" width=1% nowrap>操作模块</td>
		<td class="td_c" width=1% nowrap>操作人所属部门</td>
		<td class="td_c" width=1% nowrap>操作人所属岗位</td>
		<td class="td_c" width=1% nowrap>操作人</td>
		<td class="td_c" width=1% nowrap>操作内容</td>
		<td class="td_c" width=1% nowrap>操作时间</td>
	</tr>
	<$:A service="SYS_025" dynamic="false" pagesize="10">
		<$:P name="log_id"/>
		<$:P name="operate_type"/>
		<$:P name="staff_no"/>
		<$:P name="posi_no"/>
		<$:P name="site_no"/>
		<$:P name="begin_date"/>
		<$:P name="end_date"/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="syslog" name="SYS_025" fieldNum="11" $E.message="无日志信息">
	  <tr <$:R item="syslog.LOG_ID,OPERATE_TYPE,SITE_NO,POSI_NO,STAFF_NO,CONTENT,LOG_TIME"/>>
			<td nowrap width="1%"><$:C item="syslog.THEROW"/></td>
			<td nowrap width="1%"><$:C item="syslog.LOG_ID"/></td>
			<td nowrap width="1%"><$:C item="syslog.OPERATE_MODEL_NAME"/></td>
			<td nowrap width="1%"><$:C item="syslog.SITE_NAME"/></td>
			<td nowrap width="1%"><$:C item="syslog.POSI_NAME"/></td>
			<td nowrap width="1%"><$:C item="syslog.REAL_NAME"/></td>
			<td nowrap width="1%"><$:C item="syslog.CONTENT"/></td>
			<td nowrap width="1%"><$:C item="syslog.LOG_TIME"/>&nbsp;</td>
      </tr>
	</$:T>
	<tr> 
	<td colspan="20" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="10"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<form name="queryForm" action="" method="post">
<$:G title="查询">
<table width="100%" align="left" bordercolor="3B87D1" bordercolorlight="#FFFFFF" cellpadding="0" cellspacing="0" border="1">
<tr>
	<td width=1% nowrap>操作序号</td><td><input type="text" name="log_id"></td>
	<td width=1% nowrap>操作模块</td>
	<td><$:A service="SYS_003" dynamic="true">
		<$:P name="TABLE_NAME" value="TMP_TABLE"/>
		<$:P name="FIELD_NAME" value="OPERATE_TYPE"/>
	  </$:A>
	  <$:M dtype="1"/>
	  <$:L name="operate_type" rs="SYS_003" valueField="used_view" textField="disp_view" firstText="请选择..."/>
	</td>
	<td width=1% nowrap>操作内容</td><td><input type="text" name="log_id"></td>
</tr>
<zz:Permit level="70,90,99">
<tr>
	<td width=1% nowrap>操作人</td>
	<td><$:A service="SYS_042" dynamic="true"/>
	  <$:M dtype="1"/>
	  <$:L name="staff_no" rs="SYS_042" valueField="staff_no" textField="staff_name" firstText="请选择..."/>
	</td>
	<td width=1% nowrap>操作人所属岗位</td>
	<td><$:A service="SYS_039" dynamic="true"/>
	  <$:M dtype="1"/>
	  <$:L name="posi_no" rs="SYS_039" valueField="posi_no" len="3" textField="posi_name" firstText="请选择..."/>
	</td>
	<td width=1% nowrap>操作人所属部门</td>
	<td><$:A service="getSysSites" dynamic="true"/>
	  <$:M dtype="1"/>
	  <$:L name="site_no" rs="Sites" valueField="site_no" len="3" textField="site_name" firstText="请选择..."/>
	</td>
</tr>
</zz:Permit>
<tr>
	<td colspan="6" height="25">开始日期:<input type="text" size="10" name="begin_date_tmp" disabled><input id="set_date1" name="set_date1" type="button" class="button" onclick="runDateSelect(document.all.begin_date_tmp, false,false)" value="...">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束日期:<input type="text" size="10" name="end_date_tmp" disabled><input id="set_date2" name="set_date2" type="button" class="button" onclick="runDateSelect(document.all.end_date_tmp, false,false)" value="..."></td>
</tr>
</table>
</$:G>
<div align=center><input type="hidden" name="begin_date"><input type="hidden" name="end_date"><input type="button" name="btQuery" value="查询"  onClick="onLogQuery(this.form)"></div>
</form>
<script language="javascript">
queryForm.operate_type.value='<$: name="operate_type" from="request"/>';
function row()
{
	try
	{
		Table.click();
		var log_id =Table.clickRow(document.all.tabMain).LOG_ID;
	}
	catch(e){}
}
function onLogQuery(form)
{
	document.all.begin_date.value=document.all.begin_date_tmp.value;
	document.all.end_date.value=document.all.end_date_tmp.value;
	form.submit();
}

</script>
