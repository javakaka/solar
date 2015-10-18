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
<title>编辑城市辖区</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $provinceNode = $("#PROVINCEID");
	var $cityNode = $("#CITYID");
	
	${flash_message};
	
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: "required",
			NAME: {
				required: true,
				remote: {
					url: "<%=basePath%>system/zone/city/check_extra_name.do?ID=${row.ID}",
					cache: false
				}
			},
			STATE: "required",
			CITYID: "required"
		}
	});
	
	$provinceNode.change(function(){
		var url ="<%=basePath%>system/zone/province/queryCitiesByProId.do";
		var pro_id =$provinceNode.val();
		var params ={id:pro_id};
		$.ajax({
			url: url,
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
					var city_list =ovo.oForm.CITY_LIST;
					$cityNode.html("");
					var optHtml ='<option value="" >请选择...</option>';
					$.each(city_list,function(i,item){
						optHtml +='<option value='+item.ID+'>'+item.NAME+'</option>';
					});
					$cityNode.html(optHtml);
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
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; 编辑城市辖区
	</div>
	<form id="inputForm" action="update.do" method="post">
		<input type="hidden" id="ID" name="ID" class="text" maxlength="200" value="${row.ID}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" id="NAME" name="NAME" class="text" maxlength="200" value="${row.NAME}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>状态:
				</th>
				<td>
				<select id="STATE" name="STATE" class="text" style="width:190px;" >
					<c:choose>
							<c:when test="${row.STATE==1}">
								<option value="">请选择...</option>
								<option value="1" selected>启用</option>
								<option value="0">停用</option>
							</c:when>
							<c:when test="${row.STATE==0}">
								<option value="">请选择...</option>
								<option value="1">启用</option>
								<option value="0" selected>停用</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="1" >启用</option>
								<option value="0">停用</option>
							</c:otherwise>
						</c:choose>
				</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>所属省份:
				</th>
				<td>
				<select id="PROVINCEID" name="PROVINCEID" class="text" style="width:190px;" >
					<option value="" >请选择...</option>
					<c:forEach items="${province_list}" var="list" varStatus="status">
						<c:choose>
							<c:when test="${list.ID==province_id}">
								<option value="${list.ID}" selected>${list.NAME}</option>
							</c:when>
							<c:otherwise>
								<option value="${list.ID}" >${list.NAME}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				请选择城市:<select id="CITYID" name="CITYID" class="text" style="width:190px;" >
					<option value="" selected>请选择...</option>
					<c:forEach items="${city_list}" var="clist" varStatus="status">
						<c:choose>
							<c:when test="${clist.ID==row.CITYID}">
								<option value="${clist.ID}" selected>${clist.NAME}</option>
							</c:when>
							<c:otherwise>
								<option value="${clist.ID}" >${clist.NAME}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>