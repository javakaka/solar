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
	var certificate_url ="certificate_info.jsp";
	var brand_url ="brand_info.jsp";
	var know_url ="need_know_info.jsp";
	var sale_service_url ="sale_service.jsp";
	var attr_url ="<%=basePath%>paimaipage/platform/auction/goods/attribute/edit.do?goods_id=";
	if(typeof id == "undefined" || id == "" )
	{
		Tabs.add("base", "基本信息", base_url);
		Tabs.add("detail", "拍品展示", detail_url,false);
		Tabs.add("certificate_info", "证书展示", certificate_url,false);
		Tabs.add("brand_info", "品牌介绍", brand_url,false);
		Tabs.add("need_know_info", "拍卖须知", know_url,false);
		Tabs.add("sale_service", "售后服务", sale_service_url,false);
		Tabs.add("attribute", "商品属性", attr_url,false);
		Tabs.write("编辑拍品", idTabFrame, idTab);
	}
	else
	{
		base_url ="edit.do?id="+id;
		detail_url ="detail.do?id="+id;
		attr_url +=id;
		var certificate_url ="certificate_info.do?id="+id;
		var brand_url ="brand_info.do?id="+id;
		var know_url ="need_know_info.do?id="+id;
		var sale_service_url ="sale_service.do?id="+id;
		Tabs.add("base", "基本信息", base_url);
		Tabs.add("detail", "拍品展示", detail_url,true);
		Tabs.add("certificate_info", "证书展示", certificate_url,true);
		Tabs.add("brand_info", "品牌介绍", brand_url,true);
		Tabs.add("need_know_info", "拍卖须知", know_url,true);
		Tabs.add("sale_service", "售后服务", sale_service_url,true);
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
