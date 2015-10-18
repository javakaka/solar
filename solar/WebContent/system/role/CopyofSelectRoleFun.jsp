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
<title><cc:message key="framework.nav.moudle" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jstree/_lib/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jstree/_lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jstree/_lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/jstree/jquery.jstree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>res/js/jstree/_docs/syntax/!style.css"/>
<link type="text/css" rel="stylesheet" href="<%=basePath%>res/js/jstree/_docs/!style.css"/>
<script type="text/javascript" src="<%=basePath%>res/js/jstree/_docs/syntax/!script.js"></script>
<script type="text/javascript">
$().ready(function() {
	//[@flash_message /]
	var params ={default_up_id:"-1",tree_name:"权限树",show_type:"checkbox",selector_id:"js_node_permission"}
	$.ajax({
					url: "FunJsTree.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					beforeSend: function (XMLHttpRequest){
						//alert('begin .....');
					},
					success: function(data, textStatus) {
						var treeData=data.oForm.TREEDATA;
						showTree(treeData);
					},
					complete: function (XMLHttpRequest, textStatus){
						//alert("complete...");
					},
					error: function (){
						alert('error...');
					}
				});
	//showTree(treeData);
});
</script>

<script type="text/javascript">
function showTree(val)
{
	$(function () 
	{
	 		$("#includeDiv").jstree(eval("("+val+")")).bind("select_node.jstree", function (e, data) {alert(data.rslt.obj.data("id")); });
	});
}

function getRoleFuns(id)
{
	alert(id);
	alert('0000');  
	var params ={role_id:role_id}
	$.ajax({
					url: "FunsOfSelectedRole.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					beforeSend: function (XMLHttpRequest){
						//alert('begin .....');
					},
					success: function(data, textStatus) {
						alert(data);
						var pers =eval("("+data+")");
						var arr =$("[js_node_permission]");
						$("#permissionNodes").jstree("uncheck_all");
						var isChecked =false;
						var node_id_value ="-1000";
						$("[js_node_permission]").each(function(i,element)
						{
							node_id_value =$(element).attr("id");
							$.each(pers.permissions, function(i, item) {
								if(item.fun_id == node_id_value)
								{
									$("#permissionNodes").jstree("check_node",element);
								}
							});
						});
						$.each(pers.permissions, function(i, item) {
							for(var i=0;i<arr.length; i++)
							{
								if(item.fun_id == arr[i].value)
								{
									arr[i].checked =true;
								}
							}
						});
					},
					complete: function (XMLHttpRequest, textStatus){
						//alert("complete...");
					},
					error: function (){
						alert('error...');
					}
				});
}
</script>
</head>
<style>
html { overflow-x:hidden; }
body {
width: 95%;
margin: 0px;
padding: 0px;
}
</style>
<body>
	<div id="includeDiv" style="width:100%;">
	
	</div>
</body>
</html>