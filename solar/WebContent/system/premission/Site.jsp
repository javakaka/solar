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
		<td valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL">
			<$:A service="getBureauTree" dynamic="false"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "SITES") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "SITES");
					%>
	<$:Tree treeData="<%=alTree%>" head="部门列表" pidF="UP_SITE_NO" idF="SITE_NO" pid="-1" titleF="SITE_NAME" hiddenF="UP_SITE_NO,SITE_NO,SITE_NAME,SITE_TYPE" icon="menu.gif"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
	</td>
    <td valign="top">
		<iframe src="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=TSM_SITE" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
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
		//0区域单位1部门
		var sSiteType =node[3];
		var sSrc ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=SM_SITE";
		if(sSiteType =="0")
		{//区域单位
			sSrc +="&_QBUREAU_NO="+node[1].substring(1)+"&_QUP_SITE_NO=0&UP_SITE_NO=0&BUREAU_NO="+node[1].substring(1);
		}
		else
		{
			sSrc +="&_QUP_SITE_NO="+node[1]+"&UP_SITE_NO="+node[1]+"&UP_SITE_NO_TMP="+node[2];
		}
      document.all.DIFRAME.src =sSrc;
		
   }
   else
      document.all.DIFRAME.src ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=SM_SITE";
}

</script>