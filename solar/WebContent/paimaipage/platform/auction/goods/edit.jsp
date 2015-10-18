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
<title>编辑拍品</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
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
	var $submitBtn = $("#submitBtn");
	$submitBtn.click( function() {
		var ID=$("#ID").val();
		var AUCTION_ID=$("#AUCTION_ID").val();
		var TYPE_ID=$("#TYPE_ID").val();
		var ORG_ID=$("#ORG_ID").val();
		var GOODS_NAME=$("#GOODS_NAME").val();
		var GOODS_NUM=$("#GOODS_NUM").val();
		var BEGIN_PRICE=$("#BEGIN_PRICE").val();
		var GUARENTEE_MONEY=$("#GUARENTEE_MONEY").val();
		var ADD_PRICE=$("#ADD_PRICE").val();
		var COMMISSION_RATIO=$("#COMMISSION_RATIO").val();
		var GUARENTEE_MONEY=$("#GUARENTEE_MONEY").val();
		var KEEP_PRICE=$("#KEEP_PRICE").val();
		var DELAY_TIME=$("#DELAY_TIME").val();
		var START_TIME=$("#START_TIME").val();
		var END_TIME=$("#END_TIME").val();
		var HOT=$("#HOT").val();
		if(typeof AUCTION_ID == "undefined" || AUCTION_ID == "")
		{
			$.message("error","请选择拍卖专场");
			return false;
		}
		if(typeof TYPE_ID == "undefined" || TYPE_ID == "")
		{
			$.message("error","请选择拍品分类");
			return false;
		}
		if(typeof ORG_ID == "undefined" || ORG_ID == "")
		{
			$.message("error","请选择送拍机构");
			return false;
		}
		if(typeof GOODS_NAME == "undefined" || GOODS_NAME == "")
		{
			$.message("error","请填写拍品名称");
			return false;
		}
		if(typeof GOODS_NUM == "undefined" || GOODS_NUM == "")
		{
			$.message("error","请填写拍品数量");
			return false;
		}
		if(typeof BEGIN_PRICE == "undefined" || BEGIN_PRICE == "")
		{
			$.message("error","请填写起拍价");
			return false;
		}
		if(typeof GUARENTEE_MONEY == "undefined" || GUARENTEE_MONEY == "")
		{
			$.message("error","请填写保证金");
			return false;
		}
		if(typeof ADD_PRICE == "undefined" || ADD_PRICE == "")
		{
			$.message("error","请填写加价幅度");
			return false;
		}
		if(typeof COMMISSION_RATIO == "undefined" || COMMISSION_RATIO == "")
		{
			$.message("error","请填写佣金比例，［1到100之间的数字］");
			return false;
		}
		if(typeof KEEP_PRICE == "undefined" || KEEP_PRICE == "")
		{
			$.message("error","请填写保留价");
			return false;
		}
		if(typeof DELAY_TIME == "undefined" || DELAY_TIME == "")
		{
			$.message("error","请填写延时周期");
			return false;
		}
		if(typeof START_TIME == "undefined" || START_TIME == "")
		{
			$.message("error","请填写开始时间");
			return false;
		}
		if(typeof END_TIME == "undefined" || END_TIME == "")
		{
			$.message("error","请填写结束时间");
			return false;
		}
		var params={ID: ID,AUCTION_ID: AUCTION_ID,TYPE_ID: TYPE_ID,ORG_ID: ORG_ID,GOODS_NAME: GOODS_NAME,GOODS_NUM: GOODS_NUM,BEGIN_PRICE: BEGIN_PRICE,GUARENTEE_MONEY: GUARENTEE_MONEY,ADD_PRICE: ADD_PRICE,COMMISSION_RATIO: COMMISSION_RATIO,KEEP_PRICE: KEEP_PRICE,DELAY_TIME: DELAY_TIME,START_TIME: START_TIME,END_TIME: END_TIME,HOT: HOT}
		$.ajax({
				url: "<%=basePath%>paimaipage/platform/auction/goods/save.do",
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
				},
				success: function(ovo, textStatus) {
					var code =ovo.code;
					if(code >=0)
					{
						var v_id =ovo.oForm.ID;
						$("#ID").val(v_id);
						window.parent.changeTabUrl("base","edit.do?id="+v_id);
						window.parent.enableTab("detail","detail.do?id="+v_id);
						window.parent.enableTab("certificate_info","certificate_info.do?id="+v_id);
						window.parent.enableTab("brand_info","brand_info.do?id="+v_id);
						window.parent.enableTab("need_know_info","need_know_info.do?id="+v_id);
						window.parent.enableTab("sale_service","sale_service.do?id="+v_id);
						window.parent.enableTab("attribute","./attribute/edit.do?goods_id="+v_id);
						$.message("success","保存成功");
					}
					else
					{
						$.message("error",ovo.msg);
					}
				},
				complete: function (XMLHttpRequest, textStatus){
				},
				error: function (){
					$.message("error","处理出错");
				}
			});
	});
});
</script>
<script type="text/javascript">
var title;
var url;
var width=600;
var height=350;
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

function selectSessionIcon(){
	var id=$("#AUCTION_ID").val();
	if(typeof id == "undefined" || id == "" )
	{
		id ="";
	}
	title ="选择拍卖专场";
	url="iframe:<%=basePath%>paimaipage/platform/auction/subject/select.do?id="+id;
	width=620;
	iframeName="selectSessionIframeId";
	popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
}

function setSelectedSession(id,name)
{
	$("#AUCTION_ID").val(id);
	$("#SESSION_NAME").val(name);
}

function sessionIframeSelectTarget()
{
 	window.frames["selectSessionIframeId"].selectTarget();
}

