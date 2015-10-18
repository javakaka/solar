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
<link type="text/css" rel="stylesheet" href="<%=basePath%>/res/css/xtree2.css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script src="<%=basePath%>/res/js/xtree2.js"></script>
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo;<cc:message key="framework.nav.faq" />
	</div>

<div style="width:100%;height:95%;position: absolute;">
	<div id="treeDiv" style="width:20%;float: left;">
		<input type="button" value="收起/展开" onclick="tree.toggle()" />
		<input type="button" value="全部展开" onclick="tree.expandAll()" />
		<input type="button" value="一级目录" onclick="tree.collapseChildren()" />
		<input type="button" value="刷新目录" onclick="javascript:window.location.reload();" />
		<cc:xtree treeData="${treeData}" head="帮助文档" pidF="PFAQ_NO" idF="FAQ_NO" pid="0" titleF="SUBJECT" hiddenF="FAQ_NO,SUBJECT " icon="aq.gif" />
	</div>
	<div id="includeDiv" style="width:78%;float: left;height:100%;border: 1px solid #d7e8f1;">
		<iframe src="Child.do" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</div>
</div>
<script>
function selectChange(handle)
{
	if(handle.value !='')
	{
		ftmp.moudle_id.value =handle.value;
		ftmp.submit();
	}
}
var SELECTED_FUN_ID="";
function action(val){
   var url="";
   if(tree.getSelected().parentNode!= null)
   {
	   if(typeof val !="undefined" && val !=null && val !=""){
		var info =val;
		var node =info.split(",");
		url="Child.do?pfaq_no="+node[0];
		SELECTED_FUN_ID=node[1];
	   }
   }
   else
   {
	  url="Child.do";
	  SELECTED_FUN_ID="";
   }
   document.getElementById("DIFRAME").src=url;
   
}
</script>
</body>
</html>