<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<base target="_self">
<%
if(request.getParameter("op") !=null && request.getParameter("op").equals("1"))
{
	%>
	<$:A service="saveCompJavaScript" dynamic="false">
		<$:P name="card" from="request"/>
		<$:P name="comp_type" from="request"/>
		<$:P name="javascript" from="request"/>
		<$:P name="action_type" from="request"/>
	</$:A>
	<$:M dtype="1"/>
	<%
}
%>
<$:A service="getCompJavascript" dynamic="true">
	<$:P name="card" from="request"/>
	<$:P name="comp_type" from="request"/>
	<$:P name="action_type" from="request"/>
</$:A>
<$:M dtype="1"/>
<$:T var="js" name="JavaScript" pagesize="1">
<form>
	<$:G title="Javascript�༭">
	<table width=100% cellpadding="2" cellspacing="1" class="table_c">
		<tr class="tr_c">
			<td class="td_c">JavaScript</td>
			<td><textarea name="javascript" rows="22" cols="60"><$:C item="js.JAVASCRIPT"/></textarea></td>
		</tr>
		<tr class="tr_c">
			<td class="td_c">��ʾ</td>
			<td height=60 valign=middle>
			��$WEB_PATH$:����web����·��<br>��$KEYS$:���ؼ����ַ�����<br>
			��$REQUEST-<i>variable</i>$:Request�еı���<br>��$SESSION-<i>variable</i>$:Session�еı���<br>
			$LOGIN-<i>variable</i>$:��½�Ự�еı���<br></td>
		</tr>
	</table>
	</$:G>
	<div align=center>
	<input type="submit" value=<$:I item="html.button.save"/>><input type="button"   value=<$:I item="html.button.close"/>  onClick="window.close()">
	</div>
	<input type=hidden name="op" value="1">
	<input type=hidden name="card" value='<$:W name="card" from="request"/>'>
	<input type=hidden name="comp_type" value='<$:W name="comp_type" from="request"/>'>
	<input type=hidden name="action_type" value='<$:W name="action_type" from="request"/>'>
</$:T>
</form>