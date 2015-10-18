<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<jsp:useBean id="WebTree" class="com.juts.web.utility.WebTree" scope="request"/>
<html>
<head>
<title>��֯����</title>
</head>
<link type="text/css" rel="stylesheet" href="xtree.css">
<body topmargin="0" leftmargin="0">
<%
String sViewType =ServletUtil.get(request,"view_type");
%>
<table width="100%"border="0" cellpadding="0" cellspacing="0">
<%
String sBureauNo =ServletUtil.get(request,"bureau_no");
if(sBureauNo.length() ==0)
{
   if(session.getAttribute("user") !=null)
   {//�ж��Ƿ��½
      Identity ooUser =(Identity)session.getAttribute("user");
		sBureauNo =ooUser.get("bureau-no").toString().toLowerCase();
   }
}
if(sViewType.equals("site"))
{
%>
<$:G title="������֯�ṹͼ">
<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td class="td_c" height=40 align=center><font color=red>ͼʾ</font>��<IMG SRC="images/0pic.gif">-����,<IMG SRC="images/4pic.gif">-��Ա</td>
	</tr>
	<tr class="tr_c">	
		<td valign="top">
		<$:A service="getDeptStaffTree" dynamic="false">
			<$:P name="bureau_no" value="<%=sBureauNo%>"/>
		</$:A>
		<$:M dtype="1"/>
		<%
		/*
		��������������Ϊ��
		alTreeData ��������
		sID ����ID
		oTable ������ִ�
		hmTypeIcon ��ʾ��ʱ�Ľڵ�ͼ��
		sHasScript �Ƿ�ȫ��չ��(1Ϊ��չ��,0Ϊչ��)
		sBorderStyle CSS�﷨�����Ľڵ�߿���ʽ
		sVerticalBgPath ��ʾ���ߵ�ͼ
		sHorizonalBgPath ��ʾ���ߵ�ͼ
		*/
			String sHasScript=ServletUtil.get(request,"has_script");
			if(sHasScript==null)
			{
				sHasScript="1";
			}
			StringBuffer oTable=new StringBuffer(1024);
			if(ServletUtil.getResult(request, "DEPTSTAFF") !=null)
			{
				DataSet alTree =(DataSet)ServletUtil.getResult(request, "DEPTSTAFF");
				Row hmTypeIcon=new Row();
				hmTypeIcon.put("type0","images/0pic.gif");
				hmTypeIcon.put("type4","images/4pic.gif");
				hmTypeIcon.put("js0","$E.runOpen('"+GlobalUtil._WEB_PATH+"/system/card/CardInfo.jsp?card=SM_SITE&SITE_NO=$ID')");
					WebTree.drawTree(alTree,"B"+sBureauNo,oTable,hmTypeIcon,sHasScript,null,GlobalUtil._WEB_PATH+"/images/dot.gif",GlobalUtil._WEB_PATH+"/images/dot.gif");
				out.print(oTable);
			}
			oTable.setLength(0);
			oTable=null;
		%>
		</td>
	</tr>
</table>
</$:G>
<%
}
else if(sViewType.equals("position"))
{
%>
<$:G title="��λ��֯�ṹͼ">
<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td class="td_c" height=40 align=center><font color=red>ͼʾ</font>��<IMG SRC="images/0pic.gif">-��λ,<IMG SRC="images/4pic.gif">-��Ա[��Ա���������<font color="red">*</font>��ʾ���˴��ڶ����λ]</td>
	</tr>
	<tr class="tr_c">
		<td valign="top">
		<$:A service="getOrgPosiStaffTree" dynamic="false">
			<$:P name="bureau_no" value="<%=sBureauNo%>"/>
		</$:A>
		<$:M dtype="1"/>
		<%
		/*
		��������������Ϊ��
		alTreeData ��������
		sID ����ID
		oTable ������ִ�
		hmTypeIcon ��ʾ��ʱ�Ľڵ�ͼ��
		sHasScript �Ƿ�ȫ��չ��(1Ϊ��չ��,0Ϊչ��)
		sBorderStyle CSS�﷨�����Ľڵ�߿���ʽ
		sVerticalBgPath ��ʾ���ߵ�ͼ
		sHorizonalBgPath ��ʾ���ߵ�ͼ
		*/
			String sHasScript=ServletUtil.get(request,"has_script");
			if(sHasScript==null)
			{
				sHasScript="1";
			}
			StringBuffer oTable=new StringBuffer(1024);
			if(ServletUtil.getResult(request, "POSISTAFF") !=null)
			{
				DataSet alTree =(DataSet)ServletUtil.getResult(request, "POSISTAFF");
				Row hmTypeIcon=new Row();
				hmTypeIcon.put("type1","images/0pic.gif");
				hmTypeIcon.put("type2","images/4pic.gif");
				hmTypeIcon.put("js1","runOpen('"+GlobalUtil._WEB_PATH+"/system/card/CardInfo.jsp?card=TSM_POSITION&POSI_NO=$ID')");
				//hmTypeIcon.put("js2","runOpen('"+GlobalUtil._WEB_PATH+"/system/card/cardinfo.jsp?card=TSM_STAFF&STAFF_NO=$ID')");
				WebTree.drawTree(alTree,"B"+sBureauNo,oTable,hmTypeIcon,sHasScript,null,GlobalUtil._WEB_PATH+"/images/dot.gif",GlobalUtil._WEB_PATH+"/images/dot.gif");
				out.print(oTable);
			}
			oTable.setLength(0);
			oTable=null;
		%>
		</td>
	</tr>
</table>
</$:G>
<%}%>
</body>
</html>
