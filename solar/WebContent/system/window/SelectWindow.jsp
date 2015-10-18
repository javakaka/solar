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
<title><cc:message key="framework.nav.window" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]
	addEventHandlers();
});
</script>
</head>
<body>
	<div class="path">
		系统管理 &raquo;选择窗口
		<span></span>
	</div>
	<form id="listForm" action="SelectWindow.do" method="get">
		<!--<div class="bar">-->
			<!--
			<a href="add.do" class="iconButton">
				<span class="addIcon">&nbsp;</span><cc:message key="admin.common.add" />
			</a>
			-->
			<!--<div class="buttonWrap">-->
				<!--
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span><cc:message key="admin.common.delete" />
				</a>
				-->
				<!--
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span><cc:message key="admin.common.refresh" />
				</a>
				
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						<cc:message key="admin.page.pageSize" /><span class="arrow">&nbsp;</span>
					</a>
				</div>
				-->
			<!--</div>
		</div>
		-->
		<table id="listTable" class="list" style="width:500px;">
			<tr>
				<th class="check">
					<!-- <input type="checkbox" id="selectAll" />-->
				</th>
				<th>
					<a href="javascript:;" class="sort" name="WIN_TARGET">窗口地址</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="WIN_DESC">功能简介</a>
				</th>
				<!--
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
				-->
			</tr>
			<c:forEach items="${windows}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="radio" name="ids" value="${row.WIN_ID}" title="${row.WIN_TARGET}" <c:if test="${win_id == row.WIN_ID}">checked</c:if>/>
					</td>
					<td>
						<span title="${row.WIN_TARGET}">${row.WIN_TARGET}</span>
					</td>
					<td>
						${row.WIN_DESC}
					</td>
					<!--
					<td>
						<a href="edit.do?id=${row.WIN_ID}"><cc:message key="admin.common.edit" /></a>
						<a href="base}article.path}" target="_blank"><cc:message key="admin.common.view" /></a>
					</td>
					-->
				</tr>
			</c:forEach>
		</table>
		<!--
		<div id="window-bottom" style="width:500px;height:30px;border:1px solid #BDB9BA;margin-right:10px;">
			<div style="float:right;"><input type="button" name="submitBtn" id="submitBtn" value="确定" class="button" onclick="selectTarget()"/></div>
			<div style="float:right;"><input type="button" name="closeBtn" id="closeBtn" value="取消"  class="button" onclick="closeFrame()"/></div>
		</div>
		-->
	</form>
</body>
<script type="text/javascript">
function selectTarget(){
	var selectedId=$('input[name="ids"]:checked').val();
	var target=$('input[name="ids"]:checked').attr("title");
	window.parent.setSelectedWindow(selectedId,target);
	window.parent.closeTipWindow();
}

function closeFrame()
{
	window.parent.setSelectedImg();
	window.parent.closeTipWindow();
}

function addEventHandlers()
{
	var win_box =window.parent.document.getElementById("windown-box");
	var is_window_bottom_existed =window.parent.document.getElementById("window-bottom");
	if(typeof is_window_bottom_existed =="undefined" || is_window_bottom_existed == null || is_window_bottom_existed == "")
	{
		var b_div =window.parent.document.createElement("div");
		b_div.id="window-bottom";
		//b_div.style.width="";
		b_div.style.height="30px";
		b_div.style.border="1px solid #BDB9BA";
		b_div.style.marginRight="10px";
		
		var html="<div style=\"float:right;\"><input type=\"button\" name=\"submitBtn\" id=\"submitBtn\" value=\"确定\" class=\"button\" onclick=\"iframeSelectTarget()\"/></div>";
			html+="<div style=\"float:right;\"><input type=\"button\" name=\"closeBtn\" id=\"closeBtn\" value=\"取消\"  class=\"button\" onclick=\"closeTipWindow()\"/></div>";
		b_div.innerHTML=html;
		win_box.appendChild(b_div);
	}
}
</script>
</html>