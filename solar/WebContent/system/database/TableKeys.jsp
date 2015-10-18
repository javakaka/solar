<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="关键字列表" width="100%">
<div align=right>
	<input name="btApply" type="button" value="应用到表(A)" onClick="onApplyToTable()" accesskey="A" class="bttopfirst">
</div>
<table id="tabMain" name="tabMain" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width="100%" onClick="row()">	
	<tr bgcolor=#FFFFFF>
		<td class="td_c" width=1% nowrap>关键字名</td>
		<td class="td_c" width=1% nowrap>列名</td>
		<td class="td_c" width=1% nowrap>状态</td>
	</tr>
	<$:A service="getDBKeys" dynamic="true" pagesize="5">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="keys" name="Keys" fieldNum="6">
	  <tr bgcolor=#FFFFFF <$:R item="keys.TABLE_ENAME,KEY_ID,NAME,COLUMNS_NAME,REF_TABLE,REF_COLUMNS,ENABLED,TYPE,TAG"/>>
		<td nowrap>&nbsp;<$:C item="keys.NAME"/></td>
		<td nowrap><$:C item="keys.COLUMNS_NAME"/></td>
		<td nowrap><$:C item="keys.TAG" replace="[1,已应用][0,未应用]"/></td>
	  </tr>
	</$:T>
	<tr bgcolor=#FFFFFF> 
	<td colspan="6" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="5"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<$:G title="关键字编辑">
<table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
	<form name="key">
	<tr bgcolor=#FFFFFF><td colspan="4" height=30 valign=bottom align=center><input type=button value='添加关键字' class="bttopnofirst" onClick="add(this.form);"><input type=button value='删除关键字' class="bttopnofirst" onClick ="onDel()" name="del" disabled></td></tr>
	<tr bgcolor=#FFFFFF>
		<td  width=1% nowrap>
			关键字名<font color="red">*</font>
		</td>
		<td><input name="name_tmp" value="PK_<%=ServletUtil.get(request, "table_ename")%>" desc='关键字名' datatype="string" size=20></td>
		<td  width=1% nowrap>
			列名<font color="red">*</font>
		</td>
		<td><input name="columns_name" desc='列名' datatype="string" size=20 readonly><input name="btSelColumn" type="button" value="..." class="button" onClick="onSelColumns()" ></td>
	</tr>
	<tr bgcolor=#FFFFFF>
		<td align=center colspan=4 valign=top height=30><input type="button" value=<$:I item="html.button.reset"/>    onClick="this.form.reset();document.all.del.disabled=true;"><input type="button" value=<$:I item="html.button.save"/>   onClick="submitMe(this.form)"></td>
	</tr>

			</table>
			<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request"/>'>
			<input name="key_id" type=hidden>
			<input name="name" type=hidden>
			<input name="tag" type=hidden>
			<input type=hidden name="table" value="db_keys">
			<input type=hidden name="operate" value="0">
		</td>
	</tr>
	</form>
</table>
</$:G>
<script>
function onDel()
{
	if(document.key.name.value =="")
	{
		alert("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作将删掉此关键字信息！"))
		{	
			var tag =Table.clickRow(document.all.tabMain).TAG;
			document.key.operate.value="2";
			document.key.tag.value =tag;
			 var s=new Server("editDbMoudelData");
			 s.setFormData();
			 s.send(s, false, function(){
					alert("成功删除！");
					document.location.reload();
				}
			 );
		}
	}
}
function add(form)
{
   form.reset();
   form.name_tmp.disabled =false;
   form.name_tmp.focus();
}
function onSelColumns()
{
	var table_ename ='<$:W name="table_ename" from="request"/>';
	var features ="dialogHeight = 320px; dialogWidth = 550px; help: no; status: no;";//Modal Dialog Window 
    var arrOutArgs = window.showModalDialog("<%=GlobalUtil._WEB_PATH%>/system/database/FieldsSelect.jsp?table_ename=" +table_ename, null, features);
	
	if (arrOutArgs != null){
		document.all.columns_name.value =arrOutArgs;
	}
}
function onApplyToTable()
{
	if(confirm('确认要创建数据库表关键字?'))
   {
		var s =new Server("applyKey");
		s.setParamValue("default", "table_ename", $E.getParameter("table_ename"));
		if(s.send(s, true))
		{
			alert("关键字应用到数据表成功");
			document.location.reload();
		}
	}
}
function row()
{
	try	{
		Table.click();
		var name =Table.clickRow(document.all.tabMain).NAME;
		if(name !="" && typeof name !='undefined')
		{
			document.key.key_id.value =Table.clickRow(document.all.tabMain).KEY_ID;
			document.key.name.value=name;
			document.key.name_tmp.value=name;

		 if(typeof Table.clickRow(document.all.tabMain).COLUMNS_NAME !="undefined")
			document.key.columns_name.value =Table.clickRow(document.all.tabMain).COLUMNS_NAME;
		 else
			document.key.columns_name.value ="";

		 document.key.name_tmp.disabled =true;
		 document.key.operate.value="1";
         document.key.del.disabled=false;
		}
		else
		{
			document.key.key_id.value ='';
			document.key.table_ename.value ='';
			document.key.name_tmp.value='';
			document.key.columns_name.value ='';
			document.key.name_tmp.disabled =false;
			document.key.operate.value="0";
			document.key.del.disabled=true;
		}
	} catch(e){}
}
function submitMe(form)
{
	if(checkForm(form))
	{
		if(document.key.name_tmp.value =="PK_")
		{
			$E.message("请指定英文关键字名，不能为'PK_'。");
			document.key.name_tmp.focus();
			return;
		}
		 form.name.value=form.name_tmp.value;
		 var s=new Server("editDbMoudelData");
		 s.setFormData();
		 s.send(s, false, function(){
				alert("保存成功！");
				document.location.reload();
			}
		 );
	}
}
function selTable(k)
{
	message("选择表" +k);
}
</script>