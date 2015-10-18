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
<title>编辑抽奖礼品</title>
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
	
	//[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: "required",
			COUPON_ID: "required",
			LOTTERY_NUM: "required"
		},
		messages:{
			COUPON_ID:{
				required: "请选择礼品"
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

	function iframeSelectTarget()
	{
	 	window.frames["selectUserIframeId"].selectTarget();
	}

	function selectIcon(){
		var id=$("#GIFT_ID").val();
		if(typeof id == "undefined" || id == "" )
		{
			id ="";
		}
		title ="选择礼品";
		url="iframe:<%=basePath%>cxhlpage/platform/shop/gift/SelectGift.do?id="+id;
		width=620;
		iframeName="selectUserIframeId";
		popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}
	
	function setSelectedUser(id,name)
	{
		$("#COUPON_ID").val(id);
		$("#COUPON_NAME").val(name);
	}
</script>
</head>
<body>
	<div class="path">
		抽奖管理 &raquo; 添加抽奖礼品
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>请选择礼品:
				</th>
				<td>
					<input type="hidden" id="ID" name="ID" class="text" maxlength="200" value="${row.ID }" />
					<input type="hidden" id="GIFT_ID" name="GIFT_ID" class="text" maxlength="200" value="${row.GIFT_ID }" />
					<input type="text" id="GIFT_NAME" name="GIFT_NAME" class="text" maxlength="200" value="${row.GIFT_NAME }" readonly/>
					<img id="select_ico_id" name="select_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectIcon();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>奖品数量:
				</th>
				<td>
					<input type="text" id="LOTTERY_NUM" name="LOTTERY_NUM" class="text"  maxlength="200" value="${row.LOTTERY_NUM }"/>(数量不能超过优惠券的剩余数量)
				</td>
			</tr>
			<tr>
				<th>
					年份:
				</th>
				<td>
					<input type="text" id="YEAR"name="YEAR" class="text Wdate"onfocus="WdatePicker({dateFmt: 'yyyy'});"  maxlength="200" value="${row.YEAR }"/>
				</td>
			</tr>
			<tr>
				<th>
					月份:
				</th>
				<td>
					<input type="text" id="MONTH" name="MONTH" class="text Wdate" onfocus="WdatePicker({dateFmt: 'MM'});" maxlength="200" value="${row.MONTH }"/>
				</td>
			</tr>
			<tr>
				<th>
					天:
				</th>
				<td>
					<input type="text" id="DAY" name="DAY" class="text Wdate" onfocus="WdatePicker({dateFmt: 'dd'});" maxlength="200" value="${row.DAY }"/>
				</td>
			</tr>
			<!-- 
			<tr>
				<th>
					周数:
				</th>
				<td>
					<input type="text" id="WEEK" name="WEEK" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			-->
			<tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" id="REMARK" name="REMARK" class="text" maxlength="500px" value="${row.REMARK }" style="width:350px;"  />
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