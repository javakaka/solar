<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body topmargin=10 leftmargin=10>
<br>
<%
String sTableEname =ServletUtil.get(request,"table_ename");
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="100%"><b><u>���ݿ����ƣ�</u></b><br>
	<$:A service="getTableInfo" dynamic="true">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="table" name="TableInfo">
	<font color=#ff0000>
		<b><$:C item="table.TABLE_CNAME"/></b>
	</font>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;<$:C item="table.TABLE_DESC"/>
	</$:T>
	</td>
  </tr>
  <tr>
    <td width="100%">
      <hr size="1" color="#008000" noshade>
    </td>
  </tr>
  <tr>
    <td width="100%"><b><u>�������ã�</u></b><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('FieldsInclude.jsp?table_ename=<%=sTableEname%>')>�ֶζ���</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('TableKeys.jsp?table_ename=<%=sTableEname%>')>��������</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('TableIndexs.jsp?table_ename=<%=sTableEname%>')>��������</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('TableRel.jsp?table_ename=<%=sTableEname%>')>���������</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:parent.window.document.location.href='PageOption.jsp?table_ename=<%=sTableEname%>'>������</a><br>
</td>
  </tr>
  <tr>
    <td width="100%">
      <hr size="1" color="#008000" noshade>
    </td>
  </tr>

</table>

</body>

</html>
<script>
function go(url)
{
	parent.document.all.main.src=url;
}
</script>