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
<title>编辑商家优惠券</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	KindEditor.ready(function(K) {
		$("input[id^='uploadButton_']").each(function(i,v){
			var obj = this;
			var index=i;
			var uploadbutton = K.uploadbutton({
				button : obj,
				fieldName : 'file',
				url : framework.base + "/upload/file/upload.do",
				afterUpload : function(data) {
					var m_type =data.message.type;
					var m_content =data.message.content;
					if (m_type =="success") {
						var url = K.formatUrl(data.url, 'absolute');
						K('#PICTURE').val(url);
					} else {
						$.message(m_type,m_content);
					}
				},
				afterError : function(str) {
					$.message("error","上传图片出错:"+ str);
				}
			});
			uploadbutton.fileBox.change(function(e) {
				uploadbutton.submit();
			});
		});
	});
	
	
	var $submitBtn = $("#submitBtn");
	$submitBtn.click( function() {
		var isValid =checkForm();
		if(isValid)
		{
			submit();
		}
		return false;
	});
	//[@flash_message /]
	var ID ="";
	var NAME ="";
	var SHOP_ID ="";
	var RAW_PRICE ="";
	var COUPON_PRICE ="";
	var COUPON_UNIT ="";
	var TOTAL_NUM ="";
	var LEFT_NUM ="";
	var IS_COUPON ="";
	var SUMMARY ="";
	var REMARK ="";//CONTENT
	function checkForm()
	{
		ID =$("#ID").val();
		NAME =$("#NAME").val();
		SHOP_ID =$("#SHOP_ID").val();
		RAW_PRICE =$("#RAW_PRICE").val();
		COUPON_PRICE =$("#COUPON_PRICE").val();
		COUPON_UNIT =$("#COUPON_UNIT").val();
		TOTAL_NUM =$("#TOTAL_NUM").val();
		LEFT_NUM =$("#LEFT_NUM").val();
		IS_COUPON =$("#IS_COUPON").val();
		SUMMARY =$("#SUMMARY").val();
		REMARK =$("#editor").val();
		if(typeof ID == "undefined" || ID == "")
		{
			$.message("error","ID不能为空");
			$("#ID").focus();
			return false;
		}
		if(typeof NAME == "undefined" || NAME == "")
		{
			$.message("error","名称不能为空");
			$("#NAME").focus();
			return false;
		}
		if(typeof SHOP_ID == "undefined" || SHOP_ID == "")
		{
			$.message("error","商家不能为空");
			$("#SHOP_ID").focus();
			return false;
		}
		if(typeof RAW_PRICE == "undefined" || RAW_PRICE == "")
		{
			$.message("error","请填写原价");
			$("#RAW_PRICE").focus();
			return false;
		}
		if(typeof COUPON_PRICE == "undefined" || COUPON_PRICE == "")
		{
			$.message("error","请填写优惠价");
			$("#COUPON_PRICE").focus();
			return false;
		}
		if(typeof COUPON_UNIT == "undefined" || COUPON_UNIT == "")
		{
			$.message("error","请填写单位");
			$("#COUPON_UNIT").focus();
			return false;
		}
		if(typeof TOTAL_NUM == "undefined" || TOTAL_NUM == "")
		{
			$.message("error","请填写总数量");
			$("#TOTAL_NUM").focus();
			return false;
		}
		if(typeof LEFT_NUM == "undefined" || LEFT_NUM == "")
		{
			$.message("error","请填写剩余数量，没有的话，写0");
			$("#LEFT_NUM").focus();
			return false;
		}
		if(typeof IS_COUPON == "undefined" || IS_COUPON == "")
		{
			$.message("error","请选择是否使用优惠价格");
			$("#IS_COUPON").focus();
			return false;
		}
		
		return true;
	}

	function submit()
	{
		ID =$("#ID").val();
		NAME =$("#NAME").val();
		SHOP_ID =$("#SHOP_ID").val();
		RAW_PRICE =$("#RAW_PRICE").val();
		COUPON_PRICE =$("#COUPON_PRICE").val();
		COUPON_UNIT =$("#COUPON_UNIT").val();
		TOTAL_NUM =$("#TOTAL_NUM").val();
		LEFT_NUM =$("#LEFT_NUM").val();
		IS_COUPON =$("#IS_COUPON").val();
		SUMMARY =$("#SUMMARY").val();
		REMARK =$("#editor").val();
		if(typeof SUMMARY == "undefined" || SUMMARY == "")
		{
			SUMMARY ="";
		}
		if(typeof REMARK == "undefined" || REMARK == "")
		{
			REMARK ="";
		}
		var params={ID: ID,NAME: NAME,SHOP_ID: SHOP_ID,RAW_PRICE: RAW_PRICE,COUPON_PRICE: COUPON_PRICE,COUPON_UNIT: COUPON_UNIT,TOTAL_NUM: TOTAL_NUM,LEFT_NUM: LEFT_NUM,IS_COUPON: IS_COUPON,SUMMARY: SUMMARY,REMARK: REMARK}
		$.ajax({
				url: "<%=basePath%>cxhlpage/platform/shop/coupon/save.do",
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
					//alert('.....');
				},
				success: function(ovo, textStatus) {
					var code =ovo.code;
					if(code >=0)
					{
						$.message("success","保存成功");
					}
					else
					{
						$.message("error",ovo.msg);
					}
				},
				complete: function (XMLHttpRequest, textStatus){
					//alert("complete...");
				},
				error: function (){
					alert('error...');
				}
			});
			
		//window.parent.enableTab("detail","detail.jsp?id=1");
	}
	
	
});
</script>
</head>
<body>
	<div class="path">
		商家管理 &raquo; 编辑商家优惠券
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
		<tr>
			<th>
				<span class="requiredField">*</span>优惠券名称:
			</th>
			<td>
				<input type="text" id="ID" name="ID" class="hidden" maxlength="200" value="${row.ID }" />
				<input type="text" id="NAME" name="NAME" class="text" maxlength="200" value="${row.NAME }" />
			</td>
		</tr>
		<tr>
			<th>
				<span class="requiredField">*</span>请选择商家:
			</th>
			<td>
			<select  id="SHOP_ID" name="SHOP_ID" class="text" style="width:190px;" >
				<option value="" >请选择...</option>
				<c:forEach items="${shop_list}" var="list" varStatus="status">
					<c:choose>
						<c:when test="${row.SHOP_ID == list.ID}">
							<option value="${list.ID}" selected>${list.C_NAME }</option>
						</c:when>
						<c:otherwise>
							<option value="${list.ID}" >${list.C_NAME }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</td>
		</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>原价:
				</th>
				<td>
					<input type="text" id="RAW_PRICE" name="RAW_PRICE" class="text" maxlength="200" value="${row.RAW_PRICE }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>优惠价:
				</th>
				<td>
					<input type="text" id="COUPON_PRICE" name="COUPON_PRICE" class="text" maxlength="200" value="${row.COUPON_PRICE }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>单位:
				</th>
				<td>
					<input type="text" id="COUPON_UNIT" name="COUPON_UNIT" class="text" maxlength="200" value="${row.COUPON_UNIT }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>总数量:
				</th>
				<td>
					<input type="text" id="TOTAL_NUM" name="TOTAL_NUM" class="text" maxlength="200" value="${row.TOTAL_NUM }" />
				</td>
		</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>剩余数量:
				</th>
				<td>
					<input type="text" id="LEFT_NUM" name="LEFT_NUM" class="text" maxlength="200" value="${row.LEFT_NUM }" />
				</td>
		</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>是否使用优惠价格:
				</th>
				<td>
					<select id="IS_COUPON" name="IS_COUPON" style="width:190px;">
						
						<c:choose>
						<c:when test="${row.IS_COUPON == 1}">
							<option value=""  >请选择...</option>
							<option value="1" selected>使用优惠价格</option>
							<option value="0"  >不使用优惠价格</option>
						</c:when>
						<c:when test="${row.IS_COUPON == 0}">
							<option value=""  >请选择...</option>
							<option value="1" >使用优惠价格</option>
							<option value="0"  selected>不使用优惠价格</option>
						</c:when>
						<c:otherwise>
							<option value="" selected >请选择...</option>
							<option value="1"  >使用优惠价格</option>
							<option value="0"  >不使用优惠价格</option>
						</c:otherwise>
					</c:choose>
					</select>
				</td>
			</tr>
		<tr>
				<th>
					简介:
				</th>
				<td>
					<input type="text" id="SUMMARY" name="SUMMARY" class="text" maxlength="200" value="${row.SUMMARY }" />
				</td>
			</tr>
		<tr>
				<th>
					详细图文介绍:
				</th>
				<td>
					<textarea id="editor" name="CONTENT" class="editor">${row.REMARK }</textarea>
				</td>
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