<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<table cellSpacing=0 cellPadding=0 border=0 width=100%>
<tr><td valign=top>
<div id="icefable1" align="center" width=100%>
	<$:A service="getPushBulletin" dynamic="false">
		<$:P name="type" value="3"/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="bulletin" name="bulletin">
	<table width=100%>
		<tr class="tr_c">
			<td align=center><font color="#0000CC"><U><B><$:C item="bulletin.TITLE"/></B></U></a><$:C item="bulletin.URGENT_LEVEL" replace="[1,■普通][2,<font color='#0066FF'>■重要</font>][3,<font color='#FF0000'>■非常重要</font>]"/></td>
		</tr>
		<tr class="tr_c">
			<td><font color="#9900CC">&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=GlobalUtil._WEB_PATH%>/oa/bulletin/bulletins.jsp"><$:C item="bulletin.CONTENT"/></a></font></td>
		</tr>
	</table>
	</$:T>
</div>
</tr>
</table>
