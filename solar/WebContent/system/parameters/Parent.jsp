<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<%String sTitle=". 表("+ServletUtil.get(request,"table_ename")+")静态字段清单";%>
<$:G title="<%=sTitle%>">
   <table id="Columnlist" cellpadding="2" cellspacing="1" class="table_c" width=100%>
		 <tr class="tr_c"> 
			<td width="20%" nowrap class="td_c">静态参数中文名</td>
			<td width="20%" nowrap class="td_c">静态参数英文名</td>
			<!--<td width="30%" nowrap class="td_c">静态参数字段描述</td>-->
			<td class="td_c" nowrap>静态参数字段说明</td>
		 </tr>
		<$:A service="getSysDictoryTree" dynamic="false" pagesize="15">
		</$:A>
		<$:M dtype="1"/>
		<$:T var="field" name="DictoryItem" pagesize="15">
		  <tr onClick="onRow()" class="tr_c" <$:R item="field.ITEM_TITLE,FIELD_NAME,NOTES,ONLY_VIEW"/>>
			<td nowrap><a href='Child.jsp?field_ename=<$:C item="field.FIELD_NAME"/>'><$:C item="field.ITEM_TITLE"/></a></td>
			<td><$:C item="field.FIELD_NAME"/></td>
			<td nowrap>&nbsp;<$:C item="field.NOTES"/></td>
		  </tr>
		</$:T>
      <tr class="tr_c"> 
      <td colspan="7" height="1%" align="right">  
         <form name="formpage">
            <$:Page pagesize="15"/>
         </form>
      </td>
      </tr>
   </table>
   <input type=hidden name="table_ename" value='<$:W name="table_ename" from="request"/>'>
</$:G>
<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
	<tr class="tr_c">
		<td align=right colspan=2><input type=button td_c value="新增" name="btAdd" onClick="onAdd()"><input type=button td_c value="保存" name="btSave" onClick="onSave()"><input type=button td_c value="删除" name="btDelete" onClick="onDelete()"></td>
	</tr>
	<tr class="tr_c">
		<td class="td_c" width=25% align=right>静态参数中文名<font color=red>*</font></td>
		<td><input type="text" name="item_title" style="width:100%" desc="静态参数中文名" datatype="string"></td>
	</tr>
	<tr class="tr_c">
		<td class="td_c" align=right>静态参数名<font color=red>*</font></td>
		<td><input type="text" name="field_name" style="width:100%" desc="静态参数名" datatype="string"></td>
	</tr>
	<tr class="tr_c">
		<td class="td_c" align=right>静态参数描述<font color=red>*</font></td>
		<td><input type="text" name="notes" style="width:100%" desc="静态参数描述" datatype="string"></td>
	</tr>
	<tr class="tr_c">
		<td class="td_c" align=right>只是显示<font color=red>*</font></td>
		<td><input type="checkbox" name="only_view">:如果定义为只是显示，则业务库关联的静态数据项保存静态数据项的显示值而不是使用值。</td>
	</tr>
</table>
<input type=hidden name="operate" value="0">
</body>
</html>
<script>
function onAdd()
{
	document.all.field_name.value ="";
	document.all.item_title.value ="";
	document.all.field_name.disabled =false;
	document.all.notes.value ="";
	document.all.operate.value ="0";//增加状态
	document.all.only_view.checked =false;
}

function onSave()
{
	if(checkForm(document))
	{
		var s =new Server("saveTableData");
		s.setParamValue("default", "card", "sm_dictory_item");
		s.setParamValue("default", "item_title", document.all.item_title.value);
		s.setParamValue("default", "field_name", document.all.field_name.value);
		if(document.all.only_view.checked)
			s.setParamValue("default", "only_view", "1");
		else
			s.setParamValue("default", "only_view", "0");

		s.setParamValue("default", "notes", document.all.notes.value);
		if(document.all.operate.value =="1")
			s.setParam("condition", "field_name='"+$V("field_name")+"'");
		s.setParamValue("default", "op", document.all.operate.value);
		if(s.send(s, true))
		{
			$E.message("保存成功！");
			document.location.href ="Parent.jsp";
		}
		document.all.operate.value ="1";//修改状态
	}
}

function onRow()
{
	Table.click();
	var sFieldCName = Table.clickRow(document.all.Columnlist).ITEM_TITLE;
	var sFieldEName = Table.clickRow(document.all.Columnlist).FIELD_NAME;
	var sFieldDesc = Table.clickRow(document.all.Columnlist).NOTES;
	if(Table.clickRow(document.all.Columnlist).ONLY_VIEW
			&& Table.clickRow(document.all.Columnlist).ONLY_VIEW =="1")
		document.all.only_view.checked =true;
	else
		document.all.only_view.checked =false;
	document.all.item_title.value =sFieldCName;
	document.all.field_name.value =sFieldEName;
	document.all.field_name.disabled =true;
	document.all.notes.value =sFieldDesc;
	document.all.operate.value ="1";//修改状态
}

function onDelete()
{
	if(document.all.field_name.value !="" && confirm("删除静态参数时，下面的静态参数枚举项一并删除，确认删除？"))
	{
		var s =new Server("saveTableData");
		s.setParam("card", "sm_dictory");
		s.setParam("condition", "field_ename='"+document.all.field_name.value+"'");
		s.setParam("op", "2");
		if(s.send(s, true))
		{
			//同时删除静态参数表的枚举数据
			var s2 =new Server("saveTableData");
			s2.setParam("card", "sm_dictory_item");
			s2.setParam("condition", "field_name='"+document.all.field_name.value+"'");
			s2.setParam("op", "2");
			if(s2.send(s2, true))
			{
				$E.message("删除成功！");
				document.location.href ="Parent.jsp";
			}
		}
	}
	else
	{
		$E.message("请输入或选择要删除的静态参数！");
	}
}
</script>
