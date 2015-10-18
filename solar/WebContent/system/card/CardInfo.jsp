<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sCard =request.getParameter("card")==null?"":request.getParameter("card");
%>
<$:A service="getTableProperties" dynamic="false">
   <$:P name="table_ename" value="<%=sCard%>"/>
</$:A>
<$:M dtype="1"/>
<%
//
boolean bInfoPrint  =false,bCopy =false, bSave =false;
Row hmRowData =new Row();

if(ServletUtil.getResult(request,"DATA") !=null)
{
   DataSet alData =(DataSet)ServletUtil.getResult(request,"DATA");
   Row hmTmp =(Row)alData.get(0);
   String sPremTypes =hmTmp.get("PREMTYPES")==null?"":hmTmp.get("PREMTYPES").toString();
   if(!sPremTypes.equals(""))
   {
      String[] saPremType =StringUtil.toArray(sPremTypes, ",");
      //0、查询 1、添加   2、修改  3、删除 4、详细信息  5、列表 6、导出Excel 7、导入Excel 8、列表打印  9、详情打印
      for(int i=0; i<saPremType.length; i++)
      {
         int iPremType =Integer.parseInt(saPremType[i]);
         switch(iPremType)
         {
            case 9:  bInfoPrint =true; break;
            case 10:  bCopy =true; break;
            case 11:  bSave =true; break;
         }
      }
   }
}
String sBodyProp ="";
if(!bCopy)
{
	//sBodyProp ="oncontextmenu=\"return false\" ondragstart=\"return false\" onselectstart =\"return false\" onselect=\"document.selection.empty()\" oncopy=\"document.selection.empty()\" onbeforecopy=\"return false\" onmouseup=\"document.selection.empty()\"";
}
String sSave ="";
if(!bSave)
{
	sSave ="<noscript><iframe src=*></iframe></noscript>";
}
%>
<script language="javascript" src="<%=GlobalUtil._WEB_PATH%>/officeedit/WebEditor.js"></script>
<script language="javascript" for=WebOffice event="OnDocumentOpened(vFileName,vObject)">
	OnDocumentOpened(vFileName,vObject);	//打开文件事件
</script>
<script language="javascript" for=WebOffice event="OnDocumentClosed()">
	OnDocumentClosed();			//关闭文件事件
</script>

<body <%=sBodyProp%> ><%=sSave%>
<$:G title="详细信息">
	<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
	<%
		Row hmData =new Row();
		Enumeration en1 =request.getParameterNames();
		while(en1.hasMoreElements()){
			Object oPara =en1.nextElement();
			hmData.put(oPara, request.getParameter(oPara.toString()));
		}
		if(session.getAttribute("dbname") !=null)
		{
			hmData.put("DBNAME", session.getAttribute("dbname"));
		}

	%>
		<$:A service="getTableView" dynamic="false" condition="<%=hmData%>"/>
		<$:M dtype="1"/>
		<%
		StringBuffer html2 =new StringBuffer();
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
					String sFieldEname =hmTmp.get("FIELD_ENAME").toString();
					String sFieldCname =hmTmp.get("FIELD_CNAME").toString();
					String sFieldValue =hmTmp.get("FIELD_VALUE")==null?"":hmTmp.get("FIELD_VALUE").toString();
					hmRowData.put(sFieldEname, sFieldValue);
					sFieldValue =hmTmp.get("FIELD_VALUE_TMP")==null?sFieldValue:hmTmp.get("FIELD_VALUE_TMP").toString();
					if(iRowTmp != iRow)
					{
						if(iRowTmp !=0)
							html2.append("</TR>");
						html2.append("<TR  bgcolor=\"#ffffff\">");
						iRowTmp =iRow;   
					}
					html2.append("<TD width=1% class='td_c' nowrap align=right valign=middle rowspan="+iRowspan+" valign=top><b>"
						//+"<font color='#"+sColor+"'>"
						+sFieldCname
						//	+"</font>"
						+"</b>:</td><td valign=middle rowspan="+iRowspan+" colspan="
							+(iColspan*2-1)+">"+StringUtil.replace(StringUtil.replace(sFieldValue, "\n", "<br>"),"  ","&nbsp;")+"&nbsp;</TD>");
				}
				html2.append("</TR>");
				alData.clear();
				alData =null;
			}
		}
		out.println(html2.toString());
		hmData.clear();
		hmData =null;
		%>
	</table>
