<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ezcloud.utility.*,java.io.*" %>
<%
   InputStream inputStream = null;
   OutputStream outputStream = null;
   String sPath =(String)request.getParameter("pre_path")+"/";
   String sFileName=(String)request.getParameter("file_name");
   String sDealCode=(String)request.getParameter("deal_code");
   String sDealType=(String)request.getParameter("deal_type");
   String sFileCode=(String)request.getParameter("file_code");
   String sFileType =(String)request.getParameter("file_type");
	inputStream = new FileInputStream(sPath+"/"+sDealType+"/"+sDealCode+"/"+sFileCode+"."+sFileType);

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