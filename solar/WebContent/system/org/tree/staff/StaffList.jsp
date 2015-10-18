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
<title>系统人员列表</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	//[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo;系统人员列表
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="StaffList.do" method="get">
		<div class="bar">
			<a href="add.do?bureau_no=${BUREAU_NO}&site_no=${SITE_NO}&posi_no=${POSI_NO}" class="iconButton">
				<span class="addIcon">&nbsp;</span><cc:message key="admin.common.add" />
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span><cc:message key="admin.common.delete" />
				</a>
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
					<input type="hidden" id="SITE_NO" name="SITE_NO" value="${SITE_NO}" maxlength="200" />
					<input type="hidden" id="POSI_NO" name="POSI_NO" value="${POSI_NO}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'STAFF_NO'}"> class="current"</c:if> val="STAFF_NO">人员编号</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'REAL_NAME'}">class="current"</c:if> val="REAL_NAME">真实姓名</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'STAFF_NAME'}">class="current"</c:if> val="STAFF_NAME">登录名</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="STAFF_NO">人员编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="REAL_NAME">真实姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="STAFF_NAME">登录名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PASSWORD">密码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="SITE_NAME">部门</a>
				</th>
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${row.STAFF_NO}" />
					</td>
					<td>
						<span title="${row.STAFF_NO}">${row.STAFF_NO}</span>
					</td>
					<td>
						${row.REAL_NAME}
					</td>
					<td>
						${row.STAFF_NAME}
					</td>
					<td>
						${row.PASSWORD}
					</td>
					<td>
						${row.SITE_NAME}
					</td>
					<td>
						<a href="edit.do?id=${row.STAFF_NO}&bureau_no=${BUREAU_NO}&site_no=${SITE_NO}&posi_no=${POSI_NO}"><cc:message key="admin.common.edit" /></a>
						<a href="changePassword.jsp?id=${row.STAFF_NO}&site_no=${SITE_NO}&posi_no=${POSI_NO}" >重置密码</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
</html>