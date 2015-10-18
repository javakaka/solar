<%@ page contentType="text/html; charset=GBK"%>
<%
session.setAttribute("_RETURNPAGE", request.getRequestURI()+"?"+request.getQueryString());
String sUrl ="/system/card/CardEdit.jsp?"+request.getQueryString();
%>
<jsp:include page="<%=sUrl%>" flush="false"/>