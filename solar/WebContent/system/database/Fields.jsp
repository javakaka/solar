<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<table width=100%>
<tr>
<td nowrap valign=top width=1%>选择模块:<$:A service="queryMoudleList" dynamic="true"/>
	<$:M dtype="1"/>
	<$:L name="moudle" rs="ListValue" valueField="value" textField="text" firstText="请选择..."/>
	<br>
	<$:A service="getDbTables" dynamic="true"/>
	<$:M dtype="1"/>
	<$:L name="table" rs="Tables" valueField="TABLE_ENAME" textField="TABLE_CNAME" props=" style='width:100%;' size=33 onDblClick='dbClick(this)'" selectRs="SYS_033"/>

</div>
</td>
<td>
	<iframe id="sub" width="100%" height="100%" frameborder="0" scrolling="no" src="./FieldsInclude.jsp"></iframe>
</td>
</tr>
</table>
<script>
function del()
{
	if(document.table.table_ename.value =="")
	{
		alert("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作将删掉窗口以及修改其关联的菜单项！"))
		{
			document.table.operate.value="2";
			document.table.submit();
		}
	}
}
function row()
{
	try
	{
		Table.click();
		var table_ename =Table.clickRow(document.all.tabMain).TABLE_ENAME;
		if(table_ename !="" && typeof table_ename !='undefined')
		{
			document.table.table_ename.value =table_ename;
			document.table.table_ename_tmp.value=table_ename;
			document.table.table_cname.value =Table.clickRow(document.all.tabMain).TABLE_CNAME;
			document.table.table_desc.value =Table.clickRow(document.all.tabMain).TABLE_DESC;
			document.table.moudle_id.value =Table.clickRow(document.all.tabMain).MOUDLE_ID;
			document.table.table_ename_tmp.disabled =true;
			document.table.operate.value="1";
		}
		else
		{
			document.table.table_ename.value ='';
			document.table.table_ename_tmp.value='';
			document.table.table_cname.value ='';
			document.table.table_desc.value ='';
			document.table.moudle_id.value ='';
			document.table.table_ename_tmp.disabled =false;
			document.table.operate.value="0";
		}
	}
	catch(e){}
}
function submitMe(form)
{
	if(checkForm(form))
	{
		if(form.moudle_id.value=='')
		{
			alert("请选择表属于的模块");
			form.moudle_id.focus();
			return false;
		}
		form.table_ename.value=form.table_ename_tmp.value;
		form.submit();
	}
}
function dbClick(handle)
{
	document.all.sub.src="FieldsInclude.jsp?table_ename="+handle.value;
}
</script>