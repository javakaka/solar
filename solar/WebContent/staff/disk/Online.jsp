<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
	<script src="js/Online.js"></script>
</head>
<body onLoad="getOnlineUser()">
<$:G title="ϵͳ��������">
<table width=100% id="idTbOnlineUser" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td align="center" class="td_c" width=20%>����</td>
		<td align="center" class="td_c">������Ա�б�</td>
	</tr>
</table>
<div align="center"><input type="button" value="ˢ��������Ա�б�" onClick="getOnlineUser()"></div>
</$:G>
</body>
</html>