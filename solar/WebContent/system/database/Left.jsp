<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body topmargin=10 leftmargin=10>
<br>
<%
String sTableEname =ServletUtil.get(request,"table_ename");
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="100%"><b><u>数据库名称：</u></b><br>
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
    <td width="100%"><b><u>基本设置：</u></b><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('FieldsInclude.jsp?table_ename=<%=sTableEname%>')>字段定义</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('TableKeys.jsp?table_ename=<%=sTableEname%>')>主键定义</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('TableIndexs.jsp?table_ename=<%=sTableEname%>')>索引定义</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:go('TableRel.jsp?table_ename=<%=sTableEname%>')>表关联定义</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href=javascript:parent.window.document.location.href='PageOption.jsp?table_ename=<%=sTableEname%>'>表单定制</a><br>
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