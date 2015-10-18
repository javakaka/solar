<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="群组列表">
<table id="tabMain" name="tabMain" width="100%" onClick="row()" cellpadding="2" cellspacing="1" class="table_c">	
	<tr class="tr_c">
			<td class="td_c" width=1% nowrap>群组编号</td>
			<td class="td_c" width=1% nowrap><$:I item="sm_group.group_name"/></td>
			<td class="td_c" nowrap>群组人员</td>
		</tr>
		<$:A service="getGroupStaffs" dynamic="false" pagesize="7"/>
		<$:M dtype="1"/>
		<$:T var="group" name="groups" fieldNum="3" pagesize="7" message="无群组信息">
		  <tr class="tr_c" <$:R item="group.GROUP_ID,GROUP_NAME,GROUP_CONF,STAFF_NAMES,STAFF_NOS,IS_SQL"/>>
			<td nowrap>&nbsp;<$:C item="group.GROUP_ID"/></td>
			<td nowrap>&nbsp;<$:C item="group.GROUP_NAME"/>&nbsp;</td>
			<td nowrap>&nbsp;<$:C item="group.STAFF_NAMES" brsize="70"/></td>
		  </tr>
		</$:T>
      <tr class="tr_c">
      <td colspan="3" height="1%" align="right">  
         <form name="formpage">
            <$:Page pagesize="7"/>
         </form>
      </td>
      </tr>
	</table>
</$:G>
<table width=100% cellpadding="2" cellspacing="1" class="table_c">
   <form name="group">
	<tr class="tr_c">
		<td  width=1% nowrap class="td_c" align=right>
			群组名称:&nbsp;<font color="red">*</font>
		</td>
		<td><input name="group_name" desc='群组名称' datatype="string" max="50" size=20></td>
	</tr>
	<tr class="tr_c">
		<td  width=1% nowrap valign=top class="td_c" align=right>
			群组设置:&nbsp;<font color="red">*</font>
		</td>
		<td>
			<table height="100%" width="100%">
				<tr>
					<td><input type="radio" name="is_sql" id="idCkIsSql1" class="radio" value="0" checked onClick="onCheck()"><label for="idCkIsSql1" style="curor:hand">SQL</label></td>
					<td><TEXTAREA NAME="group_conf" ROWS="2" COLS="80"></TEXTAREA></td>
				</tr>
				<tr>
					<td><input type="radio" name="is_sql" id="idCkIsSql2" class="radio" value="1" onClick="onCheck()"><label for="idCkIsSql2" style="curor:hand">选择人员</label></td>
					<td><input type="hidden" name="staff_nos"><TEXTAREA NAME="staff_names" ROWS="2" COLS="80" readonly></TEXTAREA><img style="cursor:hand" name="btSelectStaff" SRC='<%=GlobalUtil._WEB_PATH%>/images/select.gif'  onClick='onSelectStaff(document.group.staff_nos,document.group.staff_names,1);return false;'></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr class="tr_c">
		<td align=center colspan=2><input type="reset" value=<$:I item="html.button.reset"/> ><input type="button" name="btSubmit" value=<$:I item="html.button.save"/> onClick="onSubmitMe()"><input type=button value=<$:I item="html.button.add"/> onClick="onAdd(this.form)"><input type=button value=<$:I item="html.button.del"/> onClick ="onDel()" name="del" disabled></td></td>
	</tr>
	<input type=hidden name="table" value="SM_GROUP">
	<input type=hidden name="group_id">
	<input type=hidden name="operate" value="0">
</table>
</form>
<script>
onCheck();
function row()
{
	try
	{
		Table.click();
		var group_id =Table.clickRow("tabMain").GROUP_ID;
		var group_name =Table.clickRow("tabMain").GROUP_NAME;
		var group_conf =Table.clickRow("tabMain").GROUP_CONF;
		var is_sql =Table.clickRow("tabMain").IS_SQL;
		//var staff_nos =Table.clickRow("tabMain").STAFF_NOS;
		//var staff_names =Table.clickRow("tabMain").STAFF_NAMES;
		if(group_id !="" && typeof group_id !='undefined')
		{
			document.group.group_id.value =group_id;
			document.group.group_name.value =group_name;
			if(is_sql==0)
			{
				document.group.is_sql[0].checked=true;
				document.group.group_conf.value =Table.clickRow("tabMain").GROUP_CONF;
				document.group.staff_names.value='';
				document.group.staff_nos.value='';
				onCheck();
			}
			else
			{
				document.group.is_sql[1].checked=true;
				document.group.group_conf.value ='';
				document.group.staff_names.value=Table.clickRow("tabMain").STAFF_NAMES;
				document.group.staff_nos.value=Table.clickRow("tabMain").STAFF_NOS;
				onCheck()
			}
			document.all.del.disabled=false;
			document.group.operate.value ="1";
		}
      else
      {
		 document.group.is_sql[0].checked=true;
		 document.group.group_conf.value ='';
		 document.group.staff_names.value='';
		 document.group.staff_nos.value='';
         document.all.del.disabled=true;
		 onCheck();
      }
	}
	catch(e){}
}
function onCheck()
{
	if(document.group.is_sql[0].checked)
	{
		document.group.group_conf.disabled=false;
		document.all.btSelectStaff.disabled=true;
		document.group.staff_names.disabled=true;
		document.all.btSelectStaff.src='<%=GlobalUtil._WEB_PATH%>/images/no_select.gif';
	}
	else
	{
		document.group.staff_names.disabled=false;
		document.all.btSelectStaff.disabled=false;
		document.group.group_conf.disabled=true;
		document.all.btSelectStaff.src='<%=GlobalUtil._WEB_PATH%>/images/select.gif';
	}
}
function onDel()
{
	if(document.group.group_id.value =="")
	{
		$E.message("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作将删掉群组！"))
		{
			document.group.operate.value="2";
			var s=new Server("editSysMoudelData");
			s.setFormData();
			s.send(s, false, function(){
					alert("保存成功！");
					$E.reload();
				}
			);      
		}
	}
}
function onAdd(form)
{
   form.group_id.value ='';
   form.group_name.value ='';
   form.group_conf.value ='';
   form.staff_nos.value ='';
   form.staff_names.value ='';
   //form.is_sql[0].checked=true;
   form.operate.value ='0';
}
function onSelectStaff(handlevalue,handletext,multi)
{
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
   var url ='<%=GlobalUtil._WEB_PATH%>/system/card/SelectStaff.jsp?staff_nos='+handlevalue.value+"&checkboxtype=1";
   if(multi ==1)
      url +="&multi=1";
   var sel_staff_nos=window.showModalDialog(url,window, features);
   if(sel_staff_nos !="" && typeof sel_staff_nos !='undefined')
   {
      var staff =sel_staff_nos.split(".");
      handlevalue.value =staff[0];
      handletext.value =staff[1];
   }
}

function onSubmitMe(form)
{
   if(checkForm(form))
   {
		var s=new Server("editSysMoudelData");
		s.setFormData();
		s.send(s, false, function(){
				alert("保存成功！");
				$E.reload();
			}
		);      
   }
   else
      return false;
}
</script>
