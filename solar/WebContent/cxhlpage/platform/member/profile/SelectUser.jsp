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
<title>用户列表</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]
	${flash_message}
	addEventHandlers();
});
</script>
</head>
<body>
	<div class="path">
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="SelectUser.do" method="get">
		<div class="bar">
			<div class="buttonWrap">
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
							<a href="javascript:;" <c:if test="${page.searchProperty == 'NAME'}">class="current"</c:if> val="NAME">用户姓名</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'TELEPHONE'}">class="current"</c:if> val="TELEPHONE">手机号</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<!-- <input type="checkbox" id="selectAll" /> -->
				</th>
				<th>
					<a href="javascript:;" class="sort" name="NAME">用户姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="TELEPHONE">用户手机号</a>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="radio" name="ids" value="${row.ID}" title="${row.NAME}-${row.TELEPHONE}" <c:if test="${id == row.ID}">checked</c:if>/>
					</td>
					<td>
						${row.NAME}
					</td>
					<td>
						${row.TELEPHONE}
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
<script type="text/javascript">

function selectTarget(){
	var selectedId=$('input[name="ids"]:checked').val();
	var target=$('input[name="ids"]:checked').attr("title");

	window.parent.setSelectedUser(selectedId,target);
	window.parent.closeTipWindow();
}

function closeFrame()
{
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
		b_div.innerHTML="";
		var html="<div style=\"float:right;\"><input type=\"button\" name=\"submitBtn\" id=\"submitBtn\" value=\"确定\" class=\"button\" onclick=\"userIframeSelectTarget()\"/></div>";
			html+="<div style=\"float:right;\"><input type=\"button\" name=\"closeBtn\" id=\"closeBtn\" value=\"取消\"  class=\"button\" onclick=\"closeTipWindow()\"/></div>";
		b_div.innerHTML=html;
		win_box.appendChild(b_div);
	}

}

</script>
</html>