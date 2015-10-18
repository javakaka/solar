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
<title>最近注册房东租客用户</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]
	${flash_message}

});

</script>
</head>
<body style="min-width: 200px;">
	<form id="listForm" action="LatestUserList.do" method="get">
		<table id="listTable" class="list">
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="TELEPHONE">手机号码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="NAME">姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="REGISTER_TIME">注册时间</a>
				</th>
			</tr>
			<c:forEach items="${data}" var="row" varStatus="status">
				<tr>
					<td>
						${row.TELEPHONE}
					</td>
					<td>
						${row.NAME}
					</td>
					<td>
						${row.REGISTER_TIME}
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>