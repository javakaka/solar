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
		<td height=20 valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
		<%
			if(GlobalNames.UNION_FORUM)
			{
				%>
				<label onClick='runOpen("<%=GlobalUtil._WEB_PATH%>/system/premission/UnionForum.jsp")' style="cursor:hand"><b>◆论坛同步</b></label>
				<%
			}
			%>
			<label onClick='onSyncRtx()' style="cursor:hand"><b>◆RTX同步</b></label>
			</td>
		</tr>
	  <tr>
		<td valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
			<$:A service="getDeptPostionTree" dynamic="false"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "DEPTPOSITION") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "DEPTPOSITION");
					%>
					<$:Tree treeData="<%=alTree%>" head="部门岗位树" pidF="UP_ID" idF="ID" pid="-1" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
	</td>
    <td valign="top">
		<iframe src="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=VSM_STAFF" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
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
		if(node[3]=="1")
			document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=VSM_STAFF&_QPOSI_NO="+node[1].substring(1)+"&POSI_NO="+node[1].substring(1)+"&_QSTATE=1";
		
		
   }
   //else
      //document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/cardlist.jsp?card=VSM_STAFF";
}


function onSyncRtx()
{
	var o$S =new $S("syncRtx");
	if(o$S.callService(o$S, true))
	{
		$E.message("RTX用户同步成功！");
	}
}
</script>