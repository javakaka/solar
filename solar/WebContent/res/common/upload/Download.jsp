<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
=<%@ page import="jxl.*,jxl.write.*,jxl.format.*,java.io.*" %>
<%
 
   InputStream inputStream = null;
   OutputStream outputStream = null;
	String sPath =ConfigUtil.getParam("ATTACH_DIRS")+System.getProperty("file.separator");
   String sFileName=(String)request.getParameter("file_title");
   String sDealCode=(String)request.getParameter("deal_code");
   String sDealType=(String)request.getParameter("deal_type");
   String sFileCode=(String)request.getParameter("file_code");
	String sFileType =(String)request.getParameter("file_type");
	inputStream = new FileInputStream(sPath+System.getProperty("file.separator")+sDealType+System.getProperty("file.separator")+sDealCode+System.getProperty("file.separator")+sFileCode+"."+sFileType);

	byte[]buffer = FileUtil.getBytes(inputStream);
	inputStream.close();
	inputStream = null; 
	outputStream = response.getOutputStream();
	response.reset();
	response.setContentType("application/octet-stream");
	response.setHeader("Location",sFileName+"."+sFileType);
	response.setHeader("Content-Disposition", "attachment; filename="+sFileName+"."+sFileType);

	outputStream.write(buffer);
	outputStream.flush();
	outputStream.close();
	outputStream = null; 
%>