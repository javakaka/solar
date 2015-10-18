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
<title>房源列表</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<style type="text/css">
.moreTable th {
	width: 80px;
	line-height: 25px;
	padding: 5px 10px 5px 0px;
	text-align: right;
	font-weight: normal;
	color: #333333;
	background-color: #f8fbff;
}

.moreTable td {
	line-height: 25px;
	padding: 5px;
	color: #666666;
}

.promotion {
	color: #cccccc;
}
</style>
<script type="text/javascript">
$().ready(function() {

	${flash_message}

	var $listForm = $("#listForm");
	var $moreButton = $("#moreButton");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	
	// 更多选项
	$moreButton.click(function() {
		$.dialog({
			title: "更多选项",
			content:'<table id="moreTable" class="moreTable">'
					+'<tr>'
					+'<th>111:<\/th>'
					+'<td>'
					+'<select name="productCategoryId">'
					+'<option value="">请选择...<\/option>'
					+'<option value="1" selected="selected">11<\/option>'
					+'<option value="2" >22<\/option><option value="3" >33<\/option>'
					+'<\/select>'
					+'<\/td>'
					+'<\/tr>'
					+'<\/table>',
			width: 470,
			modal: true,
			ok: "ok",
			cancel: "cancel",
			onOk: function() {
				$("#moreTable :input").each(function() {
					var $this = $(this);
					$("#" + $this.attr("name")).val($this.val());
				});
				$listForm.submit();
			}
		});
	});
	
	// 商品筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});

});
</script>
</head>
<body>
	<div class="path">
		房东委托 &raquo;房源列表
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="RoomList.do" method="get">
		<input type="hidden" id="room_status" name="room_status" value="<c:if test="${room_status !=''}">${room_status}</c:if>" />
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
					<a href="javascript:;" id="filterSelect" class="button">
						筛选<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="room_status" val="0" <c:if test="${room_status == '0'}"> class="checked" </c:if> >待租</a>
							</li>
							<li>
								<a href="javascript:;" name="room_status" val="1" <c:if test="${room_status == '1'}"> class="checked" </c:if> >签约中</a>
							</li>
							<li >
								<a href="javascript:;" name="room_status" val="2" <c:if test="${room_status == '2'}"> class="checked" </c:if> >出租中</a>
							</li>
							<li>
								<a href="javascript:;" name="room_status" val="-2" <c:if test="${room_status == '-2'}"> class="checked" </c:if> >结束</a>
							</li>
							<li>
								<a href="javascript:;" name="room_status" val="-4" <c:if test="${room_status == '-4'}"> class="checked" </c:if> >删除</a>
							</li>
						</ul>
					</div>
				</div>
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
							<a href="javascript:;" <c:if test="${page.searchProperty == 'CODE'}"> class="current"</c:if> val="CODE">唯一码</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'INVITE_CODE'}">class="current"</c:if> val="INVITE_CODE">邀请码</a>
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
					<a href="javascript:;" class="sort" name="telephone">房东手机号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="CODE">唯一码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PROVINCE">省份</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="CITY">城市</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="REGION">区域</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="AREA">面积</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="MONTHLY_RENT">月租</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="DEPOSIT">押金</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="WATER_NUM">水表读数</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="ELECTRICITY_NUM">电表读数</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="GAS_NUM">燃气读数</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PROPERTY">物业管理费</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PAY_DAY">收款日</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="INVITE_CODE">邀请码</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="STATUS">状态</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="START_DATE">开始日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="END_DATE">结束日期</a>
				</th>
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${row.ID}" />
					</td>
					<td>
						<span title="${row.LANDLORD_NAME}">${row.TELEPHONE}</span>
					</td>
					<td>
						<span title="${row.CODE}">${row.CODE}</span>
					</td>
					<td>
						<span title="${row.CITY_NAME}">${row.PROVINCE_NAME}</span>
					</td>
					<td>
						<span title="${row.CITY_NAME}">${row.CITY_NAME}</span>
					</td>
					<td>
						<span title="${row.ZONE_NAME}">${row.ZONE_NAME}</span>
					</td>
					<td>
						${row.AREA}
					</td>
					<td>
						${row.MONTHLY_RENT}
					</td>
					<td>
						${row.DEPOSIT}
					</td>
					<td>
						${row.WATER_NUM}
					</td>
					<td>
						${row.ELECTRICITY_NUM}
					</td>
					<td>
						${row.GAS_NUM}
					</td>
					<td>
						${row.PROPERTY}
					</td>
					<td>
						${row.PAY_DAY}
					</td>
					<td>
						${row.INVITE_CODE}
					</td>
					<td>
						<c:choose>
							<c:when test="${row.STATUS == 0}">待租</c:when>
							<c:when test="${row.STATUS == 1}">签约中</c:when>
							<c:when test="${row.STATUS == 2}">出租中</c:when>
							<c:when test="${row.STATUS == -2}">结束</c:when>
							<c:when test="${row.STATUS == -1}">出租中</c:when>
							<c:when test="${row.STATUS == -3}">结束</c:when>
							<c:when test="${row.STATUS == -4}">删除</c:when>
							<c:otherwise>--</c:otherwise>
						</c:choose>
					</td>
					<td>
						${row.START_DATE}
					</td>
					<td>
						${row.END_DATE}
					</td>
					<td>
						<c:choose>
							<c:when test="${row.STATUS == 0 || row.STATUS==1}">
								<a href="edit.do?id=${row.ID}"><cc:message key="admin.common.edit" /></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="$.message('warn','非待租和签约中状态的房源不能编辑!');return false;" style="color: gray;"><cc:message key="admin.common.edit" /></a>
							</c:otherwise>
						</c:choose>
						<!--<a href="edit.do?id=${row.ID}"><cc:message key="admin.common.edit" /></a>-->
						<!--<a href="#" target="_blank"><cc:message key="admin.common.view" /></a>-->
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
</html>