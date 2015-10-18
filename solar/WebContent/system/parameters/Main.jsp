<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
</head>
<body bgcolor="whitesmoke">
<table width="100%" height="95%" border="0" cellpadding="0" cellspacing="3">
  <tr> 
    <td width="25%" valign="top">
	<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree.js"></script>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="2">
	  <tr>
		<td valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
			<$:A service="getSysDictoryTree" dynamic="false">
				<$:P name="moudle_id" from="request" default="1003"/>
			</$:A>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "DictoryItem") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "DictoryItem");
					%>
					<$:Tree treeData="<%=alTree%>" head="静态数据列表" pidF="UP_ID" idF="FIELD_NAME" pid="0" titleF="ITEM_TITLE" hiddenF="UP_ID,FIELD_NAME,ITEM_TITLE" icon="menu.gif"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
	</td>
    <td valign="top">
		<iframe src="Parent.jsp" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</td>
  </tr>
</table>
<form name="ftmp" method=post>
	<input type=hidden name="moudle_id">
</form>
</body>
</html>
<script>
function selectChange(handle)
{
	if(handle.value !='')
	{
		ftmp.moudle_id.value =handle.value;
		ftmp.submit();
	}
}
function action()
{
	if(tree.getSelected().parentNode!= null)
	{
		var info =tree.getSelected().info;
		var node =info.split(",");
		document.all.DIFRAME.src ="Child.jsp?field_ename="+node[1];
	}
	else
	{
		document.all.DIFRAME.src ="Parent.jsp";
	}
}

</script>