<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script language="javascript" src="<%=GlobalUtil._WEB_PATH%>/officeedit/WebEditor.js"></script>
<script language="javascript" for=WebOffice event="OnDocumentOpened(vFileName,vObject)">
	OnDocumentOpened(vFileName,vObject);	//打开文件事件
</script>
<script language="javascript" for=WebOffice event="OnDocumentClosed()">
	OnDocumentClosed();			//关闭文件事件
</script>
<body onLoad="Load2();">
<%
String sCard =ServletUtil.get(request,"card").equals("")?"":ServletUtil.get(request,"card");
String sWfNo =ServletUtil.get(request,"WF_NO").equals("")?"":ServletUtil.get(request,"WF_NO");
String sFpuNo =ServletUtil.get(request,"FPU_NO").equals("")?"":ServletUtil.get(request,"FPU_NO");
System.out.println("sFpuNo="+sFpuNo);
if(sFpuNo.equals(""))
{
%>
<$:A service="getWfCurrentFpuItems" dynamic="true">
	<$:P name="wf_no" value="<%=sWfNo%>"/>
</$:A>
<%
}
else
{
%>
<$:A service="getWfFpuItems" dynamic="true">
	<$:P name="wf_no" value="<%=sWfNo%>"/>
	<$:P name="fpu_no" value="<%=sFpuNo%>"/>
</$:A>
<%}%>
<$:M dtype="1"/>
<%
int iViewUrlType =-1;
String sViewUrl =null;

if(ServletUtil.getResult(request,"FPUITEMS") !=null)
{
	DataSet alData =(DataSet)ServletUtil.getResult(request,"FPUITEMS");
	Row hmTmp =(Row)alData.get(0);
	if(hmTmp.get("VIEWURL") !=null)
	{
		sViewUrl =hmTmp.get("VIEWURL").toString();
		if(sViewUrl.trim().length()>0)
			iViewUrlType =Integer.parseInt(hmTmp.get("VIEWURLTYPE").toString());
	}
}	

