<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
/*
*文件上传，用户必须要登录系统，存在登录会话Session
*入参：
deal_code 业务主键
deal_type 业务类型
type 附件大类，例如正文
sub_type 附件小类， 例如正文文本、正文视频
edit 是否可以编辑 1为可上传、删除，2为可上传，默认不可编辑
rows 上传文件初始化行数，默认为3行
cover 是否覆盖 1为覆盖，默认为不覆盖，如果覆盖则删除原有记录，条件为deal_code/deal_type/type/sub_type
*/
String sEdit =ServletUtil.get(request, "edit");
String sMode =ServletUtil.get(request, "mode", "old");
if(sMode.equals("old"))
{
%>
<base target="_self">
<html>
<head>
	<script src="js/Upload.js"></script>
</head>
<body onLoad="initUploadRows();initFileUpload()">

<%
if(sEdit.equals("1") || sEdit.equals("2"))
{//可编辑
	//生成在线随机数，判断文件是否已经上传
	String sRandCode =StringUtil.getRandKeys(24);
	%>
<SCRIPT LANGUAGE="JavaScript">
<!--
var sRandCode ="<%=sRandCode%>";
//-->
</SCRIPT>	
	<%
%>
<form name="idFormReload" action="FileUpload.jsp?<%=request.getQueryString()%>">
	<input type=hidden name="deal_code" value="<%=ServletUtil.get(request, "deal_code")%>">
	<input type=hidden name="deal_type" value="<%=ServletUtil.get(request, "deal_type")%>">
	<input type=hidden name="edit" value="<%=sEdit%>">
	<input type=hidden name="type" value="<%=ServletUtil.get(request, "type")%>">
	<input type=hidden name="sub_type" value="<%=ServletUtil.get(request, "sub_type")%>">
	<input type=hidden name="rows" value="<%=ServletUtil.get(request, "rows")%>">
	<input type=hidden name="cover" value="<%=ServletUtil.get(request, "cover")%>">
</form>
<%
String sTitle =StringUtil.isoToGBK(ServletUtil.get(request, "title"), true)+"文件上传";
%>
<$:G title="<%=sTitle%>">
<form name="filesform" method="post" action="Upload.jsp?<%=request.getQueryString()%>" enctype="multipart/form-data"  target="bbc2188">
<table id="idTbAttach" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td class="td_c" width=40% align=center>文件别名</td>
		<td class="td_c" width=60% align=center>本地文件</td>
	</tr>
</table>	
</$:G>
<iframe name="bbc2188" width=0 height=0 frameborder=0 style="display:none"></iframe>
<div align=center>
	<input type=button value="上传" onClick="uploadFiles()"><input type=button value="更多上传" onClick="addMoreUpload()">
</div>
<$:G title="上传文件列表">
<table id="idTbAttachList" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td class="td_c" align=center>文件名</td>
		<td class="td_c" align=center>文件类型</td>
		<td class="td_c" align=center>上传用户</td>
		<td class="td_c" align=center>上传时间</td>
		<td class="td_c" align=center>大小</td>
		<td class="td_c" align=center>下载/删除</td>
	</tr>
	<tr class="tr_c">
		<td height="30"></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>	
</$:G>
<input type=hidden name="deal_type" value='<$:W name="DEAL_TYPE"/>'>
<input type=hidden name="randcode" value='<%=sRandCode%>'>
<input type=hidden name="deal_code" value='<$:W name="DEAL_CODE"/>'>
</form>
<%
}
%>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--
var _LOADING_DIV_ID ="_JutsDivId";
function uploadFiles()
{
	var bReset =false;
	var s =new Server("getFileUploadState");
	s.setParam("filekey", sRandCode);
	abc();
	if(s.send(s, true))
	{
		var t = setInterval(function()
		{
			s.reset();
			s.send(s, false, function()
			{
				var sUploadState =s.getDefaultParamValue("state");
				var div =document.getElementById(_LOADING_DIV_ID+"_PS_UPLOAD");
				if(sUploadState !=null && (sUploadState =="100" || sUploadState =="1"))
				{
					clearInterval(t); 
					initUploadRows(true);
					initFileUpload();
					abcd();
				}
			});
		}, 500);
		onUploadFiles();
	}
	else
	{
		abcd();
	}
}
function reloadPage()
{

	document.all.idFormReload.action=WEB_PATH+"/common/upload/FileUpload.jsp?<%=request.getQueryString()%>";
	document.all.idFormReload.submit();
}

function abc()
{
	if(document.body)
	{
		var bgDiv=document.createElement("div");
		var bgDivId =_LOADING_DIV_ID+"_BG_UPLOAD";
		bgDiv.id =bgDivId;
		bgDiv.style.cssText="width:100%; height:100%; background:#dddddd;filter: Alpha(Opacity=10);";
		document.body.appendChild(bgDiv);
		//创建一个层设置进度条
		var psDivId =_LOADING_DIV_ID+"_PS_UPLOAD";
		var psDiv=document.createElement("div");
		psDiv.id=psDivId;
		psDiv.style.cssText="border:1px solid #dddddd; width:150px; background:#ffffff;  height:30px; text-align:center; top:0; left:0; position:absolute";
		psDiv.innerHTML="<img src='"+WEB_PATH+"/res/images/ajax_loading.gif'>......<span class='Text_red_b'>文件上传中</span>......";
		document.body.appendChild(psDiv);
		var x=document.documentElement.scrollLeft + window.event.clientX;
		var y=window.event.clientY; 
		psDiv.style.position = "absolute";
		psDiv.style.left=x; 
		psDiv.style.top=y; 
		psDiv.style.display ="";
	}
}

function abcd()
{
	var bgDiv =document.getElementById(_LOADING_DIV_ID+"_BG_UPLOAD");
	if(bgDiv)
		document.body.removeChild(bgDiv);
	var psDiv =document.getElementById(_LOADING_DIV_ID+"_PS_UPLOAD");
	if(psDiv)
		document.body.removeChild(psDiv);
}
//-->
</SCRIPT>
<%
}
else
{
	String[] saFileType =StringUtil.toArray(ServletUtil.get(request, "file_type"), "|");
	String sFileType ="*.*";
	if(saFileType.length >1)
	{
		sFileType ="";
		for(int i=0; i<saFileType.length; i++)
		{
			if(sFileType.length() >0)
			{
				sFileType +=";";
			}
			sFileType +="*."+saFileType[i];
		}
	}
%>
<head>
<base target="_self">
</head>
<form id="idFormUpload" action="swf/Upload.jsp">
	<input type=hidden name="deal_code" value="<%=ServletUtil.get(request, "deal_code")%>">
	<input type=hidden name="deal_type" value="<%=ServletUtil.get(request, "deal_type")%>">
	<input type=hidden name="edit" value="<%=sEdit%>">
	<input type=hidden name="type" value="<%=ServletUtil.get(request, "type")%>">
	<input type=hidden name="sub_type" value="<%=ServletUtil.get(request, "sub_type")%>">
	<input type=hidden name="rows" value="<%=ServletUtil.get(request, "rows")%>">
	<input type=hidden name="cover" value="<%=ServletUtil.get(request, "cover")%>">
	<input type=hidden name="file_type" value="<%=sFileType%>">
</form>
<script>
	idFormUpload.submit();
</script>
<%
}%>