</$:G>
<%
java.util.Enumeration en =request.getParameterNames();
while(en.hasMoreElements()){
	Object oPara =en.nextElement();
	hmRowData.put(oPara.toString().toUpperCase(), request.getParameter(oPara.toString()));
}
//显示关联表信息
DataSet alData =(DataSet)ServletUtil.getResult(request,"REL_TABLEINFO");
if(alData !=null && alData.size() >0)
{
	for(int i=0; i<alData.size(); i++)
	{
		Row hmTmp =(Row)alData.get(i);
		String sTable =hmTmp.get("TABLE_ENAME").toString();
		String sField =hmTmp.get("FIELD_ENAME").toString();
		String sTableCname =hmTmp.get("TABLE_CNAME").toString();
		String sUrl ="/system/card/CardlistIncludeThin.jsp?card="+sTable+"&_Q"+sField+"="+hmRowData.get(sField)+"&disabled_rel_table=1";
		%>
			<jsp:include page="<%=sUrl%>" flush="false"/>
		<%
	}
	alData.clear();
	alData =null;
}
//包含页面信息
DataSet alPage =(DataSet)ServletUtil.getResult(request,"REL_PAGE");
request.removeAttribute(ServletUtil._SOFT_TAG+"REL_PAGE");
if(alPage !=null && alPage.size() >0)
{
	for(int i=0; i<alPage.size(); i++)
	{
		Row hmTmp =(Row)alPage.get(i);
		String sPageCname =hmTmp.get("PAGE_CNAME").toString();
		String sPageUrl =hmTmp.get("PAGE_URL").toString();
		String[] p=StringUtil.toArray(sPageUrl,"{");
		sPageUrl ="";
      for(int ii=0;ii<p.length;ii++)
      {
         if(p[ii].indexOf("}")>=0)
         {
				Object oValue =hmRowData.get(p[ii].substring(0,p[ii].indexOf("}")).toUpperCase());
				if(oValue !=null)
				{
					p[ii] =oValue.toString() +p[ii].substring(p[ii].indexOf("}")+1);
				}
         }
         sPageUrl+=p[ii];
      }
		if(sPageUrl.indexOf("?") !=-1)
			sPageUrl +="&include=1";
		else
			sPageUrl +="?include=1";
		%>
			<table cellpadding="2" cellspacing="1" class="table_c" width="100%">
				<tr class="tr_c">
					<td valign=middle align="center" height=30><B><%=sPageCname%></B></td>
				</tr>
				<tr class="tr_c">
					<td>
						<jsp:include page="<%=sPageUrl%>" flush="false"/>
					</td>
				</tr>
			</table>
		<%
	}
	alPage.clear();
	alPage =null;
}
hmRowData.clear();
hmRowData =null;
if(request.getParameter("include") ==null)
{//非include页面，显示按钮信息
%>
<div align=right>
<%
String sQuery =request.getQueryString();
int iIndex =0;
%>
<%if(bInfoPrint){iIndex++;%><input type="button" value=<zz:I18n item="html.button.print"/> class="btfirst" onclick="onPrint('<%=sQuery%>')"><%}%><!--<input type="button" value=<zz:I18n item="html.button.close"/> class='<%=(iIndex==1?"btNoFirst":"btFirst")%>' onclick="history.back();window.close()">--><%
DataSet alTopConfig =null;
if(ServletUtil.getResult(request,"TOPCONFIG") !=null)
   alTopConfig =(DataSet)ServletUtil.getResult(request,"TOPCONFIG");
%><!--功能元件显示--><$:A service="getPageComponents" dynamic="false"><$:P name="card" value="<%=sCard%>"/><$:P name="page_type" value="2"/></$:A><$:M dtype="1"/><%
		StringBuffer html =new StringBuffer(1000);
		StringBuffer js =new StringBuffer(1000);
		if(ServletUtil.getResult(request,"COMPONETS") !=null)
		{
			DataSet alComps =(DataSet)ServletUtil.getResult(request,"COMPONETS");
			String sClass ="btnofirst";
			html.setLength(0);
			for(int p=0; p<alComps.size(); p++)
			{
				Row hmTmp2 =(Row)alComps.get(p);
				int iId =Integer.parseInt(hmTmp2.get("COMPONENT_ID").toString());
				String sCompType =hmTmp2.get("COMPONENT_TYPE")==null?"":hmTmp2.get("COMPONENT_TYPE").toString();
				String sCompName =hmTmp2.get("COMPONENT_NAME")==null?"":hmTmp2.get("COMPONENT_NAME").toString();
				String sCompValue =hmTmp2.get("COMPONENT_VALUE")==null?"":hmTmp2.get("COMPONENT_VALUE").toString();
				String sShortCut =hmTmp2.get("SHORT_CUT")==null?"":hmTmp2.get("SHORT_CUT").toString();
				if(sCompType.equals("1"))
				{//button
					sClass ="btnofirst";
					if(sShortCut.length() >0)
						html.append("<input type=button name='"+sCompName+"("+sShortCut+")' class='"+sClass+"' value='"+sCompValue+"' accesskey='"+sShortCut+"' ");
					else
						html.append("<input type=button name='"+sCompName+"' class='"+sClass+"' value='"+sCompValue+"'");

                     if(alTopConfig !=null)
                     {//定义的事件
                        boolean bHasConfig =false;
                        for(int n=0; n<alTopConfig.size(); n++)
                        {
                           Row hmArray =(Row)alTopConfig.get(n);
                           int iCompType =Integer.parseInt((String)hmArray.get("COMP_TYPE"));
                           int iActionType =Integer.parseInt((String)hmArray.getString("ACTION_TYPE","0"));
                           int iTimeSeq =Integer.parseInt((String)hmArray.getString("TIME_SEQ","0"));
                           int iActType =Integer.parseInt((String)hmArray.getString("ACT_TYPE","0"));
                           String sActName =(String)hmArray.getString("ACT_NAME","");
                           String sJavaScript =(String)hmArray.getString("JAVASCRIPT","");
                           if(sActName.indexOf("?") ==-1 && sJavaScript.length()==0)
                              sActName +="?tmp=1";
                           if(iCompType ==iId)
                           {
                              if(iActionType ==1 && iActType==1)//点击打开URL
								 if(sActName.toLowerCase().indexOf("http:") !=-1)
									html.append(" onClick=window.open('"+sActName+"')");
                                 else 
									 html.append(" onClick=window.open('"+GlobalUtil._WEB_PATH+sActName+"')");
                              else if(iActionType ==2 && iActType==1)//点击打开URL
                                 html.append(" onDblClick=window.open('"+sActName+"')");
                              if(iActionType ==1 && iActType==3 && sJavaScript.length()>0)//点击调用Javascript
							   {
								   html.append(" onClick="+sActName);
								   sJavaScript =StringUtil.replace(sJavaScript, "$WEB_PATH$", GlobalUtil._WEB_PATH);
								   js.append("\n\n<script>\nfunction "+sActName+"\n{\n"+sJavaScript+"\n}\n</script>");
							   }
                              bHasConfig =true;
                           }
                        }
                     }
					html.append(">");
				}
			}
			out.print(html.toString());
			out.print(js.toString());
			html.setLength(0);
			js.setLength(0);
		}
	%>
   <!--功能元件显示--></div>
</body>
<script>
function onPrint(query)
{
   document.location ='<%=GlobalUtil._WEB_PATH%>/system/card/CardPrint.jsp?'+query;
}
</script>
<%}%>
