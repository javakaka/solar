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
var iType =request("type");
var iPNodeNo =request("upid");

function onPageLoad()
{
	var sSelectTab ="sub_sites";
	var sSubSiteUrl ="site/SiteList.do?ptype=SM_SITE";
	var sSubPositionUrl ="position/PositionList.do?ptype=SM_POSITION";
	var sSubStaffUrl ="staff/StaffList.do?ptype=VSM_STAFF";
	var sDetailUrl ="";
	if(iType ==1)
	{
		//区域单位点击
		sSubSiteUrl +="&UP_SITE_NO=0&BUREAU_NO="+iPNodeNo;
	}
	else if(iType ==2)
	{
		//部门点击
		sSubSiteUrl +="&UP_SITE_NO="+iPNodeNo;
		sSubPositionUrl +="&SITE_NO="+iPNodeNo;
		sSubStaffUrl +="&SITE_NO="+iPNodeNo;
		sDetailUrl ="site/SiteDetail.do?SITE_NO="+iPNodeNo;
	}
	else if(iType ==3)
	{
		//岗位点击
		var iPPNodeNo =$E.getParameter("upupid");//部门编号  iPNodeNo岗位编号
		sSubStaffUrl +="&SITE_NO="+iPPNodeNo+"&POSI_NO="+iPNodeNo;
		sDetailUrl ="position/PosiDetail.do?POSI_NO="+iPNodeNo;
	}
	if(sDetailUrl !="")
		Tabs.add("detail", "详细信息", sDetailUrl);

	if(iType ==1)
	{
		Tabs.add("sub_sites", "下属部门", sSubSiteUrl);
		Tabs.add("sites_view", "部门视图", "OrgGraph.do?view_type=site&has_script=0&bureau_no="+iPNodeNo);
		Tabs.add("posis_view", "岗位视图", "OrgGraph.do?view_type=position&has_script=0&bureau_no="+iPNodeNo);
		Tabs.add("comm_posi", "通用岗位", "common/CommonPosition.do?card=SM_COMMON_POSITION");
	}
	if(iType ==2)
	{//非单位情况下，如果是区域单位情况下，则只显示下属部门
		Tabs.add("sub_sites", "下属部门", sSubSiteUrl);

		Tabs.add("sub_positions","下属岗位", sSubPositionUrl);

		Tabs.add("sub_staffs", "下属人员", sSubStaffUrl);
		
		sSelectTab ="detail";
    
	}
	else if(iType ==3)
	{//非单位情况下，如果是区域单位情况下，则只显示下属部门
		Tabs.add("sub_staffs", "下属人员", sSubStaffUrl);

		sSelectTab ="sub_staffs";
		sSelectTab ="detail";
	}
	Tabs.write(decodeURI(request("name")), idTabFrame, idTab);
	Tabs.select(sSelectTab);
}
</SCRIPT>
</BODY>
</HTML>
