<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HEAD>
	<SCRIPT src="<%=basePath%>/res/js/web.js"></SCRIPT>
	<SCRIPT src="<%=basePath%>/res/js/Http.js"></SCRIPT>
	<SCRIPT src="<%=basePath%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=basePath%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onload="onPageLoad()" style="margin:0px;">
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
<SCRIPT type=text/javascript> 
var id =request("id");

function onPageLoad()
{
	var sSelectTab ="base";
	var base_url ="edit.do?id=";
	var detail_url ="detail.jsp";
	var attr_url ="attribute/edit.do?goods_id=";
	if(typeof id == "undefined" || id == "" )
	{
		Tabs.add("base", "基本信息", base_url);
		Tabs.add("detail", "图片信息", detail_url,false);
		Tabs.add("attribute", "商品属性", attr_url,false);
		Tabs.write("编辑拍品", idTabFrame, idTab);
	}
	else
	{
		base_url ="edit.do?id="+id;
		detail_url ="detail.do?id="+id;
		attr_url ="attribute/edit.do?goods_id="+id;
		Tabs.add("base", "基本信息", base_url);
		Tabs.add("detail", "图片信息", detail_url,true);
		Tabs.add("attribute", "商品属性", attr_url,true);
		Tabs.write("编辑拍品", idTabFrame, idTab);
	}
	Tabs.select(sSelectTab);
}

function enableTab(name,url)
{
	Tabs.changeurl(name,url);
	Tabs.abled(name);
}

function enableTabOnly(name)
{
	Tabs.abled(name);
}

function changeTabUrl(name,url)
{
	Tabs.changeurl(name,url);
}
</SCRIPT>
</BODY>
</HTML>
