<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<jsp:useBean id="WebTree" class="com.juts.web.bean.WebTree" scope="request"/>
<html>
<head>
<title>��֯����</title>
</head>
<link type="text/css" rel="stylesheet" href="xtree.css">
<body topmargin="0" leftmargin="0">
<table width="100%"border="0" cellpadding="0" cellspacing="0">
<$:G title="������֯�ṹͼ">
<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td class="td_c" height=40 align=center><font color=red>ͼʾ</font>��<IMG SRC="images/0pic.gif">-����,<IMG SRC="images/2pic.gif">-��Ա</td>
	</tr>
	<tr class="tr_c">	
		<td valign="top">
		<$:A service="getDeptStaffTree" dynamic="true"/>
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
			if(ServletUtil.getResult(request, "DEPTSTAFF") !=null)
			{
				DataSet alTree =(DataSet)ServletUtil.getResult(request, "DEPTSTAFF");
				Row hmTypeIcon=new Row();
				hmTypeIcon.put("type0","images/0pic.gif");
				hmTypeIcon.put("type2","images/2pic.gif");
				hmTypeIcon.put("js0","runOpen('"+GlobalUtil._WEB_PATH+"/system/card/CardInfo.jsp?card=SM_SITE&SITE_NO=$ID')");
					WebTree.drawTree(alTree,"D1",oTable,hmTypeIcon,sHasScript,null,GlobalUtil._WEB_PATH+"/images/dot.gif",GlobalUtil._WEB_PATH+"/images/dot.gif");
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
