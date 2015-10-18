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
<title>抽奖参数配置</title>
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
	${flash_message}
	// 表单验证
	$inputForm.validate({
		rules: {
			lottery_switch: "required",
			probability: "required",
			day_num: "required",
			week_num: "required",
			month_num: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo; 抽奖参数配置
	</div>
	<form id="inputForm" action="SaveSetting.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>抽奖开关:
				</th>
				<td>
					<input type="hidden" name="busi_type" class="text" value="${busi_type}" />
					<select id="lottery_switch" name="lottery_switch" class="text" style="width:190px;">
						<c:choose>
							<c:when test="${lottery_switch =='1'}">
								<option value="1" selected>开放</option>
								<option value="0" >关闭</option>
							</c:when>
							<c:when test="${lottery_switch =='0'}">
								<option value="1" >开放</option>
								<option value="0" selected>关闭</option>
							</c:when>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>中奖概率:
				</th>
				<td>
					<select id="probability" name="probability" class="text" style="width:190px;">
						<c:choose>
							<c:when test="${probability =='0.5'}">
								<option value="0.5" selected>二分之一</option>
								<option value="0.25" >四分之一</option>
								<option value="0.1" >十分之一</option>
								<option value="0.01" >百分之一</option>
								<option value="0.001" >千分之一</option>
								<option value="0.0001" >万分之一</option>
							</c:when>
							<c:when test="${probability =='0.25'}">
								<option value="0.5" >二分之一</option>
								<option value="0.25" selected>四分之一</option>
								<option value="0.1" >十分之一</option>
								<option value="0.01" >百分之一</option>
								<option value="0.001" >千分之一</option>
								<option value="0.0001" >万分之一</option>
							</c:when>
							<c:when test="${probability =='0.1'}">
								<option value="0.5" >二分之一</option>
								<option value="0.25" >四分之一</option>
								<option value="0.1" selected>十分之一</option>
								<option value="0.01" >百分之一</option>
								<option value="0.001" >千分之一</option>
								<option value="0.0001" >万分之一</option>
							</c:when>
							<c:when test="${probability =='0.01'}">
								<option value="0.5" >二分之一</option>
								<option value="0.25" >四分之一</option>
								<option value="0.1" >十分之一</option>
								<option value="0.01" selected>百分之一</option>
								<option value="0.001" >千分之一</option>
								<option value="0.0001" >万分之一</option>
							</c:when>
							<c:when test="${probability =='0.001'}">
								<option value="0.5" >二分之一</option>
								<option value="0.25" >四分之一</option>
								<option value="0.1" >十分之一</option>
								<option value="0.01" >百分之一</option>
								<option value="0.001" selected>千分之一</option>
								<option value="0.0001" >万分之一</option>
							</c:when>
							<c:when test="${probability =='0.0001'}">
								<option value="0.5" >二分之一</option>
								<option value="0.25" >四分之一</option>
								<option value="0.1" >十分之一</option>
								<option value="0.01" >百分之一</option>
								<option value="0.001" >千分之一</option>
								<option value="0.0001" selected>万分之一</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="0.5" >二分之一</option>
								<option value="0.25" >四分之一</option>
								<option value="0.1" >十分之一</option>
								<option value="0.01" >百分之一</option>
								<option value="0.001" >千分之一</option>
								<option value="0.0001" >万分之一</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>每天中奖次数:
				</th>
				<td>
					<input type="text" name="day_num" class="text" maxlength="500" value="${day_num}" />
					（正整数，可包含0）
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>周中奖次数:
				</th>
				<td>
					<input type="text" name="week_num" class="text" maxlength="500" value="${week_num}" />
					（正整数，可包含0）
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>月中奖次数:
				</th>
				<td>
					<input type="text" name="month_num" class="text" maxlength="500" value="${month_num}" />
					（正整数，可包含0）
				</td>
			</tr>
			<tr>
				<th>
					电台抽奖时间段:
				</th>
				<td>
					<input type="text" name="radio_times" class="text" maxlength="500" value="${radio_times}" style="width:400px;" />
				(时间段与时间段之间用分号分隔，同一个时间段的开始时间与结束时间用逗号分隔)
				</td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<!--
					<input type="button" id="backButton" class="button" value="返回" />
					-->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>