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
<title>编辑租房记录</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	//[@flash_message /]
	// 表单验证
	$inputForm.validate({
		rules: {
			DEPART_ID: "required",
			NAME: "required",
			PASSWORD: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo; 编辑租房记录
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					租客姓名:
				</th>
				<td>
					${row.USER_NAME}
				</td>
			</tr>
			<tr>
				<th>
					租客手机:
				</th>
				<td>
					${row.USER_TELEPHONE}
				</td>
			</tr>
			<tr>
				<th>
					房东姓名:
				</th>
				<td>
					${row.LANDLORD_NAME}
				</td>
			</tr>
			<tr>
				<th>
					房东手机:
				</th>
				<td>
					${row.LANDLORD_TELEPHONE}
				</td>
			</tr>
			<tr>
				<th>
					房源编号
				</th>
				<td>
					${row.CODE}
				</td>
			</tr>
			<tr>
				<th>
					省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份:
				</th>
				<td>
					${row.PROVINCE_NAME}
				</td>
			</tr>
			<tr>
				<th>
					城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市:
				</th>
				<td>
					${row.CITY_NAME}
				</td>
			</tr>
			<tr>
				<th>
					区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;域:
				</th>
				<td>
					${row.REGION_NAME}
				</td>
			</tr>
			<tr>
				<th>
					房源地址:
				</th>
				<td>
					${row.ROOM_ADDRESS}
				</td>
			</tr>
			<tr>
				<th>
					月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;租:
				</th>
				<td>
					${row.MONEY}
				</td>
			</tr>
			<tr>
				<th>
					开始日期:
				</th>
				<td>
					${row.START_DATE}
				</td>
			</tr>
			<tr>
				<th>
					截止日期:
				</th>
				<td>
					${row.END_DATE}
				</td>
			</tr>
			<tr>
				<th>
					状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:
				</th>
				<td>
					<c:choose>
							<c:when test="${row.STATUS=='1' }">未确定</c:when>
							<c:when test="${row.STATUS=='2' || row.STATUS=='4'}">出租中</c:when>
							<c:when test="${row.STATUS=='3' }">已终止</c:when>
							<c:when test="${row.STATUS=='5' }">删除</c:when>
						</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					是否赠送门锁:
				</th>
				<td>
					<select id="PRESENT" name="PRESENT" class="text" maxlength="200" style="width:190px;">
					<c:if test="${row.PRESENT =='0'}">
						<option value="0" selected>不赠送</option>
						<option value="1" >赠送</option>
					</c:if>
					<c:if test="${row.PRESENT == '1'}">
						<option value="0" >不赠送</option>
						<option value="1" selected>赠送</option>
					</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					收货地址:
				</th>
				<td>
					<input type="text" name="ADDRESS" class="text" maxlength="600" value="${row.ADDRESS}" style="width:500px;" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>