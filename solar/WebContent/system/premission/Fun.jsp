<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<table width="100%" height="95%" border="0" cellpadding="0" cellspacing="3">
  <tr> 
    <td width="25%" valign="top">
	<link type="text/css" rel="stylesheet" href="<%=GlobalUtil._WEB_PATH%>/res/css/xtree.css">
	<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree.js"></script>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="2">
	  <tr>
		<td valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
			<$:A service="getFunTree" dynamic="true"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "FUNTREE") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "FUNTREE");
					%>
						<$:Tree treeData="<%=alTree%>" head="²Ëµ¥ÁÐ±í" pidF="UP_FUN_ID" idF="FUN_ID" pid="0" titleF="FUN_NAME" hiddenF="UP_FUN_ID,FUN_ID,FUN_NAME" icon="menu.gif"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
	</td>
    <td valign="top">
		<iframe src="FunInclude.jsp" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</td>
  </tr>
</table>
<script>
function action(){
   if(tree.getSelected().parentNode!= null)
   {
		var info =tree.getSelected().info;
		var node =info.split(",");
      document.all.DIFRAME.src ="FunInclude.jsp?fun_id="+node[1];
   }
   else
      document.all.DIFRAME.src ="FunInclude.jsp";
}
</script>