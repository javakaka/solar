<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.juts.utility.*,com.juts.web.utility.ServletUtil,com.juts.framework.vo.*,com.juts.web.status.*,com.juts.framework.engine.*"%>
<%@ include file="/include/Head.jsp"%>
<!--jsp:include page="/main/menu1/RightMenu.jsp" flush="false"/-->
<base target="_self">
<!--ͷ��-->
<!--<script src="<dd%=GlobalUtil._WEB_PATH%>/res/js/hidden.js"></script>-->
<!-- <script language="javascript1.2" src="<dd%=GlobalUtil._WEB_PATH%>/res/js/WKPrint.JS"></script>
 -->
<base target="_self">
 <%
Row hmQuery =new Row();
//��ҳ���������Ĳ���
Enumeration oEn =request.getParameterNames();
while(oEn.hasMoreElements()){
	Object oPara =oEn.nextElement();
	if(request.getParameter(oPara.toString()) !=null)
		hmQuery.put(oPara, StringUtil.isoToGBK(request.getParameter(oPara.toString()),true));//������ת��
		//hmQuery.put(oPara, request.getParameter(oPara.toString()));
}


String sCard =request.getParameter("card")==null?"":request.getParameter("card");
//��ʾ�Ǵ� cardedit.jsp ����ѡ������
boolean bSelect =request.getParameter("select")==null?false:true;

//list_no��ֵ��ʾ��ȡҳ�������HTML CODE
boolean bGetHtmlCode =false;
String sListNo =request.getParameter("list_no")==null?"":request.getParameter("list_no");
if(sListNo.length() >0)
	bGetHtmlCode =true;

StringBuffer html =new StringBuffer(1000);
StringBuffer js =new StringBuffer(1000);
String jsRowClickEvent =null;
String jsRowDbClickEvent =null;
DataSet alTableKeys =new DataSet();
int iRows =5;

/*
�õ�������ԣ�������
1�����Ĳ���Ȩ�ޣ�
2���б�����
*/
%>
<$:A service="getTableProperties" dynamic="false">
   <$:P name="table_ename" value="<%=sCard%>"/>
