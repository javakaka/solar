<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="系统错误信息定义">
<div align=left>
<table>
<form>
   <tr>
      <td align=left>&nbsp;错误号查询&raquo;&nbsp;&raquo;&nbsp;<input type=text name="error_code" value='<$:W name="error_code" from="request" default=""/>'><input type=submit value=<$:I item="html.button.query"/>  class="btSearch"></td>
   </tr>
</form>
</table>
</div>
<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" cellpadding="0" cellspacing="0" onClick="row()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap>错误号</td>
		<td class="td_c" width=1% nowrap>提示信息</td>
		<td class="td_c" nowrap>Java程序</td>
      <td class="td_c" nowrap>所属方法</td>
	</tr>
      <$:A service="getErrorMsgs" dynamic="true" pagesize="8">
         <$:P name="error_code" default="" from="request"/>
      </$:A>
      <$:M dtype="1"/>
	<$:T var="message" name="ErrorMsgs" fieldNum="4" pagesize="8" message="没有错误信息">
	  <tr <$:R item="message.ERROR_CODE,ERROR_MSG,JAVA,METHOD"/> class="tr_c">
		<td nowrap width=1%>&nbsp;<$:C item="message.ERROR_CODE"/></td>
		<td nowrap width=90%><$:C item="message.ERROR_MSG" brsize="30"/></td>
		<td nowrap width=1%><$:C item="message.JAVA"/></td>
		<td nowrap width=1%><$:C item="message.METHOD" brsize="40"/></td>
	  </tr>
	</$:T>
	<tr class="tr_c"> 
	<td colspan="4" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="8"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<!--服务列表-->
<$:G title="service.edit" from="4">
	<form action="/system/framework/error_message.do" focus="error_code" onsubmit="return onSubmitMe(this);">
			<table name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%">	
				<tr class="tr_c">
					<td  width=1% nowrap class="td_c" align=right>
						错误号<font color="red">*</font>
					</td>
					<td><input name="error_code" desc='错误号' datatype="number"></td>

					<td  width=1% nowrap class="td_c" align=right>
						错误信息<font color="red">*</font>
					</td>
					<td><input name="error_msg" size=60></td>
				</tr>
				<tr class="tr_c">
					<td  width=1% nowrap class="td_c" align=right>
						Java程序
					</td>
               <td><input name="java" size=40></td>
					<td class="td_c" align=right>
						方法
					</td>
					<td><input name="method" size=60></td>
				</tr>

				<tr class="tr_c">
					<td align=center height=30 valign=top colspan=4><input type="reset" value=<$:I item="html.button.reset"/>   onClick="this.form.reset();this.form.del.disabled=true;"><input type="submit" name="btSubmit" value=<$:I item="html.button.save"/> ><input type=button value=<$:I item="html.button.add"/> onClick="add()" ><input type=button  value=<$:I item="html.button.del"/> onClick ="onDel()" name="del"></td>
				</tr>
			<input type="hidden" name="service_name">
			<input type=hidden name="table" value="FM_ERROR_MESSAGE">
			<input type=hidden name="operate" value="0">
			<input type=hidden name="url" value='<%=request.getRequestURL()+"?"+request.getQueryString()%>'>
			</table>
	</form>
</$:G>

<script>
function url(page)
{
	document.all.sub.src =page;
}
function onDel()
{
	if(document.error_message.error_code.value =="")
	{
		$E.message("没有选择有效的记录！");
	}else{
		if(confirm("注意，此操作就删除配置的提示信息"))
		{
			document.error_message.operate.value="2";
			document.error_message.submit();
		}
	}
}
function row()
{
	try
	{
		Table.click();
		var error_code =Table.clickRow(document.all.tabMain).ERROR_CODE;
		if(error_code !="" && typeof error_code !='undefined')
		{
			document.error_message.error_code.value =error_code;
			if (typeof Table.clickRow(document.all.tabMain).ERROR_MSG !='undefined') 
				document.error_message.error_msg.value =Table.clickRow(document.all.tabMain).ERROR_MSG;
			else
				document.error_message.error_msg.value ="";
			if(typeof Table.clickRow(document.all.tabMain).JAVA !='undefined')
				document.error_message.java.value =Table.clickRow(document.all.tabMain).JAVA;
			else
				document.error_message.java.value ="";
			if (typeof Table.clickRow(document.all.tabMain).METHOD !='undefined')
				document.error_message.method.value =Table.clickRow(document.all.tabMain).METHOD;
			else
				document.error_message.method.value ="";
			document.error_message.operate.value="1";
		}
		else
		{
			document.error_message.error_code.value="";
			document.error_message.java.value="";
			document.error_message.method.value="";
			document.error_message.error_msg.value="";
			document.error_message.operate.value="0";
		}
	}
	catch(e){}
}
function add()
{
	document.error_message.reset();
}
function onSubmitMe(form)
{
   if(checkForm(form))
   {
      form.btSubmit.disabled =true;
   }
   else
      return false;
}
</script>
