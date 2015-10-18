<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<base target="_self">
<$:G title="field.list" from="4">
<div align=right><input name="btApplyDB" type="button" value="应用数据库(A)" onClick="onApplyToTable()" accesskey="A" class="bttopfirst"></div>
<table id="tabMain" name="tabMain" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width="100%" onClick="row()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_cname"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_ename"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_type"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_length"/></td>
		<td class="td_c" width=1% nowrap>默认值</td>
		<td class="td_c" width=1% nowrap>是否空值</td>
		<td class="td_c" nowrap><$:I item="db_fields.field_desc"/></td>
		<td class="td_c" nowrap>界面提醒</td>
		<td class="td_c" nowrap>Tab键值</td>
		<td class="td_c" nowrap>状态</td>
	</tr>
	<$:A service="getTableFields" dynamic="true">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="field" name="Fields">
	  <tr class="tr_c" <$:R item="field.FIELD_CNAME,FIELD_ENAME,FIELD_TYPE,FIELD_LENGTH,DEFAULT_VALUE,IS_NULL,FIELD_DESC,IS_KEY,TAG,REMIND,THETAB"/>>
		<td nowrap>&nbsp;<$:C item="field.FIELD_CNAME"/></td>
		<td nowrap>&nbsp;<$:C item="field.FIELD_ENAME"/>&nbsp;</td>
		<td nowrap>&nbsp;<$:C item="field.DISP_VIEW"/></td>
		<td nowrap>&nbsp;<$:C item="field.FIELD_LENGTH"/></td>
		<td nowrap>&nbsp;<$:C item="field.DEFAULT_VALUE"/></td>
		<td align="center" nowrap><$:C item="field.IS_NULL" replace="[1,不为空][0,可为空]"/></td>
		<td nowrap>&nbsp;<$:C item="field.FIELD_DESC" brsize="15"/></td>
		<td nowrap>&nbsp;<$:C item="field.REMIND" brsize="15"/></td>
		<td nowrap>&nbsp;<$:C item="field.THETAB"/></td>
		<td nowrap>&nbsp;<$:C item="field.TAG" replace="[4,删除未应用][3,修改未应用][2,添加未应用][1,已应用][0,未应用到数据库]"/></td>
	  </tr>
	</$:T>
</table>
</$:G>
<$:G title="field.edit" from="4">
	<form name="field">
			<table name="tabMain" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width="100%">	
				<tr bgcolor="#FFFFFF">
					<td  width=1% nowrap align=right class="td_c">
						<$:I item="System.database.field_ename"/>：
					</td>
					<td><input name="field_ename_tmp" desc='<$:I item="db_fields.field_ename"/>' notnull size=15 style="text-transform:uppercase"></td>
					<td  width=1% nowrap align=right class="td_c">
						<$:I item="System.database.field_cname"/>：
					</td>
					<td><input name="field_cname" desc='<$:I item="db_fields.field_cname"/>' datatype="string" size=20></td>
					<td  width=1% nowrap align=right class="td_c">
						<$:I item="db_fields.field_type"/><font color="red">*</font>：
					</td>
					<td >
								<$:A service="getSysDictoryItems" dynamic="false">
									<$:P name="Item" value="FIELD_TYPE"/>
								</$:A>
								<$:M dtype="1"/>
								<$:L name="field_type_tmp" rs="FIELD_TYPE" valueField="used_view" textField="disp_view" value="" firstText="请选择..." props='onChange="selFieldType(this.form)"'/>
						<$:I item="db_fields.field_length"/>
					<input name="field_length" size=10 desc='<$:I item="db_fields.field_length"/>' datatype="number" allownull="true" min="1"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width=1% nowrap align=right class="td_c">是否空值：</td><td><input type="checkbox" name="is_nullable" checked></td>
					<td  width=1% nowrap align=right class="td_c">
						Tab键值：
					</td>
					<td colspan=3>
					<SELECT NAME="thetab">
						<%
						for(int i=0; i<100;i++)
						{
							out.println("<option value=\""+i+"\">"+i+"&nbsp;&nbsp;&nbsp;&nbsp;</option>");
						}
						%>

					</SELECT></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td  width=1% nowrap align=right class="td_c">
						<$:I item="db_fields.field_desc"/>：
					</td>
					<td colspan=5><textarea rows=3 style="width:100%" name="field_desc"></textarea></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td  width=1% nowrap align=right class="td_c">
						界面提醒：
					</td>
					<td colspan=5><input name="remind" style="width:100%"></td>
				</tr>
				<tr bgcolor="#FFFFFF">
					<td width=1% nowrap align=right class="td_c">默认值：</td>
					<td colspan=5>staff-no:登陆人编号 staff-name:登陆人姓名  site-no:登陆人部门编号 site-name:登陆人部门名称  sysdate:系统日期<br><textarea rows=3 style="width:100%" name="default_value"></textarea></td>
					
				</tr>
			   <tr bgcolor="#FFFFFF">
					<td align=center colspan=10><input type="button" value=<$:I item="html.button.reset"/>    onClick="this.form.reset();document.all.del.disabled=true;"><input name="btSave" type="button" value=<$:I item="html.button.save"/>   onClick="submitMe(this.form)"><input type=button value='<$:I item="System.field.add"/>'   onClick="add(this.form);"><input type=button value='<$:I item="System.field.del"/>'   onClick ="onDel(this.form)" name="del" disabled></td>
				</tr>
			</table>
			<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request"/>'>
			<input name="field_ename" type=hidden>
			<input type=hidden name="table" value="db_fields">
			<input type=hidden name="operate" value="0">
			<input type=hidden name="url" value='<%=request.getRequestURL()+"?"+request.getQueryString()%>'>
			<input type=hidden name="is_null">
			<input type=hidden name="tag">
			<input type=hidden name="field_type">
	</form>
