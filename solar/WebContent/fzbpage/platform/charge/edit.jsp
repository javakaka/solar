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
<title>编辑收租记录</title>
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
			MONEY: "required",
			PAY_STATUS: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo; 编辑收租记录
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					房东电话:
				</th>
				<td>
					${row.LANDLORD_TELEPHONE}
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
					租客电话:
				</th>
				<td>
					${row.RENT_TELEPHONE}
				</td>
			</tr>
			<tr>
				<th>
					租客姓名:
				</th>
				<td>
					${row.RENT_NAME}
				</td>
			</tr>
			<tr>
				<th>
					房源编号:
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
					地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:
				</th>
				<td>
					${row.ADDRESS}
				</td>
			</tr>
			<tr>
				<th>
					应收金额:
				</th>
				<td>
					<c:choose>
							<c:when test="${row.PAY_STATUS==0 }">
								<input type="text" name="MONEY" class="text" maxlength="200" value="${row.MONEY}"/>
							</c:when>
							<c:otherwise>
								<input type="text" name="MONEY" class="text" maxlength="200" value="${row.MONEY}" readonly />
							</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					实收金额:
				</th>
				<td>
					<c:choose>
							<c:when test="${row.PAY_STATUS==0 }">
								<input type="text" name="REAL_MONEY" class="text" maxlength="200" value="${row.REAL_MONEY}"/>
							</c:when>
							<c:otherwise>
								<input type="text" name="REAL_MONEY" class="text" maxlength="200" value="${row.REAL_MONEY}" readonly />
							</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					开始日期:
				</th>
				<td>
					<input type="text" name="START_TIME" class="text" maxlength="200" value="${row.START_TIME}" onfocus="WdatePicker();" readonly />
				</td>
			</tr>
			<tr>
				<th>
					截止日期:
				</th>
				<td>
					<input type="text" name="END_TIME" class="text" maxlength="200" value="${row.END_TIME}" onfocus="WdatePicker();" readonly />
				</td>
			</tr>
			<tr>
				<th>
					收款状态:
				</th>
				<td>
					<select id="PAY_STATUS" name="PAY_STATUS" class="text" maxlength="200" style="width:190px;">
					<c:choose>
							<c:when test="${row.PAY_STATUS==0 }">
								<option value="0" selected>未支付</option>
								<option value="1" >通过APP交租</option>
								<option value="2" >线下交租</option>
								<option value="3" >线下押金抵扣</option>
							</c:when>
							<c:when test="${row.PAY_STATUS==1}">
								<option value="1" selected>通过APP交租</option>
								<option value="4" >平台已转账</option>
								<option value="5" >房东已到账</option>
							</c:when>
							<c:when test="${row.PAY_STATUS==2}">
								<option value="2" selected>线下交租</option>
								<option value="4" >平台已转账</option>
								<option value="5" >房东已到账</option>
							</c:when>
							<c:when test="${row.PAY_STATUS==3}">
								<option value="3" selected>线下押金抵扣</option>
								<option value="4" >平台已转账</option>
								<option value="5" >房东已到账</option>
							</c:when>
							<c:when test="${row.PAY_STATUS==4}">
								<option value="4" selected>平台已转账</option>
								<option value="5" >房东已到账</option>
							</c:when>
							<c:when test="${row.PAY_STATUS==5}">
								<option value="5" selected>房东已到账</option>
							</c:when>
					</c:choose>
					</select>
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