</$:A>
<$:M dtype="1"/>
<%
//
LogUtil.println(ServletUtil.getResult(request,"DATA"));
boolean bQuery =false, bAdd =false, bUpdate =false, bDelete =false;
boolean bInfo =false, bList =false, bExportExcel =false, bImportExcel =false, bListPrint =false, bInfoPrint  =false,bCopy =false, bSave =false, bBatchDelete =false;
String sTableCName ="�б�����";
boolean hasBlobField =false;
DataSet alTopConfig =null;
StringBuffer sbKeys =new StringBuffer();
if(bGetHtmlCode)
{
	//����ǻ�ȡHTML ���룬�������а�ť��Ч
	bQuery =true;
	bAdd =true;
	bUpdate =true;
	bDelete =true;
	bInfo =true;
	bList =true;
	bExportExcel =true;
	bImportExcel =true;
	bListPrint =true;
	bInfoPrint =true;
	bCopy =true;
	bSave =true;
	bBatchDelete =true;
}
else
{
	if(ServletUtil.getResult(request,"DATA") !=null)
	{
		DataSet alData =(DataSet)ServletUtil.getResult(request,"DATA");
		Row hmTmp =(Row)alData.get(0);
		sTableCName =hmTmp.getString("TABLE_CNAME");
		hasBlobField =hmTmp.containsKey("HASBLOBFIELD");
		String sPremTypes =hmTmp.getString("PREMTYPES", "");
		iRows =Integer.parseInt(hmTmp.getString("ROWS", "10"));
		if(!sPremTypes.equals(""))
		{
			String[] saPremType =StringUtil.toArray(sPremTypes, ",");
			//0����ѯ 1�����   2���޸�  3��ɾ�� 4����ϸ��Ϣ  5���б� 6������Excel 7������Excel 8���б��ӡ  9�������ӡ 10������ 11������ 12������ɾ��
			for(int i=0; i<saPremType.length; i++)
			{
				int iPremType =Integer.parseInt(saPremType[i]);
				switch(iPremType)
				{
					case 0:  bQuery =true; break;
					case 1:  bAdd =true; break;
					case 2:  bUpdate =true; break;
					case 3:  bDelete =true; break;
					case 4:  bInfo =true; break;
					case 5:  bList =true; break;
					case 6:  bExportExcel =true; break;
					case 7:  bImportExcel =true; break;
					case 8:  bListPrint =true; break;
					case 9:  bInfoPrint =true; break;
					case 10: bCopy =true; break;
					case 11: bSave =true; break;
					case 12:	bBatchDelete =true; break;
				}
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
<base target="_self">
<body <%=sBodyProp%> onLoad="onPageLoad()"><%=sSave%>
<$:G title="<%=sTableCName+"�б�����"%>">
<div align=right id="id4">
<%int iIdx=0;%>
<%if(bListPrint && !bSelect){iIdx++;%><!--�б��ӡ--><input type=button value=<$:I item="html.button.printone"/> class='<%=iIdx==1?"btTopfirst":"btTopnofirst"%>' onClick="wkprint('id1,id2,id3,id4')"><input type=button value=<$:I item="html.button.printall"/> class="btTopnofirst" onClick="document.location='CardListPrint.jsp?card=<%=sCard%>';"><%}%><%if(bExportExcel && !bSelect){iIdx++;//����Excel�ļ�
%><input type=button value=<$:I item="html.button.excel"/> class='<%=iIdx==1?"btTopfirst":"btTopnofirst"%>' onClick="window.parent.hiddenFrame.location='ExcelImp.jsp?card=<%=sCard%>';">
<%}%>
</div>
<%if(bList){//�б�Ȩ��	
	String sOrderField =request.getParameter("orderfield");
	String sOrderType =request.getParameter("ordertype");
%>
<table name="t_<%=sCard%>" id="t_<%=sCard%>" onClick="onRow()" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" >
   <!--TH-->
   <TR bgcolor="#ffffff">
<%
/*
����Ȩ�޵õ��б���ʾ�ֶ���Ϣ
*/
%>
	  <$:A service="getTableListFields" dynamic="false">
         <$:P name="table_ename" value="<%=sCard%>"/>
         <$:P name="list_no" value="<%=sListNo%>"/>
      </$:A>
      <$:M dtype="1"/>
		<td class="td_tilte" width=1% nowrap>���</td>
		<%if(bBatchDelete){%><td class="td_tilte" width=1% ><input type=checkbox name="ckAllChecked" class="radio" onClick="onCheckBatch(this)"></td><%}%>
		<%
		String[] saFieldWidth =null;
		int iTableCells =0;
		if(ServletUtil.getResult(request,"FIELDS") !=null)
		{
			DataSet alFields =(DataSet)ServletUtil.getResult(request,"FIELDS");
			saFieldWidth =new String[alFields.size()];
			iTableCells =alFields.size();
			for(int i=0; i<alFields.size(); i++)
			{
				Row haField =(Row)alFields.get(i);
				if(haField.getString("WIDTH", "").length() >0)
					saFieldWidth[i] =haField.getString("WIDTH");
				else
					saFieldWidth[i] =" nowrap";
					
				%>
	         <td class="td_c" nowrap width='<%=saFieldWidth[i]%>' onClick=onSort('<%=haField.getString("FIELD_ENAME")%>') style="cursor:hand"><%=haField.getString("FIELD_CNAME")%></td>
				<%
			}
			//alFields.clear();
			//alFields =null;
		}
		%>
   </TR>   
   <!--TR-->
   <%
		String sQueryFields =null;
		if(ServletUtil.getResult(request,"FIELDS") !=null)
		{//�õ���ʾ���ֶ�
			DataSet alTmp =(DataSet)ServletUtil.getResult(request,"FIELDS");
			for(int i=0; i<alTmp.size(); i++)
			{
				Row hmTmp =(Row)alTmp.get(i);
				if(sQueryFields ==null)
					sQueryFields =hmTmp.getString("FIELD_ENAME");
				else
					sQueryFields +=","+hmTmp.getString("FIELD_ENAME");
			}
		}
      request.removeAttribute(ServletUtil._SOFT_TAG+"SUM");
      IVO ivo =new IVO(0);
      Row hmData =null;
      Row hmParas =null;
      Enumeration en =request.getParameterNames();
      while(en.hasMoreElements()){
         if(hmData ==null) hmData =new Row();
         if(hmParas ==null) hmParas =new Row();

         Object oPara =en.nextElement();
         hmData.put(oPara.toString().toUpperCase(), request.getParameter(oPara.toString()));
         hmParas.put(oPara.toString().toUpperCase(), request.getParameter(oPara.toString()));
      }
      ivo.oForm =hmData;
      /*�������ҳ�����ݣ�Ϊ��ӡ�뵼��Excel��׼��*/
      if(hmParas !=null && hmParas.size()>0)
         session.setAttribute("paras", hmParas);
      ivo.set("TABLE_ENAME", sCard);
      ivo.set("QUERYFIELDS", sQueryFields);
      ivo.set("PAGESIZE", String.valueOf(iRows));
      int iCurrentPage =1;
      if(request.getParameter(ServletUtil._SOFT_TAG+"currentpage")!=null)
         iCurrentPage =Integer.parseInt(request.getParameter(ServletUtil._SOFT_TAG+"currentpage"));
      ivo.set("CURRENTPAGE", String.valueOf(iCurrentPage));
      if(session.getAttribute("user") !=null)
      {
         Identity oUser =(Identity)session.getAttribute("user");
         ivo.set("STAFF-NO", oUser.get("staff-no"));
         ivo.set("SITE-NO", oUser.get("site-no"));
         ivo.set("AUTH-LEVEL", oUser.get("auth-level"));
         ivo.set("STAFFLANGUAGE", oUser.get("stafflanguage"));
      }
      if(session.getAttribute("dbname") !=null)
         ivo.set("dbname", session.getAttribute("dbname"));
		//�Ƿ��ǻ�ȡhtml code������ǻ�ȡ�����̨���ؿ�����
		if(!bGetHtmlCode)
		{
			ivo.sService ="getTableSeqData";//�������õ�����һ��˳��ı������
			OVO ovo =Action.execute(ivo);
			if(ovo.iCode <0)
			{
				Message err =new Message(ovo.iCode, ovo.sMsg, ovo.sExp);
				session.setAttribute(ServletUtil._ERROR_TAG, err);
				%>
			<$:M dtype="1"/>
			<%
			}
			else
			{
				request.setAttribute(ServletUtil._SOFT_TAG+"SUM", ovo.get("SUM"));
				html =new StringBuffer();
				if(ovo.get("TABLE_KEYS", null) !=null)
				{
					alTableKeys =(DataSet)ovo.get("TABLE_KEYS");
					if(alTableKeys !=null && alTableKeys.size() >0)
						for(int j=0; j<alTableKeys.size(); j++)
							sbKeys.append("+'&"+alTableKeys.get(j)+"='+document.all."+alTableKeys.get(j)+".value");
				}

				DataSet alData =null;
				if(ovo.get("TABLE_DATA", null) !=null)
					alData =(DataSet)ovo.get("TABLE_DATA");
			 
				if(ovo.get("TOP_CONFIG", null) !=null)
					alTopConfig =(DataSet)ovo.get("TOP_CONFIG");
				if(alData !=null && alData.size() >0)
				{
					for(int i=0; i<alData.size(); i++)
					{
						Row hmRow =(Row)alData.get(i);
						html.append("<tr onClick='Table.click()' bgcolor=\"#ffffff\"");
						String sKeyFiled ="";
						if(hmRow !=null && alTableKeys !=null && alTableKeys.size() >0)
						{
							for(int k=0; k<alTableKeys.size(); k++)
							{
								if(hmRow.get(alTableKeys.get(k).toString().toUpperCase()) !=null)
								{
									sKeyFiled +="&"+alTableKeys.get(k).toString().toUpperCase()
										+"="+hmRow.get(alTableKeys.get(k).toString().toUpperCase());

									html.append(" "+alTableKeys.get(k).toString().toUpperCase()+"=\""
										+hmRow.get(alTableKeys.get(k).toString().toUpperCase())+"\" ");
								}
							}
						}
						if(hmRow.get("STATE") !=null)
							html.append(" STATE=\""+hmRow.get("STATE").toString()+"\"");
						if(hmRow.get("WF_NO") !=null)
							html.append(" WF_NO=\""+hmRow.get("WF_NO").toString()+"\"");
						html.append(">");
						if(bBatchDelete)
						{
							String sCheckBoxValue ="";//ѡ�п��ֵ
							if(hmRow !=null && alTableKeys !=null && alTableKeys.size() >0)
							{
								for(int k=0; k<alTableKeys.size(); k++)
								{
									if(hmRow.get(alTableKeys.get(k).toString().toUpperCase()) !=null)
									{
										if(sCheckBoxValue.length() ==0)
											sCheckBoxValue =alTableKeys.get(k).toString().toUpperCase()+"="
											+hmRow.get(alTableKeys.get(k).toString().toUpperCase());
										else
											sCheckBoxValue =";"+alTableKeys.get(k).toString().toUpperCase()+"="
												+hmRow.get(alTableKeys.get(k).toString().toUpperCase());
									}
								}
							}
							html.append("<td width=1 nowrap><input type=checkbox name=\""+sCard+"_rowCheckBox\" class=\"radio\" onClick='onCheckBoxRow(this)' value='"+sCheckBoxValue+"'></td>");
						}
						if(hmRow !=null)
						{
							int j=1;
							html.append("<td width=1% nowrap>"+((iCurrentPage-1) *iRows+i+1)+"</td>");
							while(hmRow.containsKey(String.valueOf(j)))
							{
								html.append("<td width="+saFieldWidth[j-1]+" ");
								if(alTopConfig !=null)
								{
									boolean bHasConfig =false;
									for(int n=0; n<alTopConfig.size(); n++)
									{
										Row hmArray =(Row)alTopConfig.get(n);
										int iCompType =Integer.parseInt(hmArray.getString("COMP_TYPE"));
										int iActionType =Integer.parseInt(hmArray.getString("ACTION_TYPE","0"));
										int iTimeSeq =Integer.parseInt(hmArray.getString("TIME_SEQ","0"));
										int iActType =Integer.parseInt(hmArray.getString("ACT_TYPE","0"));
										if(iCompType ==93 && iActType ==3 )
										{//��
											if(iActionType ==1)//�����¼�
												jsRowClickEvent =hmArray.get("JAVASCRIPT").toString();
											else if(iActionType ==3)//˫���¼�
												jsRowDbClickEvent =hmArray.get("JAVASCRIPT").toString();
											continue;
										}

										String sActName =hmArray.getString("ACT_NAME","");
										if(sActName.indexOf("?") ==-1)
											sActName +="?tmp=1";
										if(iCompType ==j)
										{
											if(iActionType ==1 && iActType==1)//�����URL
												html.append(" onClick=window.open('"+GlobalUtil._WEB_PATH+sActName+sKeyFiled+"')>"+hmRow.getString(String.valueOf(j)));
											else if(iActionType ==2 && iActType==1)//�����URL
												html.append(" onDblClick=window.open('"+sActName+sKeyFiled+"')>"+StringUtil.replace(hmRow.getString(String.valueOf(j)),"\n","<br>"));
											else if(iActionType ==4 && iActType==1)//����
											{
												if(hmRow.containsKey("-"+j))
												{
													if(sActName.toUpperCase().indexOf("HTTP") !=-1)
														sActName =GlobalUtil._WEB_PATH+sActName;
													if(sActName.indexOf("?") !=-1)
														sActName +="&"+hmRow.get("-"+j).toString();
													else
														sActName +="?"+hmRow.get("-"+j).toString();
												}
												html.append("><a href='"+sActName+sKeyFiled+"'>"+StringUtil.replace(hmRow.getString(String.valueOf(j)),"\n","<br>")+"</a>");
											}
											bHasConfig =true;
										}
									}
									if(!bHasConfig) 
										html.append(">"+StringUtil.replace(hmRow.get(String.valueOf(j)).toString(),"\n","<br>"));
								}
								else
								{
									/*
									//����50���ֻ���
									int iRow =50;
									String sTmp1 =hmRow.get(String.valueOf(j)).toString();
									String sTmp2 ="";
									while(sTmp1.length() >iRow)
									{
										sTmp2= sTmp1.substring(0, iRow)+"<br>";
										sTmp1 =sTmp1.substring(iRow);
									}
									sTmp2 +=sTmp1;
									html.append(">"+sTmp2);
									//*/
									html.append(">"+StringUtil.replace(hmRow.get(String.valueOf(j)).toString(),"\n","<br>"));
								}
								html.append("&nbsp;</td>");
								j++;
							}
						}
						html.append("</tr>");
					}
				}
				/*
				for(int m=0; m<iRows-alData.size(); m++)
				{//�������
					html.append("<tr class='tr_c'>");
					for(int n=0; n<iTableCells+1; n++)
						html.append("<td>&nbsp;</td>");
					html.append("</tr>");
				}
				*/
			}
			out.println(html.toString());
		}
   %>
</table>
<%}%>
</$:G>
<script>
function onPageLoad()
{
	<%
	String sPageLoad =null;
	if(alTopConfig !=null)
		for(int i=0; i<alTopConfig.size(); i++)
		{
			Row hmTmp =(Row)alTopConfig.get(i);
			if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("99"))
			{//��Ӱ�ť���滻�¼�
				sPageLoad =hmTmp.get("JAVASCRIPT").toString();
				break;
			}
		}
	if(sPageLoad !=null)
	{
		sPageLoad =StringUtil.replace(sPageLoad, "$WEB_PATH$", GlobalUtil._WEB_PATH);
		sPageLoad =StringUtil.replace(sPageLoad, "$KEYS$", sbKeys.toString());
		out.println(sPageLoad);
	}
	%>
}
<%
StringBuffer sbTmp =new StringBuffer(512);
if(bQuery)
{//��ҳ��ѡ��
%>
function abc()
{
	var features ="dialogHeight = 370px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
	var url ='<%=GlobalUtil._WEB_PATH%>/system/card/CardQuery.jsp?card=<%=sCard%>';
	var query=window.showModalDialog(url,window, features);
	if(query !=null)
	{
		for(i=0; i<query.length; i++)
		{
			var tmp =query[i].split("=");
			for(j=0; j<document.all.query.length; j++)
			{
				if(document.all.query[j].name ==tmp[0])
				{
					document.all.query[j].value =tmp[1];
				}
			}
		}
	}
	document.query.submit();
}
<%
}
%>
function onRow()
{
}
</script>