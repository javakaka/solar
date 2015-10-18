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
<title>选择人员</title>
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
<style type="text/css">
body {
	_width: 100%;
	_height: 100%;
	min-width: 520px;
	font: 12px tahoma, Arial, Verdana, sans-serif;
	color: #666666;
	background-color: #ffffff;
	_background-image: url(about: blank);
	_background-attachment: fixed;
}
</style>
</head>
<body>
	<div class="path">
		中介管理 &raquo;选择人员
		<span></span>
	</div>
	<form id="listForm" action="SelectAgent.do" method="get">
		<!---->
		<div class="bar">
			<!--
			
			<a href="add.do" class="iconButton">
				<span class="addIcon">&nbsp;</span><cc:message key="admin.common.add" />
			</a>-->
			<div class="buttonWrap">
			<!-- 
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span><cc:message key="admin.common.delete" />
				</a>
				-->
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span><cc:message key="admin.common.refresh" />
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						<cc:message key="admin.page.pageSize" /><span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;" <c:if test="${page.pageSize == 10}">class="current"</c:if> val="10" >10</a>
							</li>
							<li>
								<a href="javascript:;" <c:if test="${page.pageSize == 20}">class="current"</c:if> val="20">20</a>
							</li>
							<li>
								<a href="javascript:;" <c:if test="${page.pageSize == 50}"> class="current"</c:if>val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"  <c:if test="${page.pageSize == 100}">class="current"</c:if>val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'NAME'}">class="current"</c:if> val="NAME">姓名</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'TELEPHONE'}">class="current"</c:if> val="TELEPHONE">手机号码</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list" style="width:520px;">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="NAME">姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="TELEPHONE">手机号码</a>
				</th>
				<!--
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
				-->
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="radio" name="ids" value="${row.ID}" title="${row.NAME}" <c:if test="${id == row.ID}">checked</c:if>/>
					</td>
					<td>
						<span title="${row.NAME}">${row.NAME}</span>
					</td>
					<td>
						${row.TELEPHONE}
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
		<%@ include file="/include/pagination.jsp" %> 
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
	var buttonDiv =window.parent.document.getElementById("window-bottom");
	if(typeof buttonDiv !=  "undefined" && buttonDiv != "" && buttonDiv != null)
	{
		return;
	}
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
</script>
</html>