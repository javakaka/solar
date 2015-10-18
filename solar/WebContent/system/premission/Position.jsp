<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="部门维护">
<table width="100%" height="475" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="25%" valign="top">
	<link type="text/css" rel="stylesheet" href="<%=GlobalUtil._WEB_PATH%>/res/css/xtree.css">
	<script src="<%=GlobalUtil._WEB_PATH%>/res/js/xtree.js"></script>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="2">
		<tr>
			<td valign=top bordercolor="#FFFFFF" bgcolor="#eeeeee" align=center height=20><a href=javascript:onCommonPosi();>■通用岗位</a></td>
		</tr>
	  <tr>
		<td valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
			<$:A service="getPositionTree" dynamic="true"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "POSITIONTREE") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "POSITIONTREE");
					%>
	<$:Tree treeData="<%=alTree%>" head="部门列表" pidF="UP_POSI_NO" idF="POSI_NO" pid="0" titleF="POSI_NAME" hiddenF="UP_POSI_NO,POSI_NO,POSI_NAME" icon="menu.gif"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
	</td>
    <td valign="top">
		<iframe src="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=TSM_POSITION" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</td>
  </tr>
</table>
</$:G>
<script>
function action(){
   if(tree.getSelected().parentNode!= null)
   {
		var info =tree.getSelected().info;
		var node =info.split(",");
      document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=SM_POSITION&_QUP_POSI_NO="+node[1]+"&UP_POSI_NO="+node[1]+"&UP_POSI_NO_TMP="+node[2];
		
   }
   else
      document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=SM_POSITION";
}
function onCommonPosi()
{
	document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=SM_COMMON_POSITION";
}
</script>