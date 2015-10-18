<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><cc:message key="framework.nav.org" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="<%=basePath%>/res/css/xtree2.css" ></link>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]

});
</script>
<script src="<%=basePath%>/res/js/xtree2.js"></script>
</head>
<body onload="onViewOrg()">
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo;<cc:message key="framework.nav.org" />
	</div>
	<div style="width:100%;height:95%;position: absolute;">
		<div id="treeDiv" style="width:20%;float: left;">
			<div>
				<input type="button" value="收起/展开" onclick="tree.toggle()"  />
				<input type="button" value="全部展开" onclick="tree.expandAll()" />
			</div>
			<div>
				<input type="button" value="一级目录" onclick="tree.collapseChildren()" />
				<input type="button" value="刷新目录" onclick="javascript:window.location.reload();" />
			</div>
			<cc:xtree treeData="${treeData}" head="部门岗位树" pidF="UP_ID" idF="ID" pid="0" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif"/>
		</div>
		<div id="includeDiv" style="width:78%;float: left;height:100%;border: 1px solid #d7e8f1;">
			<iframe src="OrgView.jsp" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
		</div>
	</div>
<script>
function onViewOrg()
{
	document.getElementById("DIFRAME").src="OrgView.jsp";
}

var SELECTED_FUN_ID="";
function action(val){
   var url="";
   if(tree.getSelected().parentNode!= null)
   {
	   if(typeof val !="undefined" && val !=null && val !="")
	   {
		var info =val;
		var node =info.split(",");
		var iNodeType =node[3];
		if(iNodeType =="0")
		{
			//部门
			var iPNodeNo =node[0];
			var iNodeNo =node[1];
			//iPNodeNo -1表示该节点是单位 其他表示该节点是部门
			var sUrl ="?name="+node[2];
			if(iPNodeNo =="0")
			{
				//type =1 表示该节点是单位，在链接页面要做处理。	
				sUrl +="&type=1&upid="+iNodeNo.substring(1);
			}
			else
			{
				sUrl +="&type=2&upid="+iNodeNo;
			}
			document.getElementById("DIFRAME").src ="OrgEdit.jsp"+sUrl;
		}
		else if(iNodeType =="1")
		{
			//岗位
			var iPNodeNo =node[0];
			var iNodeNo =node[1];
			var sUrl ="?name="+node[2]+"&type=3&upid="+iNodeNo.substring(1)+"&upupid="+iPNodeNo;
			document.getElementById("DIFRAME").src ="OrgEdit.jsp"+sUrl;
		}
	   }
   }
   else
   {
	  
   }
}
</script>
</body>
</html>