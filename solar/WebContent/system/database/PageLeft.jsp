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
		<b><$:C item="table.TABLE_CNAME"/></b><br>[<$:C item="table.TABLE_ENAME"/>]
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
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('FieldsStyle.jsp?table_ename=<%=sTableEname%>')">�ֶ���ʾ����</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('FieldsOrder.jsp?table_ename=<%=sTableEname%>')">�б���������</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('FieldsLayout.jsp?table_ename=<%=sTableEname%>')">��ʾ���ֵ���</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('FieldPremission.jsp?table_ename=<%=sTableEname%>')")>��ϸ��ϢȨ��</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('LayoutPreview.jsp?table_ename=<%=sTableEname%>')">��ʾ����Ԥ��</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=PAGE_COMPONETS_DEFINE&table_ename=<%=sTableEname%>&&_Qtable_ename=<%=sTableEname%>')">����Ԫ������</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('TablePremission.jsp?table_ename=<%=sTableEname%>')">Ȩ������</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('HighConfig.jsp?card=<%=sTableEname%>')">�߼�����</a><br>
      <font face="Webdings" color="#FF0000">2</font><a href="javascript:go('<%=GlobalUtil._WEB_PATH%>/system/database/PageComponentEdit.jsp?card=PAGE_OTHER_CONFIG&operate=2&table_ename=<%=sTableEname%>&all=1')">��������</a><br>
		<font face="Webdings" color="#FF0000">2</font><a href="javascript:setAnotherTable()">����ת</a><br>
		<font face="Webdings" color="#FF0000">2</font><a href="javascript:editData()">����ά��</a>
      <!--<font face="Webdings" color="#FF0000">2</font><a href="javascript:go('<%=GlobalUtil._WEB_PATH%>/system/database/html_code.jsp?card=TPAGE_OTHER_CONFIG&operate=2&table_ename=<%=sTableEname%>')">��Ϊ��̬Code</a>-->
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
function setAnotherTable()
{
	var sCard =window.prompt("�������Ӣ����!", "TOA_");
	if(sCard !=null)
		parent.window.document.location.href='PageOption.jsp?table_ename='+sCard;
}

function editData()
{
	window.open(WEB_PATH+"/system/card/CardList.jsp?card="+$E.getParameter("table_ename"));
}
</script>