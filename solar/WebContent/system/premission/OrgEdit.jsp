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
		//����λ���
		sSubSiteUrl +="&_QBUREAU_NO="+ iPNodeNo+"&_QUP_SITE_NO=0&UP_SITE_NO=0&BUREAU_NO="+iPNodeNo;
	}
	else if(iType ==2)
	{
		//���ŵ��
		sSubSiteUrl +="&_QUP_SITE_NO="+iPNodeNo+"&UP_SITE_NO="+iPNodeNo;
		sSubPositionUrl +="&_QSITE_NO="+iPNodeNo+"&SITE_NO="+iPNodeNo;
		sSubStaffUrl +="&_QSITE_NO="+iPNodeNo+"&SITE_NO="+iPNodeNo;
		sDetailUrl =WEB_PATH+"/system/card/CardInfo.jsp?card=SM_SITE&SITE_NO="+iPNodeNo;
	}
	else if(iType ==3)
	{
		//��λ���
		var iPPNodeNo =$E.getParameter("upupid");//���ű��  iPNodeNo��λ���
		sSubStaffUrl ="<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=VSM_STAFF"+"&_QSITE_NO="+iPPNodeNo+"&SITE_NO="+iPPNodeNo+"&_QPOSI_NO="+iPNodeNo+"&POSI_NO="+iPNodeNo+"&_QSTATE=1";
		sDetailUrl =WEB_PATH+"/system/card/CardInfo.jsp?card=SM_POSITION&POSI_NO="+iPNodeNo;
	}
	if(sDetailUrl !="")
		Tabs.add("detail", "��ϸ��Ϣ", sDetailUrl);

	if(iType ==1)
	{
		Tabs.add("sub_sites", "��������", sSubSiteUrl);

		Tabs.add("sites_view", "������ͼ", "Org.jsp?view_type=site&has_script=0&bureau_no="+iPNodeNo);

		Tabs.add("posis_view", "��λ��ͼ", "Org.jsp?view_type=position&has_script=0&bureau_no="+iPNodeNo);
		Tabs.add("comm_posi", "ͨ�ø�λ", WEB_PATH+"/system/card/CardList.jsp?card=SM_COMMON_POSITION");
	}
	if(iType ==2)
	{//�ǵ�λ����£����������λ����£���ֻ��ʾ��������
		Tabs.add("sub_sites", "��������", sSubSiteUrl);

		Tabs.add("sub_positions","������λ", sSubPositionUrl);

		Tabs.add("sub_staffs", "������Ա", sSubStaffUrl);
    
	}
	else if(iType ==3)
	{//�ǵ�λ����£����������λ����£���ֻ��ʾ��������
		Tabs.add("sub_staffs", "������Ա", sSubStaffUrl);

		sSelectTab ="sub_staffs";
	}
	Tabs.write($E.getParameter("name"), idTabFrame, idTab);
	Tabs.select(sSelectTab);

}
</SCRIPT>
</BODY>
</HTML>
