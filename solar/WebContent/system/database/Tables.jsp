<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="数据表列表">
<div align=left>
<table>
<form name="fmQueryTable">
   <tr>
      <td align=left>&nbsp;数据表查询&raquo;&nbsp;英文名&raquo;&nbsp;<input type=text name="table_ename" value='<$:W name="table_ename" from="request" default=""/>'>中文名&raquo;&nbsp;<input type=text name="table_cname" value='<$:W name="table_cname" from="request" default=""/>' >所属模块:<$:A service="queryMoudleList" dynamic="true"/>
						<$:M dtype="1"/>
						<$:L name="moudle" rs="ListValue" valueField="value" textField="text" firstText="请选择..."/><input type=submit value=<$:I item="html.button.query"/> >
      <script>
         var moudle ='<$:W name="moudle" from="request" default=""/>';
         if(moudle !='')
            document.all.moudle.value =moudle;
      </script>
      </td>
   </tr>
</form>
</table>
</div>
<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="row()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap><$:I item="db_table.table_cname"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_table.table_ename"/></td>
		<td class="td_c" width=1% nowrap><$:I item="System.database.moudle_name"/></td>
		<td class="td_c" nowrap><$:I item="db_table.table_desc"/></td>
		<td class="td_c" nowrap>状态</td>
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
	<$:M dtype="1"/>
	<$:T var="table" name="Tables" fieldNum="5">
	  <tr class="tr_c" <$:R item="table.TABLE_ENAME,TABLE_CNAME,TABLE_DESC,MOUDLE_ID,IS_TRACK,IS_KEEP_TIME,TAG"/>>
		<td nowrap>&nbsp;<$:C item="table.TABLE_CNAME"/></td>
		<td nowrap><$:C item="table.TABLE_ENAME"/>&nbsp;</td>
		<td nowrap><$:C item="table.MOUDLE_NAME"/></td>
		<td nowrap><$:C item="table.TABLE_DESC" brsize="50"/></td>
		<td nowrap><$:C item="table.TAG" replace="[2,删除未应用到数据库][1,已应用到数据库][0,未应用到数据库]"/></td>
	  </tr>
	</$:T>
	<tr bgcolor="#FFFFFF"> 
	<td colspan="10" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="10"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<$:G title="table.edit" from="4">
	<form name="table">
			<table name="tabMain" cellpadding="4" border="0" cellspacing="1" bgcolor="#0099FF" width="100%">	
				<tr bgcolor="#FFFFFF">
					<td  width=10% nowrap align=right class="td_c">
						<$:I item="System.database.table_ename"/>
					</td>
					<td><input name="table_ename_tmp" desc='<$:I item="db_table.table_ename"/>' datatype="string" size=20 notnull style="text-transform:uppercase"></td>
					<td  width=1% nowrap class="td_c">
						<$:I item="System.database.table_cname"/>
					</td>
					<td><input name="table_cname" notnull desc='<$:I item="db_table.table_cname"/>' datatype="string" size=20></td>
					<td  width=1% nowrap class="td_c">
						<$:I item="System.database.moudle_name"/><font color="red">*</font>
					</td>
					<td>
						<$:A service="queryMoudleList" dynamic="true"/>
						<$:M dtype="1"/>
						<$:L name="moudle_id" rs="ListValue" valueField="value" textField="text" firstText="请选择..."/>
					</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td colspan=2 width=1% nowrap align=right><input type=checkbox name="is_track_tmp" class='radio' checked>是否保留轨迹</td>
					<td colspan=4 width=1% nowrap><input type=checkbox name="is_keep_time_tmp" class='radio'>是否保留时间戳</td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td  width=1% nowrap align=right class="td_c">
						<$:I item="db_table.table_desc"/>
					</td>
					<td colspan=5><input name="table_desc" style="width:100%"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td align=center colspan=10><input type="button" value=<$:I item="html.button.reset"/>    onClick="this.form.reset();document.all.del.disabled=true;"><input name="btSave" type="button" value=<$:I item="html.button.save"/>   onClick="submitMe(this.form)"><input type=button value='<$:I item="System.table.add"/>'   onClick="this.form.reset();document.all.table_ename_tmp.disabled=false;document.all.table_ename_tmp.focus();"><input type=button value='删除逻辑表'   onClick ="onDel(0)" name="del" disabled><input type=button value='删除物理表'   onClick ="onDel(1)" name="del_phy" disabled><input type=button value="表参数设置" onClick="document.location ='TableOption.jsp?table_ename='+document.table.table_ename.value" name="tableoption" disabled><input type=button value='表结构复制'   onClick ="onCopy()" name="table_stru_copy" disabled></td>
				</tr>

			<input name="del_tag" type=hidden>
			<input name="table_ename" type=hidden>
			<input type=hidden name="operate" value="0">
			<input type=hidden name="is_track">
			<input type=hidden name="is_keep_time">
			<input type=hidden name="tag">
	</form>
