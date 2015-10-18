<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="<%=GlobalUtil._WEB_PATH%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=GlobalUtil._WEB_PATH%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onload=onPageLoad()>
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
<SCRIPT type=text/javascript> 
var iType =$E.getParameter("type");
var iPNodeNo =$E.getParameter("upid");


function onPageLoad()

{
	var sSelectTab ="sub_sites";
	var sSubSiteUrl =WEB_PATH+"/system/card/CardList.jsp?card=SM_SITE";
	var sSubPositionUrl =WEB_PATH+"/system/card/CardList.jsp?card=SM_POSITION";
	var sSubStaffUrl =WEB_PATH+"/system/card/CardList.jsp?card=VSM_STAFF";
	var sDetailUrl ="";
	if(iType ==1)
	{
		//区域单位点击
		sSubSiteUrl +="&_QBUREAU_NO="+ iPNodeNo+"&_QUP_SITE_NO=0&UP_SITE_NO=0&BUREAU_NO="+iPNodeNo;
	}
	else if(iType ==2)
	{
		//部门点击
		sSubSiteUrl +="&_QUP_SITE_NO="+iPNodeNo+"&UP_SITE_NO="+iPNodeNo;
		sSubPositionUrl +="&_QSITE_NO="+iPNodeNo+"&SITE_NO="+iPNodeNo;
		sSubStaffUrl +="&_QSITE_NO="+iPNodeNo+"&SITE_NO="+iPNodeNo;
		sDetailUrl =WEB_PATH+"/system/card/CardInfo.jsp?card=SM_SITE&SITE_NO="+iPNodeNo;
	}
	else if(iType ==3)
	{
		//岗位点击
		var iPPNodeNo =$E.getParameter("upupid");//部门编号  iPNodeNo岗位编号
		sSubStaffUrl ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=VSM_STAFF"+"&_QSITE_NO="+iPPNodeNo+"&SITE_NO="+iPPNodeNo+"&_QPOSI_NO="+iPNodeNo+"&POSI_NO="+iPNodeNo+"&_QSTATE=1";
		sDetailUrl =WEB_PATH+"/system/card/CardInfo.jsp?card=SM_POSITION&POSI_NO="+iPNodeNo;
	}
	if(sDetailUrl !="")
		Tabs.add("detail", "详细信息", sDetailUrl);

	if(iType ==1)
	{
		Tabs.add("sub_sites", "下属部门", sSubSiteUrl);

		Tabs.add("sites_view", "部门视图", "Org.jsp?view_type=site&has_script=0&bureau_no="+iPNodeNo);

		Tabs.add("posis_view", "岗位视图", "Org.jsp?view_type=position&has_script=0&bureau_no="+iPNodeNo);
		Tabs.add("comm_posi", "通用岗位", WEB_PATH+"/system/card/CardList.jsp?card=SM_COMMON_POSITION");
	}
	if(iType ==2)
	{//非单位情况下，如果是区域单位情况下，则只显示下属部门
		Tabs.add("sub_sites", "下属部门", sSubSiteUrl);

		Tabs.add("sub_positions","下属岗位", sSubPositionUrl);

		Tabs.add("sub_staffs", "下属人员", sSubStaffUrl);
    
	}
	else if(iType ==3)
	{//非单位情况下，如果是区域单位情况下，则只显示下属部门
		Tabs.add("sub_staffs", "下属人员", sSubStaffUrl);

		sSelectTab ="sub_staffs";
	}
	Tabs.write($E.getParameter("name"), idTabFrame, idTab);
	Tabs.select(sSelectTab);

}
</SCRIPT>
</BODY>
</HTML>
