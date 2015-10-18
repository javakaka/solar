<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
	<script src="js/Online.js"></script>
</head>
<body onLoad="getOnlineUser()">
<$:G title="系统在线人数">
<table width=100% id="idTbOnlineUser" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td align="center" class="td_c" width=20%>部门</td>
		<td align="center" class="td_c">在线人员列表</td>
	</tr>
</table>
<div align="center"><input type="button" value="刷新在线人员列表" onClick="getOnlineUser()"></div>
</$:G>
</body>
</html>