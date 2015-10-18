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
<title>赠送优惠券</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/css/diymen/tipswindown.js?version=1.4"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	${flash_message}
	
	// 表单验证
	$inputForm.validate({
		rules: {
			COUPON_ID: "required",
			LOTTERY_NUM: "required"
		},
		messages:{
			COUPON_ID:{
				required: "请选择优惠券"
			},
			LOTTERY_NUM:{
				required: "请输入可抽奖数量"
			}
		}
	});
	
	

});
</script>
<script type="text/javascript">
	var title;
	var url;
	var width=520;
	var height=400;
	var drag="true";
	var time="";
	var showBg="true";
	var cssName="leotheme";
	var iframeName="selectIframeId";
	
	function popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName)
	{
		tipsWindown(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}

	function closeTipWindow()
	{
		tipsWindown.close();
	}

	function couponIframeSelectTarget()
	{
	 	window.frames["selectCouponIframeId"].selectTarget();
	}
	
	function userIframeSelectTarget()
	{
	 	window.frames["selectUserIframeId"].selectTarget();
	}

	function selectIcon(){
		var id=$("#COUPON_ID").val();
		if(typeof id == "undefined" || id == "" )
		{
			id ="";
		}
		title ="选择优惠券";
		url="iframe:<%=basePath%>cxhlpage/platform/shop/coupon/SelectCoupon.do?id="+id;
		width=620;
		iframeName="selectCouponIframeId";
		popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}
	
	function setSelectedCoupon(id,name)
	{
		$("#COUPON_ID").val(id);
		$("#COUPON_NAME").val(name);
	}
	
	function selectUser(){
		var id=$("#COUPON_ID").val();
		if(typeof id == "undefined" || id == "" )
		{
			id ="";
		}
		title ="选择用户";
		url="iframe:<%=basePath%>cxhlpage/platform/member/profile/SelectUser.do?id="+id;
		width=620;
		iframeName="selectUserIframeId";
		popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}
	
	function setSelectedUser(id,name)
	{
		$("#USER_ID").val(id);
		$("#USER_NAME").val(name);
	}
</script>
</head>
<body>
	<div class="path">
		抽奖管理 &raquo; 赠送奖优惠券
	</div>
	<form id="inputForm" action="savePresent.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>请选择用户:
				</th>
				<td>
					<input type="hidden" id="USER_ID" name="USER_ID" class="text" maxlength="200" value="" />
					<input type="text" id="USER_NAME" name="USER_NAME" class="text" maxlength="200" value="" readonly/>
					<img id="select_ico_id" name="select_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectUser();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>请选择优惠券:
				</th>
				<td>
					<input type="hidden" id="COUPON_ID" name="COUPON_ID" class="text" maxlength="200" value="" />
					<input type="text" id="COUPON_NAME" name="COUPON_NAME" class="text" maxlength="200" value="" readonly/>
					<img id="select_ico_id" name="select_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectIcon();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>赠送数量数量:
				</th>
				<td>
					<input type="text" id="NUM" name="NUM" class="text"  maxlength="200" value=""/>(数量不能超过优惠券的剩余数量)
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