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
<title><cc:message key="framework.nav.moudle" /></title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		系统管理 &raquo;项目管理
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="ProjectList.do" method="get">
		<div class="bar">
			<a href="add.do" class="iconButton">
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
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'PROJECT_NAME'}"> class="current"</c:if> val="PROJECT_NAME">项目名称</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'BEGIN_DATE'}">class="current"</c:if> val="BEGIN_DATE">开始日期</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'PROJECT_DESC'}">class="current"</c:if> val="PROJECT_DESC">项目介绍</a>
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
					<a href="javascript:;" class="sort" name="PROJECT_NAME">项目名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PROJECT_ENAME">项目英文名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PROJECT_DESC">项目描述</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="BEGIN_DATE">开始日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="DAYS">项目预估周期（天）</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="COMPANY">开发公司</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="CUSTOMER">客户名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ABOUT_US">关于我们</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="CONTACT">联系方式</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="SERVICES">服务理念</a>
				</th>
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${row.PROJECT_ID}" />
					</td>
					<td>
						<span title="${row.PROJECT_NAME}">${row.PROJECT_NAME}</span>
					</td>
					<td>
						${row.PROJECT_ENAME}
					</td>
					<td>
						<span title="${row.PROJECT_DESC}">${row.PROJECT_DESC}</span>
					</td>
					<td>
						${row.BEGIN_DATE}
					</td>
					<td>
						${row.DAYS}
					</td>
					<td>
						${row.COMPANY}
					</td>
					<td>
						${row.CUSTOMER}
					</td>
					<td>
						${row.ABOUT_US}
					</td>
					<td>
						${row.CONTACT}
					</td>
					<td>
						${row.SERVICES}
					</td>
					<td>
						<a href="edit.do?id=${row.PROJECT_ID}"><cc:message key="admin.common.edit" /></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
</html>