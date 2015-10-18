<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>

<div align=left>
<table>
<form>
   <tr>
      <td align=left>&nbsp;数据表查询&raquo;&nbsp;英文名&raquo;&nbsp;<input type=text name="table_ename" value='<$:W name="table_ename" from="request" default=""/>'>中文名&raquo;&nbsp;<input type=text name="table_cname" value='<$:W name="table_cname" from="request" default=""/>' >所属模块:<$:A service="queryMoudleList" dynamic="true"/>
						<$:M dtype="1"/>
						<$:L name="moudle" rs="ListValue" valueField="value" textField="text" firstText="请选择..."/><input type="hidden" name="nname"><input type=submit value=<$:I item="html.button.query"/> >
      <script>
         var moudle =getParameter("moudle");
         if(moudle !='')
            document.all.moudle.value =moudle;
         var nname =getParameter("nname");
         if(nname !='')
            document.all.nname.value =nname;
      </script>
      </td>
   </tr>
</form>
</table>
</div>
<table id="tabMain" name="tabMain"  cellpadding="3" border="1" width="100%" onClick="row()">	
	<tr>
		<td class="td_c" width=1% nowrap><$:I item="tdb_table.table_cname"/></td>
		<td class="td_c" width=1% nowrap><$:I item="tdb_table.table_ename"/></td>
		<td class="td_c" width=1% nowrap><$:I item="System.database.moudle_name"/></td>
		<td class="td_c" nowrap><$:I item="tdb_table.table_desc"/></td>
	</tr>
   <$:E param="moudle" value="">
         <$:A service="getTableList1" dynamic="true" pagesize="10">
            <$:P name="table_ename" default="" from="request"/>
            <$:P name="table_cname" default="" from="request"/>
         </$:A>
   </$:E>
   <$:NE param="moudle" value="">
         <$:A service="getTableList2" dynamic="true" pagesize="10">
            <$:P name="table_ename" default="" from="request"/>
            <$:P name="table_cname" default="" from="request"/>
            <$:P name="moudle" default="" from="request"/>
         </$:A>
   </$:NE>
    <!--$:A service="getTableList" dynamic="true" pagesize="10"/-->
	<$:M dtype="1"/>
	<$:T var="table" name="Tables" fieldNum="5">
	  <tr <$:R item="table.TABLE_ENAME,TABLE_CNAME,TABLE_DESC,MOUDLE_ID,IS_TRACK,IS_KEEP_TIME,TAG"/>>
		<td nowrap>&nbsp;<$:C item="table.TABLE_CNAME"/></td>
		<td nowrap><$:C item="table.TABLE_ENAME"/>&nbsp;</td>
		<td nowrap><$:C item="table.MOUDLE_NAME"/></td>
		<td nowrap><$:C item="table.TABLE_DESC"/></td>
	  </tr>
	</$:T>
	<tr> 
	<td colspan="4" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="10"/>
		</form>
	</td>
	</tr>
</table>
<div align=right>
   <input name="btOK" type="button" value=<$:I item="html.button.ok"/>  onClick="onMe()" disabled>
   <input type="button" value=<$:I item="html.button.close"/>  onClick="window.close()">&nbsp;&nbsp;&nbsp;
</div>
<script>
function row()
{
	try{
		Table.click();
		var table_ename =Table.clickRow(document.all.tabMain).TABLE_ENAME;
		if(table_ename !="" && typeof table_ename !='undefined')
		{
			document.all.btOK.disabled =false;
		}
		else
		{
			document.all.btOK.disabled =true;
		}
	}catch(e){}
}
function onMe()
{
	var table_ename =Table.clickRow(document.all.tabMain).TABLE_ENAME;
	if (table_ename =='') 
	{
		alert("请选择记录！");
		return false;
	}
	//alert("table_ename="+table_ename+" nname="+nname);
	runOpen('<%=GlobalUtil._WEB_PATH%>/system/database/TableStruCopy.jsp?nname='+nname+'&table_ename='+table_ename, false, 768, 350);
}
</script>