</$:G>
<script>
function onDel(form)
{
	if(document.field.field_ename.value =="")
	{
		alert("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作将删掉此字段信息！"))
		{
			document.field.operate.value="2";
			var s=new Server("editDbMoudelData");
			s.setFormData(form);
			$E.disabled();
			s.send(s, false, function(){
					alert("保存成功！");
					$E.abled();
					document.location.reload();
				}
			);
		}
	}
}
function onApplyToTable()
{
	var s =new Server("applyToDB");
	s.setParamValue("default", "table_ename", $E.getParameter("table_ename"));
	if(s.send(s, true))
	{
		alert("数据库应用成功！");
		document.location.reload();
	}
}
function add(form)
{
   form.reset();
   form.field_ename_tmp.disabled =false;
   form.field_type_tmp.disabled=false;
   form.is_nullable.disabled=false;
   form.field_ename_tmp.focus();
}
function selFieldType(form)
{
	var field_type =form.field_type_tmp.value;
	if (field_type !='1' && field_type !='2' && field_type !='3')
	{
		form.field_length.value ="";
		form.field_length.disabled =true;
	}
	else
	{
		form.field_length.disabled =false;
	}
	if (field_type =='2')
		form.field_length.value ='20';
	else
		form.field_length.value ='';
	if (field_type =='4')
		form.default_value.value ='sysdate';
	else
		form.default_value.value ='';
}
function row()
{
	try	{
		Table.click();
		var field_ename =Table.clickRow(document.all.tabMain).FIELD_ENAME;
		if(field_ename !="" && typeof field_ename !='undefined')
		{
			document.field.field_ename.value =field_ename;
			document.field.field_ename_tmp.value=field_ename;
			document.field.field_cname.value =Table.clickRow(document.all.tabMain).FIELD_CNAME;
			var field_type =Table.clickRow(document.all.tabMain).FIELD_TYPE;
			document.field.field_type.value =field_type;
			document.field.field_type_tmp.value =field_type;
			var tag =Table.clickRow(document.all.tabMain).TAG;
			document.field.tag.value =tag;
			if (tag =='0' || tag =='2')
			{
				document.all.field_type_tmp.disabled=false;
				document.all.is_nullable.disabled=false;
			}
			else
			{
				document.all.field_type_tmp.disabled=true;
				document.all.is_nullable.disabled=true;
			}
			if (field_type !='1' && field_type !='2' && field_type !='3')
				document.field.field_length.readonly =true;
			else
				document.field.field_length.readonly =false;
         if(typeof Table.clickRow(document.all.tabMain).FIELD_LENGTH !="undefined")
			document.field.field_length.value =Table.clickRow(document.all.tabMain).FIELD_LENGTH;
		 else
			document.field.field_length.value ="";
         if(typeof Table.clickRow(document.all.tabMain).DEFAULT_VALUE !="undefined")
			document.field.default_value.value =Table.clickRow(document.all.tabMain).DEFAULT_VALUE;
		 else
			document.field.default_value.value ="";
		if(typeof Table.clickRow(document.all.tabMain).FIELD_DESC !="undefined")
			document.field.field_desc.value = Table.clickRow(document.all.tabMain).FIELD_DESC;
		else
			document.field.field_desc.value ="";
		if(typeof Table.clickRow(document.all.tabMain).REMIND !="undefined")
			document.field.remind.value = Table.clickRow(document.all.tabMain).REMIND;
		else
			document.field.remind.value ="";
		
		if(typeof Table.clickRow(document.all.tabMain).THETAB !="undefined")
			document.field.thetab.value = Table.clickRow(document.all.tabMain).THETAB;
		else
			document.field.thetab.value ="0";
		document.field.field_ename_tmp.disabled =true;
         var is_null =Table.clickRow(document.all.tabMain).IS_NULL;
		document.field.is_null.value =is_null;
         if(is_null =='1')
            document.field.is_nullable.checked =false;
         else
            document.field.is_nullable.checked =true;
		document.field.operate.value="1";
        document.all.del.disabled=false;
		}
		else
		{
			document.field.field_ename.value ='';
			document.field.field_ename_tmp.value='';
			document.field.field_cname.value ='';
			document.field.field_type_tmp.value ='';
			document.field.field_desc.value ='';
			document.field.field_length.value ='';
			document.field.field_ename_tmp.disabled =false;
			document.field.is_null.value ='0';
            document.field.is_nullable.checked =true;
			document.field.operate.value="0";
            document.all.del.disabled=true;
		}
	}catch(e){}
}
function submitMe(form)
{
	if(checkForm(form))
	{
      //Oracle保留字如下: 
      var sKeyWord = 'ACCESS,ADD,ALL,ALTER,AND,ANY,AS,ASC,AUDIT,BETWEEN,BY,CHAR,CHECK,CLUSTER,COLUMN,COMMENT,COMPRESS,CONNECT,CREATE,CURRENT,DATE,DECIMAL,DEFAULT,DELETE,DESC,DISTINCT,DROP,ELSE,EXCLUSIVE,EXISTS,FILE,FLOAT,FOR,FROM,GRANT,GROUP,HAVING,IDENTIFIED,IMMEDIATE,IN,INCREMENT,INDEX,INITIAL,INSERT,INTEGER,INTERSECT,INTO,IS,LEVEL,LIKE,LOCK,LONG,MAXEXTENTS,MINUS,MLSLABEL,MODE,MODIFY,NOAUDIT,NOCOMPRESS,NOT,NOWAIT,NULL,NUMBER,OF,OFFLINE,ON,ONLINE,OPTION,OR,ORDER,PCTFREE,PRIOR,PRIVILEGES,PUBLIC,RAW,RENAME,RESOURCE,REVOKE,ROW,ROWID,ROWNUM,ROWS,SELECT,SESSION,SET,SHARE,SIZE,SMALLINT,START,SUCCESSFUL,SYNONYM,SYSDATE,TABLE,THEN,TO,TRIGGER,UID,UNION,UNIQUE,UPDATE,USER,VALIDATE,VALUES,VARCHAR,VARCHAR2,VIEW,WHENEVER,WHERE,WITH,LOAD';
	  var aKeyWord =sKeyWord.split(",");
	  var sName =form.field_ename_tmp.value.toUpperCase();
	  for (var i=0; i <aKeyWord.length; i++)
	   {
			if (sName ==aKeyWord[i])
		   {
				$E.message("[" +sName +"]是保留字，请重新输入!");
				form.field_ename_tmp.select();
				form.field_ename_tmp.focus();
				return false;
		   }
	   }
      if(form.field_type_tmp.value =="")
      {
         $E.message("请选择数据类型");
         form.field_type_tmp.focus();
         return false;
      }
      if(form.field_type_tmp.value =='2')
		  if (form.field_length.value =='')
		  {
			 $E.message("请输入长度");
			 form.field_length.focus();
			 return false;
		  }
	  if (form.is_nullable.checked)
		  form.is_null.value =0;
	  else
		  form.is_null.value =1;
	  var itype =form.field_type_tmp.value;
	  if (document.field.operate.value!='0' && (itype!='4' && itype!='5' && itype!='6'))
		{
		  var flen =new Number(Table.clickRow(document.all.tabMain).FIELD_LENGTH);
		  var clen =new Number(form.field_length.value);
	//	  alert("flen=" +flen +" clen=" +clen +" clen<flen=" +clen<flen);
		  if (document.all.field_type_tmp.value !=8 && clen <flen)	
		  {
			 $E.message("为避免数据丢失，输入长度不能小于原字段长度！");	
			 form.field_length.disable
			 form.field_length.focus();
			 form.field_length.select();
			 return false;
		  }
		}
	  form.field_ename.value=form.field_ename_tmp.value;
	  form.field_type.value=form.field_type_tmp.value;
	  //form.submit();
		var s=new Server("editDbMoudelData");
		s.setFormData(form);
		$E.disabled();
		s.send(s, false, function(){
				alert("保存成功！");
				$S("operate", "1") ;
				$E.abled();
				document.location.reload();
			}
		);

	}
}
</script>