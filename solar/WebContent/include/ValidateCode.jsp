<%@page contentType="image/jpeg" %>
<jsp:useBean id="image" scope="page" class="com.ezcloud.util.ValidateCode" />
<%
String code=image.makeValidateCode(0,0,response.getOutputStream());
//将认证码存入SESSION
session.setAttribute("validateCode", code);
out.clear();
out = pageContext.pushBody();
%>