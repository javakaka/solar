<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sTableEname =ServletUtil.get(request,"table_ename");
%>
<$:G title="关联列表" width="100%">
<table id="tabMain" name="tabMain"  cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="row()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap>列名</td>
		<td class="td_c" width=1% nowrap>关联表</td>
		<td class="td_c" width=1% nowrap>关联列</td>
	</tr>
	<$:A service="getDBTableRels" dynamic="true">
		<$:P name="table_ename" default="" from="request"/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="rels" name="Rels">
	  <tr class="tr_c" <$:R item="rels.REL_ID,TABLE_ENAME,FIELD_ENAME,REL_TABLE,REL_COL"/>>
		<td nowrap><$:C item="rels.FIELD_CNAME"/>( <$:C item="rels.FIELD_ENAME"/> )</td>
		<td nowrap><$:C item="rels.REL_TABLE_CNAME"/>( <$:C item="rels.REL_TABLE"/> )</td>
		<td nowrap><$:C item="rels.REL_FIELD_CNAME"/>( <$:C item="rels.REL_COL"/> )</td>
	  </tr>
	</$:T>
</table>
</$:G>
<$:G title="关联编辑">
<table width=100% cellpadding="2" cellspacing="1" class="table_c">
	<form name="rel">
	<tr class="tr_c"><td colspan="3" height=30 align=center valign=bottom><input type=button value='添加关联' class="bttopnofirst" onClick="add(this.form);"><input type=button value='删除关联' class="bttopnofirst" onClick ="onDel()" name="del" disabled><zz:HelpTip faqno="faq_9" text="表关联定义用途"/></td></tr>
	<tr class="tr_c">
		<td colspan=3 valign=top>
			<table name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width=100%>	
				<tr class="tr_c">
					<td align="right" width=40% nowrap>列名<font color="red">*</font>
					</td>
					<td>
						<$:A service="getTableCols" dynamic="true">
							<$:P name="table_ename" default="" from="request"/>
						</$:A>
						<$:M dtype="1"/>
						<$:L name="field_ename" rs="getTableCols" valueField="FIELD_ENAME" textField="FIELD_CNAME" value="" firstText="请选择..."/>
					</td>
				</tr>
				<tr class="tr_c">
					<td align="right" width=1% nowrap>关联表<font color="red">*</font>
					</td>
					<td>
						<!-- <select name="rel_table" onchange="selTable(document.all.rel_table.options[document.all.rel_table.selectedIndex].text)"> -->
						<$:A service="getTables" dynamic="true"/>
						<$:M dtype="1"/>
						<$:M dtype="1"/>
						<$:L name="rel_table" rs="Tables" valueField="TABLE_ENAME" textField="TABLE_ENAME,TABLE_CNAME" value="" firstText="请选择..." props='onChange="selFieldType(this)"'/>
					</td>
				</tr>
				<tr class="tr_c">
					<td align="right" width=1% nowrap>关联列<font color="red">*</font>
					</td>
					<td>
						<%
						request.removeAttribute(ServletUtil._SOFT_TAG+"GETTABLECOLS");
						%>
						<$:A service="getTableCols" dynamic="true">
							<$:P name="table_ename" aliasName="rel_table" from="request" default=""/>
						</$:A>
						<$:M dtype="1"/>
						<$:L name="rel_col" rs="getTableCols" valueField="FIELD_ENAME" textField="FIELD_CNAME" value="" firstText="请选择..."/>
					</td>
				</tr>
				<tr class="tr_c">
					<td align="center" height=30 valign=top colspan="2"><input type="button" value=<$:I item="html.button.reset"/>    onClick="this.form.reset();document.all.del.disabled=true;"><input type="button" value=<$:I item="html.button.save"/>   onClick="submitMe(this.form)"></td>
				</tr>
			</table>
			<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request"/>'>
			<input name="rel_id" type=hidden>
			<input type=hidden name="table" value="db_rels">
			<input type=hidden name="operate" value="0">
			<input type=hidden name="url" value='<%=request.getRequestURL()+"?"+request.getQueryString()%>'>
		</td>
	</tr>
	</form>
</table>
</$:G>

<script>
<%
if(ServletUtil.get(request,"rel_table")!=null)
{%>
	document.all.field_ename.value ='<%=ServletUtil.get(request,"field_ename")%>';
	document.all.rel_table.value ='<%=ServletUtil.get(request,"rel_table")%>';
<%}%>
</script>
<script>
function onDel()
{
	if(document.rel.field_ename.value =="")
	{
		alert("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作将删掉此关联信息！"))
		{	
			document.rel.operate.value="2";
			 var s=new Server("editDbMoudelData");
			 s.setFormData("rel");
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
   form.column_name.focus();
}
function onSelColumns()
{
	var table_ename ='<%=sTableEname%>';
	var features ="dialogHeight = 320px; dialogWidth = 550px; help: no; status: no;";//Modal Dialog Window 
    var arrOutArgs = window.showModalDialog("<%=GlobalUtil._WEB_PATH%>/system/database/FieldsSelect.jsp?table_ename=" +table_ename, null, features);
	
	if (arrOutArgs != null){
		document.all.column_name.value =arrOutArgs;
	}
}
function row()
{
	try	{
		Table.click();
		var rel_id =Table.clickRow(document.all.tabMain).REL_ID;
		if(rel_id !="" && typeof rel_id !='undefined')
		{
			document.rel.rel_id.value =rel_id;
			document.rel.field_ename.value =Table.clickRow(document.all.tabMain).FIELD_ENAME;
			 document.rel.rel_table.value =Table.clickRow(document.all.tabMain).REL_TABLE;
			 document.rel.rel_col.value =Table.clickRow(document.all.tabMain).REL_COL;
		 document.rel.operate.value="1";
         document.rel.del.disabled=false;
		}
		else
		{
			document.rel.rel_id.value ='';
			document.rel.table_ename.value ='';
			document.rel.field_ename.value ='';
			document.rel.rel_table.value ='';
			document.rel.rel_col.value ='';
			document.rel.operate.value="0";
			document.rel.del.disabled=true;
		}
	} catch(e){}
}
function submitMe(form)
{
	if(checkForm(form))
	{
	//	alert(form.column_name.value);
	 if (form.rel_table.value =="")
	  {
		 message("关联表不能为空");
		 form.rel_table.focus();
		 return false;
	  }
	 if (form.rel_col.value =="")
	  {
		 message("关联列不能为空");
		 form.rel_col.focus();
		 return false;
	  }
		 var s=new Server("editDbMoudelData");
		 s.setFormData(form);
		 s.send(s, false, function(){
				alert("保存成功！");
				document.location.reload();
			}
		 );
	}
}
function selTable(k)
{
	//message("选择表 index=" +document.all.rel_table.selectedIndex +" k="+k); 
}
function selFieldType(handle)
{
	var table =handle.value;
	document.location.href="TableRel.jsp?table_ename=<%=sTableEname%>&rel_table="+handle.value+"&field_ename="+document.all.field_ename.value;
}
</script>