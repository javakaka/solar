<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
<title>ģ̬����</title>
</head>
<%
String sFile =request.getParameter("file");
sFile +="?"+request.getQueryString();
%>
<frameset name="main" cols="*" rows="100%,*" frameborder="no" border="0" framespacing="0">
  <body>
    <frame id="dialog" noresize target="top" src="<%=sFile%>">
  </body>
</frameset>
<!-- ���������֧�ֿ�ܵ�����������Ĵ��� -->

<noframes>
<body>
  <p>����������֧�ֿ��,�޷���ȷ��ʾ</p>
</body>
</noframes>
</html>
