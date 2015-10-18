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
<title>房东收租记录</title>
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
	
	// 筛选
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
		房东委托 &raquo;房东收租记录
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="ChargeList.do" method="get">
		<input type="hidden" id="pay_status" name="pay_status" value="<c:if test="${pay_status !=''}">${pay_status}</c:if>" />
		<div class="bar">
			<!--
			<a href="add.do" class="iconButton">
				<span class="addIcon">&nbsp;</span><cc:message key="admin.common.add" />
			</a>
			-->
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
								<a href="javascript:;" name="pay_status" val="0" <c:if test="${pay_status == '0'}"> class="checked" </c:if> >未交租</a>
							</li>
							<li>
								<a href="javascript:;" name="pay_status" val="1" <c:if test="${pay_status == '1'}"> class="checked" </c:if> >通过APP已交租</a>
							</li>
							<li >
								<a href="javascript:;" name="pay_status" val="2" <c:if test="${pay_status == '2'}"> class="checked" </c:if> >线下交租</a>
							</li>
							<li>
								<a href="javascript:;" name="pay_status" val="3" <c:if test="${pay_status == '3'}"> class="checked" </c:if> >线下押金抵扣</a>
							</li>
							<li>
								<a href="javascript:;" name="pay_status" val="4" <c:if test="${pay_status == '4'}"> class="checked" </c:if> >平台已转账</a>
							</li>
							<li>
								<a href="javascript:;" name="pay_status" val="5" <c:if test="${pay_status == '5'}"> class="checked" </c:if> >房东已到账</a>
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
							<a href="javascript:;" <c:if test="${page.searchProperty == 'CODE'}"> class="current"</c:if> val="CODE">房源编号</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'PROVINCE_NAME'}"> class="current"</c:if> val="PROVINCE_NAME">省份</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'CITY_NAME'}"> class="current"</c:if> val="CITY_NAME">城市</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'REGION_NAME'}">class="current"</c:if> val="REGION_NAME">区域</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'MONEY'}"> class="current"</c:if> val="MONEY">应收金额</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'START_TIME'}">class="current"</c:if> val="START_TIME">开始日期</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'END_TIME'}">class="current"</c:if> val="END_TIME">截止日期</a>
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
					<a href="javascript:;" class="sort" name="CODE">房源编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="LANDLORD_TELEPHONE">房东</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="RENT_NAME">租客</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PROVINCE_NAME">省份</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="CITY_NAME">城市</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="REGION_NAME">区域</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="MONEY">应收金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="REAL_MONEY">实收金额</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="START_TIME">开始日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="END_TIME">截止日期</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="PAY_STATUS">状态</a>
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
						<span title="${row.ADDRESS}">${row.CODE}</span>
					</td>
					<td>
						<span title="${row.CITY_NAME}">${row.LANDLORD_TELEPHONE}-${row.LANDLORD_NAME}</span>
					</td>
					<td>
						<c:choose>
							<c:when test="${row.RENT_NAME=='' }">--</c:when>
							<c:otherwise>${row.RENT_TELEPHONE}-${row.RENT_NAME}</c:otherwise>
						</c:choose>
					</td>
					<td>
						<span title="${row.PROVINCE_NAME}">${row.PROVINCE_NAME}</span>
					</td>
					<td>
						<span title="${row.CITY_NAME}">${row.CITY_NAME}</span>
					</td>
					<td>
						<span title="${row.REGION_NAME}">${row.REGION_NAME}</span>
					</td>
					<td>
						${row.MONEY}
					</td>
					<td>
						${row.REAL_MONEY}
					</td>
					<td>
						${row.START_TIME}
					</td>
					<td>
						${row.END_TIME}
					</td>
					<td>
						<c:choose>
							<c:when test="${row.PAY_STATUS==0 }">未交租</c:when>
							<c:when test="${row.PAY_STATUS==1 }">通过APP已交租</c:when>
							<c:when test="${row.PAY_STATUS==2 }">线下交租</c:when>
							<c:when test="${row.PAY_STATUS==3 }">线下押金抵扣</c:when>
							<c:when test="${row.PAY_STATUS==4 }">平台已转账</c:when>
							<c:when test="${row.PAY_STATUS==5 }">房东已到账</c:when>
						</c:choose>
					</td>
					<td>
						<a href="edit.do?id=${row.ID}"><cc:message key="admin.common.edit" /></a>
						<c:if test="${row.PAY_STATUS==1}">
							<!--
							<a href="javascript:void(0);" onclick="alert('跳转到网银，支付租金给房东')" title="支付租金给房东">支付租金给房东</a>
							-->
				<!--
				<a href="javascript:void(0);" onclick="$.message('error','支付接口未开通')" title="支付租金给房东">支付租金给房东</a>-->
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
</html>