</$:G>
<script>
function onDel(deltag)
{
	if(document.table.table_ename.value =="")
	{
		alert("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作将删掉此表并且删掉其配置的字段信息！"))
		{
			var tag =Table.clickRow(document.all.tabMain).TAG;
			document.table.operate.value ="2";
			document.table.tag.value =tag;
			document.table.del_tag.value =deltag;
			var s=new Server("editDbMoudelData");
			s.setFormData(table);
			s.setParam("table", "db_table");
			$E.disabled();
			s.send(s, false, function(){
					alert("保存成功！");
					document.location.reload();
				}
			);

		}
	}
}
function row()
{
	try	{
		Table.click();
		var table_ename =Table.clickRow(document.all.tabMain).TABLE_ENAME;
		if(table_ename)
		{
			document.table.table_ename.value =table_ename;
			document.table.table_ename_tmp.value=table_ename;
			document.table.table_cname.value =Table.clickRow(document.all.tabMain).TABLE_CNAME;
			var tmp=Table.clickRow(document.all.tabMain).TABLE_DESC;
			if (tmp)
				document.table.table_desc.value = tmp;
			else
				document.table.table_desc.value ="";
			document.table.moudle_id.value =Table.clickRow(document.all.tabMain).MOUDLE_ID;
			document.table.table_ename_tmp.disabled =true;
			var is_track =Table.clickRow(document.all.tabMain).IS_TRACK;
			document.table.is_track.value =is_track;
			document.table.is_track_tmp.value =is_track;
			if(is_track =='1')
				document.table.is_track_tmp.checked =true;
			else
				document.table.is_track_tmp.checked =false;
			var is_keep_time =Table.clickRow(document.all.tabMain).IS_KEEP_TIME;
			document.table.is_keep_time.value =is_keep_time;
			document.table.is_keep_time_tmp.value =is_keep_time;
			if(is_keep_time =='1')
				document.table.is_keep_time_tmp.checked =true;
			else
				document.table.is_keep_time_tmp.checked =false;
			var stag =Table.clickRow(document.all.tabMain).TAG;
			if (stag !='0')
			{
				document.all.del_phy.disabled =false;
				document.all.is_keep_time_tmp.disabled =true;
			}
			else
			{
				document.all.del_phy.disabled =true;
				document.all.is_keep_time_tmp.disabled =false;
			}
			if (stag !='2')
				document.all.del.disabled =false;
			else
				document.all.del.disabled =true;
			document.table.table_stru_copy.disabled=false;
			document.table.operate.value="1";
			document.all.tableoption.disabled=false;
		}
		else
		{
			document.table.table_ename.value ='';
			document.table.table_ename_tmp.value='';
			document.table.table_cname.value ='';
			document.table.table_desc.value ='';
			document.table.moudle_id.value ='';
			document.table.table_ename_tmp.disabled =false;
			document.table.is_track.value ='';
			document.table.is_track_tmp.value ='';
			document.table.is_keep_time.value ='';
			document.table.is_keep_time_tmp.value ='';
			document.table.operate.value="0";
			document.all.btSave.disabled =true;
			document.all.del.disabled=true;
			document.all.del_phy.disabled=true;
			document.table.table_stru_copy.disabled=true;
			document.all.tableoption.disabled=true;
		}
	}catch(e){}
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
      if(form.is_keep_time_tmp.checked)
         form.is_keep_time.value =1;
      else
         form.is_keep_time.value =0;
      if(form.is_track_tmp.checked)
         form.is_track.value =1;
      else
         form.is_track.value =0;
		if($V("tag") =="")
			$S("tag", "0");
		form.table_ename.value=form.table_ename_tmp.value;
		var s=new Server("editDbMoudelData");
		s.setFormData(form);
		s.setParam("table", "db_table");
		$E.disabled();
		s.send(s, false, function(){
				alert("保存成功！");
				document.all.fmQueryTable.table_ename.value =form.table_ename.value;
				document.all.fmQueryTable.submit();
			}
		);
	}
}
function onCopy()
{
	var table_ename =Table.clickRow(document.all.tabMain).TABLE_ENAME;
	//alert("========"+table_ename);
	runOpen('<%=GlobalUtil._WEB_PATH%>/system/database/TableList.jsp?nname='+table_ename, false, 768, 350);
}
</script>