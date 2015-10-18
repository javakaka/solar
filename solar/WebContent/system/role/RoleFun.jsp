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
<title><cc:message key="framework.nav.i18n" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
</head>
<style>
.fun-link{
height:25px;
font-size:14px;
}

.fun-link a{	
width:100%;
height:100%;
line-height: 25px;
text-align: center;
}

.fun-link a:hover{
background-color: #1FB1A5;
text-decoration: none;
}

.fun-link a:hover{
background-color: #1FB1A5;
}

.link-current{
background-color: #1FB1A5;
}
</style>
<script type="text/javascript">
var role_id;
function onLoadPage()
{
	$link =$("ul li a");
//	alert($link);
	$link.click(function() {
		var $this = $(this);
		$link.removeClass("link-current");
		$this.addClass("link-current");
		role_id=$this.attr("val");
		getRoleFuns(role_id);
	});
	
	if($link.length > 0)
	{
		$link[0].click();
	}
}

function getRoleFuns(id)
{
	var frame=window.frames["DIFRAME"];
	var isSafari =$.browser.safari;
	//frame.contentWindow.getRoleFuns(id);
	if(typeof id !="undefined" && id != ""){
		if(isSafari){
			frame.location.href ="SelectRoleFun.do?role_id="+id;
		}
		else
		frame.src ="SelectRoleFun.do?role_id="+id;
	}
	else{
		if(isSafari){
			frame.location.href ="SelectRoleFun.do";
		}
		else
		frame.src ="SelectRoleFun.do";
	}
}
</script>
<body onLoad="onLoadPage()">
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo;角色权限
	</div>

<div id="wrapper_div" style="width:100%;position: absolute;">
	
	
</div>
<table width="80%" height="450px" >
<tr>
<td><span style="font-size:16px">系统角色</span></td>
<td align="center"><span style="font-size:16px">系统权限</span></td>
</tr>
<tr>
<td valign="top">
<div id="treeDiv" style="width:100%;">
		<fieldset>
		<ul id="fun_ul_id">
		<c:forEach items="${roles}" var="row" varStatus="status">
			<li id="${row.ROLE_ID}" class="fun-link"><a href="javascript:void(0)" val="${row.ROLE_ID}">${row.ROLE_NAME}</a></li>
		</c:forEach>
		</ul>
		</fieldset>
	</div>
</td>
<td valign="top">
<div id="iframeDiv" style="width:100%;height:500px;border: 1px solid #d7e8f1;">
		<iframe src="SelectRoleFun.do" id="DIFRAME" height="100%" width="100%" scrolling="scroll-y" frameborder="0"></iframe>
	</div>
</td>
</tr>
</table>

</body>
</html>