function selectTypeIcon(){
	var id=$("#TYPE_ID").val();
	if(typeof id == "undefined" || id == "" )
	{
		id ="";
	}
	title ="选择拍品类型";
	url="iframe:<%=basePath%>paimaipage/platform/auction/goodstype/select.do?id="+id;
	width=620;
	iframeName="selectTypeIframeId";
	popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
}

function setSelectedType(id,name)
{
	$("#TYPE_ID").val(id);
	$("#TYPE_NAME").val(name);
}

function typeIframeSelectTarget()
{
 	window.frames["selectTypeIframeId"].selectTarget();
}

function selectOrgIcon(){
	var id=$("#ORG_ID").val();
	if(typeof id == "undefined" || id == "" )
	{
		id ="";
	}
	title ="选择送拍机构";
	url="iframe:<%=basePath%>paimaipage/platform/auction/org/select.do?id="+id;
	width=620;
	iframeName="selectOrgIframeId";
	popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
}

function setSelectedOrg(id,name)
{
	$("#ORG_ID").val(id);
	$("#ORG_NAME").val(name);
}

function orgIframeSelectTarget()
{
 	window.frames["selectOrgIframeId"].selectTarget();
}
</script>
</head>
<body>
	<form id="inputForm" action="save.do" method="post">
	<input type="text" id="ID" name="ID" class="hidden" maxlength="200" value="${row.ID}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>请选择专场:
				</th>
				<td>
					<input type="hidden" id="AUCTION_ID" name="AUCTION_ID" class="text" maxlength="200" value="${row.AUCTION_ID}" />
					<input type="text" id="SESSION_NAME" name="SESSION_NAME" class="text" maxlength="200" value="${row.SESSION_NAME}" readonly />
					<img id="select_session_ico_id" name="select_session_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectSessionIcon();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>请选择拍品分类:
				</th>
				<td>
					<input type="hidden" id="TYPE_ID"name="TYPE_ID" class="text" maxlength="200" value="${row.TYPE_ID}" />
					<input type="text" id="TYPE_NAME" name="TYPE_NAME" class="text" maxlength="200" value="${row.TYPE_NAME}" readonly />
					<img id="select_type_ico_id" name="select_type_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectTypeIcon();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>送拍机构:
				</th>
				<td>
					<input type="hidden" id="ORG_ID"name="ORG_ID" class="text" maxlength="200" value="${row.ORG_ID}"/>
					<input type="text" id="ORG_NAME" name="ORG_NAME" class="text" maxlength="200" value="${row.ORG_NAME}" readonly />
					<img id="select_org_ico_id" name="select_org_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectOrgIcon();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>拍品名称:
				</th>
				<td>
					<input type="text" id="GOODS_NAME" name="GOODS_NAME" class="text" maxlength="200" value="${row.GOODS_NAME}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>数量:
				</th>
				<td>
					<input type="text" id="GOODS_NUM" name="GOODS_NUM" class="text" maxlength="200" value="${row.GOODS_NUM}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>起拍价:
				</th>
				<td>
					<input type="text" id="BEGIN_PRICE" name="BEGIN_PRICE" class="text" maxlength="200" value="${row.BEGIN_PRICE}"/>
				</td>
			</tr>
			<!-- 
			<tr>
				<th>
					<span class="requiredField">*</span>当前价:
				</th>
				<td>
					<input type="text" id="CURRENT_PRICE" name="CURRENT_PRICE" class="text" maxlength="200" value="${row.CURRENT_PRICE}"/>
				</td>
			</tr>
			-->
			<tr>
				<th>
					<span class="requiredField">*</span>保证金:
				</th>
				<td>
					<input type="text" id="GUARENTEE_MONEY" name="GUARENTEE_MONEY" class="text" maxlength="200" value="${row.GUARENTEE_MONEY}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>加价幅度:
				</th>
				<td>
					<input type="text" id="ADD_PRICE" name="ADD_PRICE" class="text" maxlength="200" value="${row.ADD_PRICE}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>佣金比例:
				</th>
				<td>
					<input type="text" id="COMMISSION_RATIO" name="COMMISSION_RATIO" class="text" maxlength="200" value="${row.COMMISSION_RATIO}"/>%
				</td>
			</tr>
			<!-- 
			<tr>
				<th>
					佣金:
				</th>
				<td>
					<input type="text" id="COMMISSION" name="COMMISSION" class="text" maxlength="200" value="${row.COMMISSION}"/>
				</td>
			</tr>
			-->
			<tr>
				<th>
					<span class="requiredField">*</span>保留价:
				</th>
				<td>
					<input type="text" id="KEEP_PRICE" name="KEEP_PRICE" class="text" maxlength="200" value="${row.KEEP_PRICE}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>延时周期:
				</th>
				<td>
					<input type="text" id="DELAY_TIME" name="DELAY_TIME" class="text" maxlength="200" value="${row.DELAY_TIME}"/>分钟
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>开始时间:
				</th>
				<td>
					<input type="text" id="START_TIME" name="START_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"  value="${row.START_TIME}"/>此时间应在专场的开始时间与结束时间之间
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>结束时间:
				</th>
				<td>
					<input type="text" id="END_TIME" name="END_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"  value="${row.END_TIME}"/>此时间应在专场的开始时间与结束时间之间
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>是否热拍:
				</th>
				<td>
					<select id="HOT" name="HOT" style="width:190px;">
						<c:choose>
							<c:when test="${row.HOT == 1}">
								<option value="1" selected>是</option>
								<option value="0" >否</option>
							</c:when>
							<c:when test="${row.HOT == 0}">
								<option value="1" >是</option>
								<option value="0" selected>否</option>
							</c:when>
							<c:otherwise>
								<option value="1" >是</option>
								<option value="0" selected>否</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submitBtn" class="button" value="确定"/>
					<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='list.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>