<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<html>
<head>
<title>在线帮助</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<frameset rows="41,*" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="HelpT.jsp" name="topFrame" frameborder="no" scrolling="no" noresize marginwidth="0" marginheight="0" >
  <frameset rows="*" cols="200,*" framespacing="0" frameborder="no" border="0"  >
    <frameset rows="44,*" cols="*" framespacing="0" frameborder="no" border="0">
      <frame src="HelpT1.jsp" name="topFrame1" scrolling="no" noresize >
      <frameset rows="*,10" cols="*" framespacing="0" frameborder="no" border="0">
        <frame src="HelpI.do" name="leftFrame" scrolling="yes">
        <frame src="HelpT2.jsp" name="bottomFrame" scrolling="NO">
      </frameset>
    </frameset>
    <frameset cols="21,*" frameborder="NO" border="0" framespacing="0">
  <frame src="HelpC.jsp" name="leftFrame1" scrolling="NO" noresize>
  <frame src="HelpM.jsp" name="mainFrame" scrolling="yes">
</frameset>
  </frameset>
</frameset>
<noframes><body onunload="alert('at here!!!')">
</body></noframes>
</html>
