<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sFileNames =ServletUtil.get(request, "file_names", true);
String sDealType =ServletUtil.get(request, "deal_type");
String sDealCode =ServletUtil.get(request, "deal_code");
String sType =ServletUtil.get(request, "type");
String sSubType =ServletUtil.get(request, "sub_type");
String sCover =ServletUtil.get(request, "cover");//ÊÇ·ñ¸²¸Ç
String sEdit =ServletUtil.get(request, "edit");
String sRandCode =ServletUtil.get(request, "randcode");
IVO ivo = new IVO("saveUploadFiles");
ivo.set("STAFF-NO", ServletUtil.getLoginStaffNo(request));
ivo.set("FILE_NAMES", sFileNames);
ivo.set("DEAL_TYPE", sDealType);
ivo.set("DEAL_CODE", sDealCode);
ivo.set("TYPE", sType);
ivo.set("SUB_TYPE", sSubType);
ivo.set("COVER", sCover);
ivo.set("REQUEST", request);
ivo.set("randcode", sRandCode);
OVO ovo =Action.execute(ivo);
if(ovo.iCode <0)
{
	%>
<SCRIPT LANGUAGE="JavaScript">
	<!--
	alert("<%=ovo.sMsg%>");	
	parent.window.initUploadRows(true);
	parent.window.initFileUpload();
	//-->
	</SCRIPT>	
	<%}
else
{
	String sUrl ="FileUpload.jsp?"+request.getQueryString();
	if(sType.length() >0)
		sUrl +="&type="+sType;
	if(sSubType.length() >0)
		sUrl +="&sub_type="+sSubType;
	if(sEdit.length() >0)
		sUrl +="&edit="+sEdit;
}
%>
