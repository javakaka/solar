<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>系统管理后台${test}</title>
<meta name="author" content="深圳时刻网络传媒有限公司" />
<meta name="copyright" content="深圳时刻网络传媒有限公司" />
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/res/admin/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/res/admin/css/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"  src="<%=basePath%>res/js/jquery-1.8.0.min.js"></script>
<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
}
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a:not(:last)");
	var $menu = $("#menu div");
	//var $menu = $("#menu div dl");
	var $dl = $("#menu div dl");
	var $menuItem = $("#menu a");
	
	$nav.click(function() {
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		$menu.hide();
		$currentMenu.show();
		$dl=$currentMenu.find("dl");
		$dl.show();
		$dl[0].click(); 
		return false;
	});
	$dl.click(function(){
		var $this = $(this);
		var dlStatus =$this.hasClass("closed");
		$dl.addClass("closed");
		if(dlStatus)
		{
			$this.removeClass("closed");
		}
		else
		{
			$this.addClass("closed");
		}
		//$this.toggleClass("closed");   
	});
	$menuItem.click(function(event) {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
		/*stop propagation*/
		event.stopPropagation();
	});
	$nav[0].click();
});
</script>
</head>
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="login.jsp">
					<!-- <img src="<%=basePath%>/res/images/login_logo.gif" alt="Logo" />-->
					<c:choose >
						<c:when test="${staff.STAFF_NAME == 'admin@fdzk'}">
							<img src="<%=basePath%>/res/images/login_logo.gif" alt="Logo" />
						</c:when>
						<c:when test="${staff.STAFF_NAME == 'admin@agent'}">
							<img src="<%=basePath%>/res/images/login_logo_agent.gif" alt="Logo" />
						</c:when>
						<c:otherwise>
							<img src="<%=basePath%>/res/images/login_logo.gif" alt="Logo" />
						</c:otherwise>
					</c:choose>
				</a>
			</th>
			<th>
			<!--动态获取权限-->
				<div id="nav" class="nav">
					<ul>
						<!--
						<li>
							<a href="#top_nav_1">微信平台</a>
						</li>
						<li>
							<a href="<%=basePath%>" target="_blank">首页</a>
						</li>
						-->
						 <c:forEach items="${ovo.TOP_NAV}" var="xxx" varStatus="status">
							<li>
								<a href="#top_nav_${status.index + 1}">${xxx.FUN_NAME}</a>
							</li>
						 </c:forEach>
						 
						 <li>
							<a href="#" target="_blank"></a>
						</li>
					</ul>
				</div>
				<div class="link">
					<!--
					<a href="#" target="_blank">官方网站</a>|
					<a href="#" target="_blank">官方论坛</a>|
					<a href="#" target="_blank">关于我们</a>
				-->
				</div>
				<div class="link">
					<strong>${staff.STAFF_NAME}</strong>
					您好!
					<a href="javascript:void(0);" onClick='openLeftTab("./ChangePassword.jsp","修改密码","1","change_pwd_tab_id")'>修改密码</a>
					<a href="<%=basePath%>help/Index.jsp" target="_blank">帮助手册</a>
					<a href="./logout.jsp" target="_top">注销</a>
				</div>
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
			<c:forEach items="${ovo.TOP_NAV}" var="top_nav" varStatus="status">
				<c:set var="f_id" value="${top_nav.FUN_ID}"></c:set>
				<div id="top_nav_${status.index + 1}" class="menu_div">
					<c:forEach items="${ovo.MENU_NAV}" var="menu_nav" varStatus="mstatus">
						<c:set var="c_id" value="${menu_nav.UP_FUN_ID}"></c:set>
						<c:if test="${c_id == f_id }">
							<c:set var="c_f_id" value="${menu_nav.FUN_ID}"></c:set>
							<dl id="menu_function" class="dl_menu  no_extra closed">
								<dt class="menu_title"><i class="icon_menu function"></i><i class="icon_menu_switch"></i>${menu_nav.FUN_NAME}</dt>
							<c:forEach items="${ovo.FUN_NAV}" var="fun_nav" varStatus="fstatus">
								<c:set var="leaf_id" value="${fun_nav.UP_FUN_ID}"></c:set>
									<c:if test="${leaf_id == c_f_id }">
									<dd id="menu_masssend" class="menu_item ">
										<a href="javascript:void(0);" onClick='openLeftTab("<%=basePath%>${fun_nav.WIN_TARGET}","${fun_nav.FUN_NAME}","1","fun_nav${fun_nav.FUN_ID}")'>
										 <img src='<%=basePath%>images/icons/<c:choose><c:when test="${not empty fun_nav.ICO_NAME}" >${fun_nav.ICO_NAME}</c:when><c:otherwise>17.gif</c:otherwise></c:choose>' class="menu_item_img"><span class="menu_item_span">${fun_nav.FUN_NAME}</span>
										</a>
									</dd>
									</c:if>
							</c:forEach>
							</dl>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
			</td>
			<td style="height:100%;">
				<iframe id="iframe" name="iframe" src="mainfra.jsp" frameborder="0"></iframe>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
var locateUrl =window.location.href;
var iFrame =window.parent.frames["iframe"];
function openLeftTab(url,title,picIndex,tabId,tabIcon)
{
	iFrame.addadd(url,title,tabId,tabIcon);
}


</script>
</html>