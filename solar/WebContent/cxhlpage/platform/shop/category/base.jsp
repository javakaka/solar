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
<title>编辑商家分类</title>
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
	var NAME ="";
	function checkForm()
	{
		NAME =$("#NAME").val();
		if(typeof NAME == "undefined" || NAME == "")
		{
			$.message("error","名称不能为空");
			$("#NAME").focus();
			return false;
		}
		return true;
	}

	function submit()
	{
		//alert('submit');
		/**/
		var NAME =$("#NAME").val();
		var LEVEL_INDEX =$("#LEVEL_INDEX").val();
		if(typeof LEVEL_INDEX == "undefined" || LEVEL_INDEX == "")
		{
			LEVEL_INDEX ="";
		}
		//REMARK =$("#editor").val();
		//alert(REMARK);
		var params={NAME: NAME,LEVEL_INDEX: LEVEL_INDEX}
		$.ajax({
				url: "<%=basePath%>cxhlpage/platform/shop/category/save.do",
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
						var v_id =ovo.oForm.ID;
						$("#ID").val(v_id);
						window.parent.enableTab("detail","detail.jsp?id="+v_id);
						window.parent.changeTabUrl("base","edit.do?id="+v_id);
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
		商家管理 &raquo; 添加商家分类
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>分类名称:
				</th>
				<td>
					<input type="text" name="ID" class="hidden" maxlength="200" value="" />
					<input type="text" id="NAME" name="NAME" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" id="LEVEL_INDEX" name="LEVEL_INDEX" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submitBtn" class="button" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='list.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>