<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<body>
<$:A service="getArchiveWorker" dynamic="false">
	<$:P name="type" value="4"/>
	<$:P name="worker_id" from="request"/>
</$:A>
<$:M dtype="1"/>
<$:T var="worker" name="worker">
<table width="100%" cellpadding="2" cellspacing="2" border="0">
	<tr>
		<td width="27%" align="center"><img src='<%=GlobalUtil._WEB_PATH%><$:C item="worker.PHOTO"/>' width="152" height="202"></td>
		<td width="73%" rowspan="2" valign="top">
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.NAME"/>&nbsp;<$:C item="worker.TITLE_NAME"/>，<$:C item="worker.SEX"/>，<$:C item="worker.BIRTHDAY"/>生。<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.intro"/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.education"/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.project"/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.award"/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.booke"/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.research"/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="worker.teaching"/><br/>
			</p>
		</td>
	</tr>
	<tr>
		<td align="center"><$:C item="worker.NAME"/> <BR><$:C item="worker.SITE_NAME"/> <BR><$:C item="worker.POSI_NAME"/> <BR>办公电话：<$:C item="worker.OFFICE_PHONE"/></td>
	</tr>
</table>	
</$:T>
</body>
</html>