if(iViewUrlType ==0)
{//替换
	if(sViewUrl.indexOf("?") !=-1)
		sViewUrl +="&"+request.getQueryString();
	else
		sViewUrl +="?"+request.getQueryString();
	System.out.println("sViewUrl="+sViewUrl);
%>
	<jsp:include page="<%=sViewUrl%>" flush="true"/>
<%
}
else
{
	%>
<$:G title="card.detail" from="4" width="100%">
	<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
	<%
		Row hmData =null;
		Enumeration en =request.getParameterNames();
		while(en.hasMoreElements()){
			if(hmData ==null) hmData =new Row();
			Object oPara =en.nextElement();
			hmData.put(oPara, ServletUtil.get(request,oPara.toString()));
		}
		hmData.put("all", "1");
	%>
   <$:A service="getTableView" dynamic="false" condition="<%=hmData%>"/>
   <$:M dtype="1"/>
   <%
   StringBuffer html =new StringBuffer();
   String sColor =ServletUtil._DEFAULT_TABLE_STYLE;
   Identity oUser =(Identity)pageContext.getSession().getAttribute("user");
   if(oUser.get("table-style") !=null 
         && !oUser.get("table-style").toString().equals(""))
      sColor =oUser.get("table-style").toString();
   if(ServletUtil.getResult(request,"FIELDSINFO") !=null)
   {
      int iRowTmp =0;
      int iColTmp =0;
      DataSet alData =(DataSet)ServletUtil.getResult(request,"FIELDSINFO");
      if(alData !=null && alData.size() >0)
      {
         for(int i=0; i<alData.size(); i++)
         {
            Row hmTmp =(Row)alData.get(i);
            int iRow =Integer.parseInt(hmTmp.get("IROW").toString());
            int iCol =Integer.parseInt(hmTmp.get("ICOLUMN").toString());
            int iRowspan =Integer.parseInt(hmTmp.get("ROWSPAN").toString());
            int iColspan =Integer.parseInt(hmTmp.get("COLSPAN").toString());
            String sFieldCname =hmTmp.get("FIELD_CNAME").toString();
            String sFieldValue =hmTmp.get("FIELD_VALUE")==null?"":hmTmp.get("FIELD_VALUE").toString();
            sFieldValue =hmTmp.get("FIELD_VALUE_TMP")==null?sFieldValue:hmTmp.get("FIELD_VALUE_TMP").toString();
            if(iRowTmp != iRow)
            {
               if(iRowTmp !=0)
                  html.append("</TR>");
               html.append("<TR  bgcolor=\"#ffffff\">");
               iRowTmp =iRow;   
            }
            html.append("<TD width=1% nowrap align=right valign=middle rowspan="+iRowspan+" valign=top class='td_c'>"
					+sFieldCname
					+":</td><td valign=middle rowspan="+iRowspan+" colspan="
                  +(iColspan*2-1)+">"+StringUtil.replace(StringUtil.replace(sFieldValue, "\n", "<br>"),"  ","&nbsp;")+"&nbsp;</TD>");
         }
         html.append("</TR>");
      }
   }
		out.println(html.toString());
		html.setLength(0);
		%>
	</table>
<%
if(iViewUrlType ==2)
{//新开窗口
%>
<table border=0 width=100%>
<tr>
<%
if(sViewUrl.indexOf("?") ==-1)
	sViewUrl +="?"+request.getQueryString();
else
	sViewUrl +="&"+request.getQueryString();
out.println("<td align=center><a href=\""+GlobalUtil._WEB_PATH+sViewUrl+"\" target=_blank>流程环节参考</a><td>");
%>
</tr></table>
<%}
else if(iViewUrlType ==1)
{//追加
%>
<table border="0" bordercolor="3B87D1" bordercolorlight="#FFFFFF" cellpadding="0" cellspacing="0" width=100%>
<tr>
<%
if(sViewUrl.indexOf("?") ==-1)
	sViewUrl +="?"+request.getQueryString();
else
	sViewUrl +="&"+request.getQueryString();
out.println("<td align=center><a href=\""+GlobalUtil._WEB_PATH+sViewUrl+"\" target=_blank>更详细信息</a><img src=\""+GlobalUtil._WEB_PATH+"/res/images/downwards.gif\" width=\"18\" height=\"15\" class=\"hand\" onClick=\"JM_sh(alternatives,this)\"><td>");
%>
<tbody id=alternatives style="DISPLAY: none">
<tr>
	<td>
		<jsp:include page="<%=sViewUrl%>" flush="true">
				<jsp:param name="PARAMS" value="<%=request.getQueryString()%>"/>
		</jsp:include>
	</td>
</tr>
</tbody>
</tr></table>
</body>
<script>
function JM_sh(ob,Img){
	if (ob.style.display=="none"){
			 ob.style.display="";
	}
	else{
			 ob.style.display="none";
	}

	if (Img.src.indexOf("downwards.gif")>0){
			 Img.src="<%=GlobalUtil._WEB_PATH%>/res/images/upwards.gif";
	}
	else{
		if (Img.src.indexOf("upwards.gif")>0){Img.src="<%=GlobalUtil._WEB_PATH%>/res/images/downwards.gif";}
	}
}
</script>
<%}
%>
	<table cellpadding="1" cellspacing="1" class="table_c" align=right width=100%>
	<%
		//if(ServletUtil.getResult(request,"UPLOADPRO") !=null)
		{
		%>
		<tr>
			<td align=right colspan=2>&nbsp;
				<$:A service="getFpuUploadProp" dynamic="false">
					<$:P name="WF_NO" value="<%=sWfNo%>"/>
					<$:P name="FPU_NO" value="<%=sFpuNo%>"/>
				</$:A>
				<$:M dtype="1"/>
			<%
			DataSet alData =(DataSet)ServletUtil.getResult(request,"UPLOADPRO");
			if(alData !=null && alData.size() >0)
			{
				Row hmTmp =(Row)alData.get(0);
				String sCanUploadPic =
					hmTmp.get("CAN_UPLOAD_PIC")==null?"0":hmTmp.get("CAN_UPLOAD_PIC").toString();
				String sCanUploadAtt =
					hmTmp.get("CAN_UPLOAD_ATT")==null?"0":hmTmp.get("CAN_UPLOAD_ATT").toString();
				if(sCanUploadPic.equals("1"))
					out.println("<a href='Attach.jsp?TYPE=1&WF_NO="+sWfNo+"&FPU_NO="+sFpuNo+"'>"+GlobalUtil.getLocalizedString("card.pic_manager")+"</a>");
				if(sCanUploadAtt.equals("1"))
					out.println("<label style='cursor:hand' onClick=\"runOpen('"+GlobalUtil._WEB_PATH+"/system/card/Attach.jsp?TYPE=2&WF_NO="+sWfNo+"&FPU_NO="+sFpuNo+"', true, 600, 500);location.reload();\">"+GlobalUtil.getLocalizedString("card.attach_manager")+"</label>");
			}
	%> </td>      
		</tr>
	<%}
	//if(ServletUtil.getResult(request,"PICATTACH") !=null
		//|| ServletUtil.getResult(request,"FILEATTACH") !=null)
	{
	%>
		<tr class="tr_c">
			<td width=50%><$:I item="card.pic"/></td><td width=50%><$:I item="card.attach"/></td>
		</tr>
		<$:A service="getAttachList" dynamic="true">
			<$:P name="wf_no" value="<%=sWfNo%>"/>
		</$:A>
		<$:M dtype="1"/>
		<tr class="tr_c">
			<td>
	<%
		if(ServletUtil.getResult(request,"PICATTACH") !=null)
		{
			DataSet alData =(DataSet)ServletUtil.getResult(request,"PICATTACH");
			if(alData !=null && alData.size() >0)
			{
				StringBuffer sbHtml =new StringBuffer();
				sbHtml.append("<table width='100%'  cellpadding='0' cellspacing='0' class='table_c'>");
				for(int i=0; i<alData.size(); i++)
				{
					Row hmTmp =(Row)alData.get(i);
					sbHtml.append("<tr class=tr_c><td valign=middle>"+hmTmp.get("ATT_DESC")+"</td><td><img src='"
						+GlobalUtil._WEB_PATH+ConfigUtil.getParam("WORKFLOW_ATTACH")
						+"/"+sWfNo+"/"+hmTmp.get("FILENAME")+"'></td></tr>");
				}
				sbHtml.append("</table>");
				out.println(sbHtml.toString());
				sbHtml =null;
			}
		}
	%>      
			</td>
			<td valign=top>
	<%
		if(ServletUtil.getResult(request,"FILEATTACH") !=null)
		{
			DataSet alData =(DataSet)ServletUtil.getResult(request,"FILEATTACH");
			if(alData !=null && alData.size() >0)
			{
				StringBuffer sbHtml =new StringBuffer();
				sbHtml.append("<table width='100%'  cellpadding='0' cellspacing='0' class='table_c'>");
				for(int i=0; i<alData.size(); i++)
				{
					Row hmTmp =(Row)alData.get(i);
					sbHtml.append("<tr class=tr_c><td valign=middle>"+hmTmp.get("ATT_DESC")+"</td><td>"
						+hmTmp.get("FILENAME")+"</td><td>");
					if(hmTmp.get("FILENAME").toString().toLowerCase().indexOf(".doc") !=-1
						|| hmTmp.get("FILENAME").toString().toLowerCase().indexOf(".xls") !=-1)
					{
						sbHtml.append("<a href='"+GlobalUtil._WEB_PATH+"/officeedit/DocumentEditFile.jsp?wf_no="+sWfNo+"&filename="+hmTmp.get("FILENAME")+"' target=_blank>在线编辑</a>");
					}
					sbHtml.append("<a href='Download.jsp?wf_no="+sWfNo+"&filename="+hmTmp.get("FILENAME")+"' target=blank>下载</a></td></tr>");
				}
				sbHtml.append("</table>");
				out.println(sbHtml.toString());
				sbHtml =null;
			}
		}
	%>      
			</td>
		</tr>
	<%}%>
	</table>
</$:G>
<%
}%>

