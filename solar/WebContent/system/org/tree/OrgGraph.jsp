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
<link type="text/css" rel="stylesheet" href="<%=basePath%>/res/css/xtree2.css">
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]

});
</script>
</head>
<body style="width:500px;">

<table width="500px" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td class="td_c" height=40 align=center><font color=red>图示</font>：<IMG SRC="images/0pic.gif">-部门,<IMG SRC="images/4pic.gif">-人员</td>
	</tr>
	<tr class="tr_c">
		<td valign="top">
		<cc:webtree elementDataSet="${treeData}"  bureau_no="${bureau_no}"/>
		</td>
	</tr>
</table>

</body>
</html>
