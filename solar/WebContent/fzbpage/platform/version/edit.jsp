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
<title>修改用户</title>
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
	var APP_ID ="";
	var DEVICE ="";
	var VERSION_NAME ="";
	var VERSION ="";
	var IS_CURRENT_VERSION ="";
	var REMARK ="";
	function checkForm()
	{
		APP_ID =$("#APP_ID").val();
		DEVICE =$("#DEVICE").val();
		VERSION_NAME =$("#VERSION_NAME").val();
		VERSION =$("#VERSION").val();
		IS_CURRENT_VERSION=$("#IS_CURRENT_VERSION").val();
		if(typeof APP_ID == "undefined" || APP_ID == "")
		{
			$.message("error","请选择APP类别");
			$("#APP_ID").focus();
			return false;
		}
		if(typeof DEVICE == "undefined" || DEVICE == "")
		{
			$.message("error","请选择设备类型");
			$("#DEVICE").focus();
			return false;
		}
		if(typeof VERSION_NAME == "undefined" || VERSION_NAME == "")
		{
			$.message("error","请输入版本名称");
			$("#VERSION_NAME").focus();
			return false;
		}
		if(typeof VERSION == "undefined" || VERSION == "")
		{
			$.message("error","请输入版本号");
			$("#VERSION").focus();
			return false;
		}
		if(typeof IS_CURRENT_VERSION == "undefined" || IS_CURRENT_VERSION == "")
		{
			$.message("error","请指定此版本是否是当前使用");
			$("#IS_CURRENT_VERSION").focus();
			return false;
		}
		return true;
	}

	function submit()
	{
		//alert('submit');
		/**/
		var ID =$("#ID").val();
		REMARK =$("#editor").val();
		//alert(REMARK);
		var params={ID:ID,APP_ID:APP_ID,DEVICE:DEVICE,VERSION_NAME:VERSION_NAME,VERSION:VERSION,REMARK:REMARK,IS_CURRENT_VERSION:IS_CURRENT_VERSION}
		$.ajax({
				url: "<%=basePath%>fzbpage/platform/version/save.do",
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
					//alert('.....');
				},
				success: function(ovo, textStatus) {
					$.message(ovo);
					var code =ovo.code;
					if(code >=0)
					{
						var v_id =ovo.oForm.ID;
						$("#ID").val(v_id);
						window.parent.enableTab("detail","detail.jsp?id="+v_id);
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
		系统设置 &raquo; 版本上传
	</div>
	<form id="inputForm" action="save.do" method="post">
		<input type="hidden" id="ID" name="ID" class="text" maxlength="200" value="${row.ID}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>APP类别:
				</th>
				<td>
					<select id="APP_ID" name="APP_ID" class="text" maxlength="200" style="width:190px;">
						<c:choose>
							<c:when test="${row.APP_ID == 1}">
								<option value="" >请选择...</option>
								<option value="1" selected>房东租客版</option>
								<option value="2" >中介版</option>
							</c:when>
							<c:when test="${row.APP_ID == 2}">
								<option value="" >请选择...</option>
								<option value="1" >房东租客版</option>
								<option value="2" selected>中介版</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="1" >房东租客版</option>
								<option value="2" >中介版</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					设备类型:
				</th>
				<td>
					<select id="DEVICE" name="DEVICE" class="text" maxlength="200" style="width:190px;">
						
						<c:choose>
							<c:when test="${row.DEVICE == 1}">
								<option value="" >请选择...</option>
								<option value="1" selected>ios</option>
								<option value="2" >android</option>
								<option value="3" >windows phone</option>
							</c:when>
							<c:when test="${row.DEVICE == 2}">
								<option value="" >请选择...</option>
								<option value="1" >ios</option>
								<option value="2" selected>android</option>
								<option value="3" >windows phone</option>
							</c:when>
							<c:when test="${row.DEVICE == 3}">
								<option value="" >请选择...</option>
								<option value="1" >ios</option>
								<option value="2" >android</option>
								<option value="3" selected>windows phone</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="1" >ios</option>
								<option value="2" >android</option>
								<option value="3" >windows phone</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					版本名称:
				</th>
				<td>
					<input type="text" id="VERSION_NAME" name="VERSION_NAME" class="text" maxlength="200" value="${row.VERSION_NAME}" />
				</td>
			</tr>
			<tr>
				<th>
					版本号:
				</th>
				<td>
					<input type="text" id="VERSION" name="VERSION" class="text" maxlength="200" value="${row.VERSION}"/>
				</td>
			</tr>
			<tr>
				<th>
					当前使用:
				</th>
				<td>
					<select id="IS_CURRENT_VERSION" name="IS_CURRENT_VERSION" class="text" maxlength="200" style="width:190px;">
						<c:choose>
							<c:when test="${row.IS_CURRENT_VERSION == 1}">
								<option value="" >请选择...</option>
								<option value="1" selected>是</option>
								<option value="2" >否</option>
							</c:when>
							<c:when test="${row.IS_CURRENT_VERSION == 2}">
								<option value="" >请选择...</option>
								<option value="1" >是</option>
								<option value="2" selected>否</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="1" >是</option>
								<option value="2" >否</option>
							</c:otherwise>
						</c:choose>
					</select>(设置为当前使用后,此版本对应的文件就是最新的下载文件,供用户下载)
				</td>
			</tr>
			<tr>
				<th>
					版本介绍:
				</th>
				<td>
					<textarea id="editor"  name="REMARK" class="editor">${row.REMARK}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submitBtn" name="submitBtn" class="button" value="保存" />
					<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='VersionList.do'"/>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>