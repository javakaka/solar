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
<title><cc:message key="framework.nav.i18n" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo;部门维护
	</div>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>/res/css/xtree2.css">
	<script src="<%=basePath%>/res/js/xtree2.js"></script>

<div style="width:100%;height:95%;position: absolute;">
<div id="treeDiv" style="width:20%;float: left;">
	<input type="button" value="收起/展开" onclick="tree.toggle()" >
	<input type="button" value="全部展开" onclick="tree.expandAll()" >
	<input type="button" value="一级目录" onclick="tree.collapseChildren()" >
	<input type="button" value="刷新目录" onclick="javascript:window.location.reload();" >
	<cc:xtree treeData="${treeData}" head="功能菜单" pidF="UP_FUN_ID" idF="FUN_ID" pid="0" titleF="FUN_NAME" hiddenF="UP_FUN_ID,FUN_ID,FUN_NAME" icon="menu.gif"/>
</div>
<div id="includeDiv" style="width:78%;float: left;height:100%;border: 1px solid #A8EBD4;">
<iframe src="FunInclude.do" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
</div>
<script>
var SELECTED_FUN_ID="";
function action(val){
   var url="";
   if(tree.getSelected().parentNode!= null)
   {
	   if(typeof val !="undefined" && val !=null && val !=""){
		var info =val;
		var node =info.split(",");
		url="FunInclude.do?fun_id="+node[1];
		SELECTED_FUN_ID=node[1];
	   }
   }
   else
   {
	  url="FunInclude.do";
	  SELECTED_FUN_ID="";
   }
   document.getElementById("DIFRAME").src=url;
   
}
</script>
</body>
</html>