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
		系统维护 &raquo;静态参数值维护
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="ItemList.do" method="get">
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
							<a href="javascript:;" <c:if test="${page.searchProperty == 'FIELD_ENAME'}"> class="current"</c:if> val="FIELD_ENAME">静态参数名称</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'USED_VIEW'}">class="current"</c:if> val="USED_VIEW">字段值</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'DISP_VIEW'}">class="current"</c:if> val="DISP_VIEW">显示值</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'DISP_ORDER'}">class="current"</c:if> val="DISP_ORDER">显示顺序</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'NOTES'}">class="current"</c:if> val="NOTES">描述</a>
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
					<a href="javascript:;" class="sort" name="FIELD_ENAME">静态参数名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="USED_VIEW">字段值</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="DISP_VIEW">显示值</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="DISP_ORDER">显示顺序</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="NOTES">描述</a>
				</th>
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${row.FIELD_ENAME}@${row.USED_VIEW}" />
					</td>
					<td>
						<span title="${row.FIELD_ENAME}">${row.FIELD_ENAME}</span>
					</td>
					<td>
						${row.USED_VIEW}
					</td>
					<td>
						<span>${row.DISP_VIEW}</span>
					</td>
					<td>
						<span>${row.DISP_ORDER}</span>
					</td>
					<td>
						<span>${row.NOTES}</span>
					</td>
					<td>
						<a href="edit.do?field_ename=${row.FIELD_ENAME}&used_view=${row.USED_VIEW}"><cc:message key="admin.common.edit" /></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
</html>