<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
=<%@ page import="jxl.*,jxl.write.*,jxl.format.*,java.io.*" %>
<%
 
   InputStream inputStream = null;
   OutputStream outputStream = null;
	String sPath =Final._PHYSICAL_WEB_PATH;
   String sFile=(String)request.getParameter("file");
	if(sFile ==null)
	{
		out.println("要提供file下载参数！");
	}
	else if(sFile.toUpperCase().indexOf("WEB-INF") !=-1)
	{
		out.println("请不要非法下载文件！");
	}
	else
	{
		String sFileName =sFile.substring(sFile.lastIndexOf("/")+1);
		sFileName =sFileName.substring(sFile.lastIndexOf("\\")+1);
		inputStream = new FileInputStream(sPath+System.getProperty("file.separator")+sFile);

		byte[]buffer = FileUtil.getBytes(inputStream);
		inputStream.close();
		inputStream = null; 
		outputStream = response.getOutputStream();
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Location",sFileName);
		response.setHeader("Content-Disposition", "attachment; filename="+sFileName);

		outputStream.write(buffer);
		outputStream.flush();
		outputStream.close();
		outputStream = null; 
	}
%>