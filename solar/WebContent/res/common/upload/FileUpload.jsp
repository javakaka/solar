<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
/*
*�ļ��ϴ����û�����Ҫ��¼ϵͳ�����ڵ�¼�ỰSession
*��Σ�
deal_code ҵ������
deal_type ҵ������
type �������࣬��������
sub_type ����С�࣬ ���������ı���������Ƶ
edit �Ƿ���Ա༭ 1Ϊ���ϴ���ɾ����2Ϊ���ϴ���Ĭ�ϲ��ɱ༭
rows �ϴ��ļ���ʼ��������Ĭ��Ϊ3��
cover �Ƿ񸲸� 1Ϊ���ǣ�Ĭ��Ϊ�����ǣ����������ɾ��ԭ�м�¼������Ϊdeal_code/deal_type/type/sub_type
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
{//�ɱ༭
	//����������������ж��ļ��Ƿ��Ѿ��ϴ�
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
String sTitle =StringUtil.isoToGBK(ServletUtil.get(request, "title"), true)+"�ļ��ϴ�";
%>
<$:G title="<%=sTitle%>">
<form name="filesform" method="post" action="Upload.jsp?<%=request.getQueryString()%>" enctype="multipart/form-data"  target="bbc2188">
<table id="idTbAttach" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td class="td_c" width=40% align=center>�ļ�����</td>
		<td class="td_c" width=60% align=center>�����ļ�</td>
	</tr>
</table>	
</$:G>
<iframe name="bbc2188" width=0 height=0 frameborder=0 style="display:none"></iframe>
<div align=center>
	<input type=button value="�ϴ�" onClick="uploadFiles()"><input type=button value="�����ϴ�" onClick="addMoreUpload()">
</div>
<$:G title="�ϴ��ļ��б�">
<table id="idTbAttachList" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td class="td_c" align=center>�ļ���</td>
		<td class="td_c" align=center>�ļ�����</td>
		<td class="td_c" align=center>�ϴ��û�</td>
		<td class="td_c" align=center>�ϴ�ʱ��</td>
		<td class="td_c" align=center>��С</td>
		<td class="td_c" align=center>����/ɾ��</td>
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
		//����һ�������ý�����
		var psDivId =_LOADING_DIV_ID+"_PS_UPLOAD";
		var psDiv=document.createElement("div");
		psDiv.id=psDivId;
		psDiv.style.cssText="border:1px solid #dddddd; width:150px; background:#ffffff;  height:30px; text-align:center; top:0; left:0; position:absolute";
		psDiv.innerHTML="<img src='"+WEB_PATH+"/res/images/ajax_loading.gif'>......<span class='Text_red_b'>�ļ��ϴ���</span>......";
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