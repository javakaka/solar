<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<jsp:useBean id="WebTree" class="com.juts.web.bean.WebTree" scope="request"/>
<html>
<head>
<title>��֯����</title>
</head>
<link type="text/css" rel="stylesheet" href="xtree.css">
<body topmargin="0" leftmargin="0">
<$:G title="��λ��֯�ṹͼ">
<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td class="td_c" height=40 align=center><font color=red>ͼʾ</font>��<IMG SRC="images/0pic.gif">-��λ,<IMG SRC="images/2pic.gif">-��Ա[��Ա���������<font color="red">*</font>��ʾ���˴��ڶ����λ]</td>
	</tr>
	<tr class="tr_c">
		<td valign="top">
		<$:A service="getOrgPosiStaffTree" dynamic="false"/>
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
			String sHasScript=ServletUtil.get(request,"has_script", "1");
			StringBuffer oTable=new StringBuffer(1024);
			if(ServletUtil.getResult(request, "POSISTAFF") !=null)
			{
				DataSet alTree =(DataSet)ServletUtil.getResult(request, "POSISTAFF");
				Row hmTypeIcon=new Row();
				hmTypeIcon.put("type1","images/0pic.gif");
				hmTypeIcon.put("type2","images/2pic.gif");
				hmTypeIcon.put("js1","runOpen('"+GlobalUtil._WEB_PATH+"/system/card/CardInfo.jsp?card=SM_POSITION&POSI_NO=$ID')");
				//hmTypeIcon.put("js2","runOpen('"+GlobalUtil._WEB_PATH+"/system/card/cardinfo.jsp?card=TSM_STAFF&STAFF_NO=$ID')");
				WebTree.drawTree(alTree,"P1",oTable,hmTypeIcon,sHasScript,null,GlobalUtil._WEB_PATH+"/images/dot.gif",GlobalUtil._WEB_PATH+"/images/dot.gif");
				out.print(oTable);
			}
			oTable.setLength(0);
			oTable=null;
		%>
		</td>
	</tr>
</table>
</$:G>
</body>
</html>
