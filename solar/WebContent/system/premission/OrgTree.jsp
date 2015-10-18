<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="部门维护">
<table width="100%" height="475" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="25%" valign="top">
	<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree.js"></script>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="2">
	  <tr>
		<td height=20 valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
		<%
			if(false)
			//if(GlobalNames.UNION_FORUM)
			{
				%>
				<label onClick='runOpen("<%=GlobalUtil._WEB_PATH%>/system/premission/UnionForum.jsp")' style="cursor:hand"><b>◆论坛同步</b></label>
				<label onClick='onSyncRtx()' style="cursor:hand"><b>◆RTX同步</b></label>
				<label onClick='onViewOrg()' style="cursor:hand"><b>◆视图</b></label>
				<%
			}
			%><$:Shutcut shutcut="组织维护" url="/system/premission/OrgTree.jsp" icon="/images/icons/106.gif">快捷进入</$:Shutcut>
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
		<iframe src="<%=GlobalUtil._WEB_PATH%>/system/premission/OrgView.jsp" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</td>
  </tr>
</table>
</$:G>
<script>
function onViewOrg()
{
	document.all.DIFRAME.src ="OrgView.jsp";
}
function action(){
   if(tree.getSelected().parentNode!= null)
   {
		var info =tree.getSelected().info;
		var node =info.split(",");
		var iNodeType =node[3];
		if(iNodeType =="0")
		{//部门
			var iPNodeNo =node[0];
			var iNodeNo =node[1];
			//iPNodeNo -1表示该节点是单位 其他表示该节点是部门
			var sUrl ="?name="+node[2];
			if(iPNodeNo ==-1)
			{
				//type =1 表示该节点是单位，在链接页面要做处理。
				sUrl +="&type=1&upid="+iNodeNo.substring(1);
			}
			else
			{
				sUrl +="&type=2&upid="+iNodeNo;
			}
			document.all.DIFRAME.src ="OrgEdit.jsp"+sUrl;
		}
		else if(iNodeType =="1")
		{//岗位
			var iPNodeNo =node[0];
			var iNodeNo =node[1];
			var sUrl ="?name="+node[2]+"&type=3&upid="+iNodeNo.substring(1)+"&upupid="+iPNodeNo;
			document.all.DIFRAME.src ="OrgEdit.jsp"+sUrl;
			//document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/cardlist.jsp?card=VSM_STAFF&_QPOSI_NO="+node[1].substring(1)+"&POSI_NO="+node[1].substring(1)+"&_QSTATE=1";
		}
   }
   //else
      //document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/cardlist.jsp?card=VSM_STAFF";
}


function onSyncRtx()
{
	var o$S =new $S("syncRtx");
	if(o$S.callService(o$S, true))
	{
		$E.$E.message("RTX用户同步成功！");
	}
}
</script>
