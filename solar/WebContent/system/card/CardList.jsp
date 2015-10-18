<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.juts.utility.*,com.juts.web.utility.ServletUtil,com.juts.framework.vo.*,com.juts.web.status.*,com.juts.framework.engine.*"%>
<%@ include file="/include/Head.jsp"%>
<!--jsp:include page="/main/menu1/RightMenu.jsp" flush="false"/-->
<base target="_self">
<!--头部-->
<!--<script src="<dd%=GlobalUtil._WEB_PATH%>/res/js/hidden.js"></script>-->
<!-- <script language="javascript1.2" src="<dd%=GlobalUtil._WEB_PATH%>/res/js/WKPrint.JS"></script>
 -->
<base target="_self">
 <%
Row hmQuery =new Row();
//网页传传过来的参数
Enumeration oEn =request.getParameterNames();
while(oEn.hasMoreElements()){
	Object oPara =oEn.nextElement();
	if(request.getParameter(oPara.toString()) !=null)
		hmQuery.put(oPara, StringUtil.isoToGBK(request.getParameter(oPara.toString()),true));//进行了转码
		//hmQuery.put(oPara, request.getParameter(oPara.toString()));
}


String sCard =request.getParameter("card")==null?"":request.getParameter("card");
//表示是从 cardedit.jsp 打开来选择数据
boolean bSelect =request.getParameter("select")==null?false:true;

//list_no有值表示是取页面的运行HTML CODE
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
得到表格属性，包括：
1、表格的操作权限；
2、列表行数
*/
%>
<$:A service="getTableProperties" dynamic="false">
   <$:P name="table_ename" value="<%=sCard%>"/>
</$:A>
<$:M dtype="1"/>
<%
//
boolean bQuery =false, bAdd =false, bUpdate =false, bDelete =false;
boolean bInfo =false, bList =false, bExportExcel =false, bImportExcel =false, bListPrint =false, bInfoPrint  =false,bCopy =false, bSave =false, bBatchDelete =false;
String sTableCName ="列表数据";
boolean hasBlobField =false;
DataSet alTopConfig =null;
StringBuffer sbKeys =new StringBuffer();
if(bGetHtmlCode)
{
	//如果是获取HTML 代码，则置所有按钮有效
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
			//0、查询 1、添加   2、修改  3、删除 4、详细信息  5、列表 6、导出Excel 7、导入Excel 8、列表打印  9、详情打印 10、拷贝 11、保存 12、批量删除
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
<$:G title="<%=sTableCName+"列表数据"%>">
<%if(bQuery)
{
/*
得到有定义的查询字段
*/
%>
<jsp:include page="/system/card/CardQuery.jsp"> 
	<jsp:param name="card" value="<%=sCard%>" /> 
</jsp:include> 
<%}%>
<div align=right id="id4">
<%int iIdx=0;%>
<%if(bListPrint && !bSelect){iIdx++;%><!--列表打印--><input type=button value=<$:I item="html.button.printone"/> class='<%=iIdx==1?"btTopfirst":"btTopnofirst"%>' onClick="wkprint('id1,id2,id3,id4')"><input type=button value=<$:I item="html.button.printall"/> class="btTopnofirst" onClick="document.location='CardListPrint.jsp?card=<%=sCard%>';"><%}%><%if(bExportExcel && !bSelect){iIdx++;//导出Excel文件
%><input type=button value=<$:I item="html.button.excel"/> class='<%=iIdx==1?"btTopfirst":"btTopnofirst"%>' onClick="window.parent.hiddenFrame.location='ExcelImp.jsp?card=<%=sCard%>';">
<%}%>
</div>
<%if(bList){//列表权限	
	String sOrderField =request.getParameter("orderfield");
	String sOrderType =request.getParameter("ordertype");
%>
<table name="t_<%=sCard%>" id="t_<%=sCard%>" onClick="onRow()" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" >
   <!--TH-->
   <TR bgcolor="#ffffff">
<%
/*
根据权限得到列表显示字段信息
*/
%>
	  <$:A service="getTableListFields" dynamic="false">
         <$:P name="table_ename" value="<%=sCard%>"/>
         <$:P name="list_no" value="<%=sListNo%>"/>
      </$:A>
      <$:M dtype="1"/>
		<td class="td_tilte" width=1% nowrap>编号</td>
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
		{//得到显示的字段
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
      /*缓存参数页面数据，为打印与导出Excel作准备*/
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
		//是否是获取html code，如果是获取，则后台返回空数据
		if(!bGetHtmlCode)
		{
			ivo.sService ="getTableSeqData";//按条件得到具有一定顺序的表格数据
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
							String sCheckBoxValue ="";//选中框的值
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
										{//行
											if(iActionType ==1)//单击事件
												jsRowClickEvent =hmArray.get("JAVASCRIPT").toString();
											else if(iActionType ==3)//双击事件
												jsRowDbClickEvent =hmArray.get("JAVASCRIPT").toString();
											continue;
										}

										String sActName =hmArray.getString("ACT_NAME","");
										if(sActName.indexOf("?") ==-1)
											sActName +="?tmp=1";
										if(iCompType ==j)
										{
											if(iActionType ==1 && iActType==1)//点击打开URL
												html.append(" onClick=window.open('"+GlobalUtil._WEB_PATH+sActName+sKeyFiled+"')>"+hmRow.getString(String.valueOf(j)));
											else if(iActionType ==2 && iActType==1)//点击打开URL
												html.append(" onDblClick=window.open('"+sActName+sKeyFiled+"')>"+StringUtil.replace(hmRow.getString(String.valueOf(j)),"\n","<br>"));
											else if(iActionType ==4 && iActType==1)//链接
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
									//超过50个字换行
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
				for(int m=0; m<iRows-alData.size(); m++)
				{//输出空行
					html.append("<tr class='tr_c'>");
					for(int n=0; n<iTableCells+1; n++)
						html.append("<td>&nbsp;</td>");
					html.append("</tr>");
				}
			}
			out.println(html.toString());
		}
   %>
   <tr bgcolor="#ffffff">
   <td colspan="20" height="1%" align="right">  
      <div id="id3">
      <form name="formpage" method="POST">
			<input type=hidden name="orderfield" value='<$:W name="orderfield" from="request" default=""/>'>
			<input type=hidden name="ordertype" value='<$:W name="ordertype" from="request" default=""/>'>
			<$:Page pagesize="<%=iRows%>"/>
      </form>
      </div>
   </td>
   </tr>
</table>
<%}%>
</$:G>
<div align=right id="id1">
<table width=100% cellpadding="0" cellspacing="0">
<tr>
   <td align=left>
	<%
	String sMethod ="onClick=\"history.go(-1)\" value=\" 返回\"";
	//如果列表是通过open打开的，那么返回调用close（），如不是则调用history.go(-1)
	if(request.getParameter("new") !=null)
		sMethod ="onClick=\"window.close()\" value=\" 关闭\"";
	%>
	<input type=button <%=sMethod%>  class="btSkip"><!--<%	if(bQuery)
	{
		out.println("<input type=button value='查询' class='btSearch' onClick='onQuery()'>");
	}%>--></td>
	<%
	//得到页面按钮的替换
	String sBtAdd =GlobalUtil.getLocalized("html.button.add");//添加按钮
	String sBtUpdate =GlobalUtil.getLocalized("html.button.update");//修改按钮
	String sBtDel =GlobalUtil.getLocalized("html.button.del");//删除按钮
	String sBtInfo =GlobalUtil.getLocalized("html.button.info");//详细信息按钮
	/*
	得到表单其他的配置信息
	*/
	%>
	<$:A service="getPageOtherConfig" dynamic="true">
		<$:P name="table_ename" value="<%=sCard%>"/>
	</$:A>
	<$:M dtype="1"/>
	<%
	if(ServletUtil.getResult(request,"CONFIG") !=null)
	{
		DataSet alData =(DataSet)ServletUtil.getResult(request,"CONFIG");
		Row hmData =(Row)alData.get(0);
		if(hmData.get("BTADD") !=null)
		{
			sBtAdd ="\""+hmData.get("BTADD").toString().trim();
			if(hmData.get("ADD_SHORT") !=null)
			{
				sBtAdd +="("+hmData.get("ADD_SHORT").toString()+")\" accesskey=\""+hmData.get("ADD_SHORT").toString()+"\"";
			}
			else
				sBtAdd +="\"";
		}
		if(hmData.get("BTUPDATE") !=null)
		{
			sBtUpdate ="\""+hmData.get("BTUPDATE").toString().trim();
			if(hmData.get("UPDATE_SHORT") !=null)
			{
				sBtUpdate +="("+hmData.get("UPDATE_SHORT").toString()+")\" accesskey=\""+hmData.get("UPDATE_SHORT").toString()+"\"";
			}
			else
				sBtUpdate +="\"";
		}

		if(hmData.get("BTDEL") !=null)
		{
			sBtDel ="\""+hmData.get("BTDEL").toString().trim();
			if(hmData.get("DEL_SHORT") !=null)
			{
				sBtDel +="("+hmData.get("DEL_SHORT").toString()+")\" accesskey=\""+hmData.get("DEL_SHORT").toString()+"\"";
			}
			else
				sBtDel +="\"";
		}

		if(hmData.get("BTINFO") !=null)
		{
			sBtInfo ="\""+hmData.get("BTINFO").toString().trim();
			if(hmData.get("INFO_SHORT") !=null)
			{
				sBtInfo +="("+hmData.get("INFO_SHORT").toString()+")\" accesskey=\""+hmData.get("INFO_SHORT").toString()+"\"";
			}
			else
				sBtInfo +="\"";
		}
	}
	%>
	<%int iIndex=0;%>
	<td align=right><div id='idDivOperate'><%
	if(bInfo){iIndex++;%><input type=button value=<%=sBtInfo%> class='<%out.println(iIndex==1?"btfirst":"btnofirst");%>' onClick="onInfo()" name="btInfo" disabled><%}%><%if(!bSelect){if(bAdd){iIndex++;%><input type=button value=<%=sBtAdd%> class='<%out.println(iIndex==1?"btfirst":"btnofirst");%>' onClick="onAdd()"><%}%><%if(bUpdate){iIndex++;%><input type=button value=<%=sBtUpdate%> class='<%out.println(iIndex==1?"btfirst":"btnofirst");%>' onClick="onUpdate()" name="btUpdate" disabled><%}%><%if(bDelete){iIndex++;%><input type=button value=<%=sBtDel%> class='<%out.println(iIndex==1?"btfirst":"btnofirst");%>' onClick ="onDel()" name="btDel" disabled><%}%><%if(bBatchDelete){iIndex++;%><input type=button value="批量删除" class='<%out.println(iIndex==1?"btfirst":"btnofirst");%>' onClick ="onBatchDel()" name="btBatchDel" disabled><%}%><!--功能元件显示--><$:A service="getPageComponents" dynamic="false"><$:P name="card" value="<%=sCard%>"/><$:P name="page_type" value="0"/></$:A><$:M dtype="1"/><%
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
						iIndex ++;
						if(iIndex ==1)
							sClass ="btfirst";
						else
							sClass ="btnofirst";
						if(sShortCut.length() >0)
							html.append("<input type=button name='"+sCompName+"' class='"+sClass+"' value='"+sCompValue+"("+sShortCut+")' accesskey='"+sShortCut+"' disabled ");
						else
							html.append("<input type=button name='"+sCompName+"' class='"+sClass+"' value='"+sCompValue+"' disabled ");

								if(alTopConfig !=null)
								{//定义的事件
									boolean bHasConfig =false;
									for(int n=0; n<alTopConfig.size(); n++)
									{
										Row hmArray =(Row)alTopConfig.get(n);
										int iCompType =Integer.parseInt(hmArray.getString("COMP_TYPE"));
										int iActionType =Integer.parseInt(hmArray.getString("ACTION_TYPE","0"));
										int iTimeSeq =Integer.parseInt(hmArray.getString("TIME_SEQ","0"));
										int iActType =Integer.parseInt(hmArray.getString("ACT_TYPE","0"));
										String sActName =hmArray.getString("ACT_NAME","");
										String sJavaScript =hmArray.getString("JAVASCRIPT","");
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
											if(iActType==3 && sJavaScript.length()>0)//点击调用Javascript
											{
												if(iActionType ==1)//单击
													html.append(" onClick="+sActName);
												else if(iActionType ==3)//双击
													html.append(" ondblclick="+sActName);
												//替换网络虚拟路径
												sJavaScript =StringUtil.replace(sJavaScript, "$WEB_PATH$", GlobalUtil._WEB_PATH);
												//替换主键
												sJavaScript =StringUtil.replace(sJavaScript, "$KEYS$", sbKeys.toString());
												{//替换变量
													//替换request中的变量
													while(sJavaScript.indexOf("$REQUEST-") !=-1)
													{
														String sTmp =sJavaScript.substring(sJavaScript.indexOf("REQUEST-"));
														sTmp =sTmp.substring(0, sTmp.indexOf("$") +1);
														String sKey =sTmp.substring("REQUEST-".length(), sTmp.length() -1);
														String sValue =request.getParameter(sKey) ==null?"":request.getParameter(sKey);
														sJavaScript =StringUtil.replace(sJavaScript,"$REQUEST-"+sKey+"$", sValue);
													}
													//替换session中的变量
													while(sJavaScript.indexOf("$SESSION-") !=-1)
													{
														String sTmp =sJavaScript.substring(sJavaScript.indexOf("SESSION-"));
														sTmp =sTmp.substring(0, sTmp.indexOf("$") +1);
														String sKey =sTmp.substring("SESSION-".length(), sTmp.length() -1);
														String sValue =session.getAttribute(sKey) ==null?"":session.getAttribute(sKey).toString();
														sJavaScript =StringUtil.replace(sJavaScript,"$SESSION-"+sKey+"$", sValue);
													}
													//替换登陆会话中的变量
													while(sJavaScript.indexOf("$LOGIN-") !=-1)
													{
														String sTmp =sJavaScript.substring(sJavaScript.indexOf("LOGIN-"));
														sTmp =sTmp.substring(0, sTmp.indexOf("$") +1);
														String sKey =sTmp.substring("LOGIN-".length(), sTmp.length() -1);
														String sValue ="";
														if(session.getAttribute("user") !=null)
														{
															Identity oUser =(Identity)session.getAttribute("user");
															sValue =oUser.get(sKey) ==null?"":oUser.get(sKey).toString();
														}
														sJavaScript =StringUtil.replace(sJavaScript,"$LOGIN-"+sKey+"$", sValue);
													}
												}
												if(sJavaScript.indexOf("$_Q") !=-1)
												{
													String sParam =sJavaScript.substring(sJavaScript.indexOf("$_Q")+3);
													if(sParam.indexOf("$") !=-1)
													{
														sParam =sParam.substring(0, sParam.indexOf("$"));
													}
													sJavaScript =StringUtil.replace(sJavaScript, "$_Q"+sParam+"$", request.getParameter(sParam)==null?"":request.getParameter(sParam));
												}
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
		}
		else
		{
			%><input type=button class="btnoFirst" name="btSelect" value="选定(S)" onClick="onSelectRow(1)" disabled><input type=button class="btnoFirst" name="btnoSelect" value="不选定(N)" onClick="onSelectRow(0)"></td>
			<%
		}
	%>
   <!--功能元件显示-->
	</div>
   </td>
</tr>
</table>
</div>
<%
//显示页面传过来的隐藏字段，这个功能主要是为了实现跨页传参数
Enumeration en =request.getParameterNames();
while(en.hasMoreElements()){
	String sPara =en.nextElement().toString();
	if(sPara.startsWith("H_"))
	{
		out.println("<input type=hidden name='"+sPara+"' value='"+(request.getParameter(sPara)==null?"":request.getParameter(sPara))+"'>");
	}
}
%>

<%
if(alTableKeys !=null && alTableKeys.size() >0)
   for(int j=0; j<alTableKeys.size(); j++)
   {
      out.println("<input type=hidden name='"+alTableKeys.get(j)+"'>");
   }

//记录此页面的url，以提供给修改、添加完成后的跳转
session.setAttribute("_RETURNPAGE", GlobalUtil._WEB_PATH+"/system/card/CardList.jsp?"+request.getQueryString());
%>
<%
if(hmQuery !=null && hmQuery.size() >0)
{
	Object[] oKeys =hmQuery.keySet().toArray();
	for(int t=0; t<oKeys.length; t++)
	{
		if(!(oKeys[t].toString().equals("_para_currentpage") || oKeys[t].toString().equals("_para_pagesize")))
		{
			%><input type=hidden name="_URL<%=oKeys[t]%>" value="<%=hmQuery.get(oKeys[t])%>">
	<%	}
	}
}
%>
</body>
<script>
//输出普通方法
<%
StringBuffer sbCommonMethod =new StringBuffer();
if(alTopConfig !=null)
{	for(int i=0; i<alTopConfig.size(); i++)
	{
		Row hmTmp =(Row)alTopConfig.get(i);
		if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("86"))
		{//普遍方法 COMP_TYPE=86
			sbCommonMethod.append("function "+hmTmp.get("ACT_NAME")+"\n{");
			sbCommonMethod.append(hmTmp.get("JAVASCRIPT").toString()+"\n");
			sbCommonMethod.append("}");
			break;
		}
	}
}
out.println(sbCommonMethod.toString());
sbCommonMethod.setLength(0);
%>
function onPageLoad()
{
	<%
	String sPageLoad =null;
	if(alTopConfig !=null)
		for(int i=0; i<alTopConfig.size(); i++)
		{
			Row hmTmp =(Row)alTopConfig.get(i);
			if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("99"))
			{//添加按钮的替换事件
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
{//打开页面选择
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
   //try
   {
      var canModify=0;
      var canDelete=0;
      var canInfo=0;
      <%if(bUpdate){%>
			document.all.btUpdate.disabled =true;
      <%}%>
      <%if(bDelete){%>
			document.all.btDel.disabled =true;
      <%}%>
      <%if(bInfo){%>
			document.all.btInfo.disabled =true;
      <%}
		if(bSelect)
		{
			%>
			document.all.btSelect.disabled =true;
			document.all.btInfo.disabled =true;
			<%
		}
      if(alTableKeys !=null && alTableKeys.size() >0 && !bSelect)
		{
         for(int j=0; j<alTableKeys.size(); j++)
         {
				out.println("if(Table.clickRow(document.all.t_"+sCard+") ==null)\n return false;\n");
            out.println("var "+alTableKeys.get(j)
               +" =Table.clickRow(document.all.t_"+sCard+")."+alTableKeys.get(j).toString().toUpperCase()+";\n");
				out.println("if("+alTableKeys.get(j)+" =='' || typeof "+alTableKeys.get(j)+"=='undefined')\n return false;");
				out.println(	"document.all."+alTableKeys.get(j)+".value="+alTableKeys.get(j)+";\n");
            if(bUpdate)
            {
               out.println("if("+alTableKeys.get(j)+" !='' && typeof "+alTableKeys.get(j)+" !='undefined')");
               out.println("  canModify =1;");                  }
            if(bUpdate)
               out.println("else\n canModify =0;\n");
            if(bInfo)
            {
               out.println("   if("+alTableKeys.get(j)+" !='' && typeof "+alTableKeys.get(j)+" !='undefined')\n");
               out.println("  canInfo =1;");
            }
            if(bInfo)
               out.println("else\n canInfo =0;\n");
            if(bDelete)
            {
               out.println("   if("+alTableKeys.get(j)+" !='' && typeof "+alTableKeys.get(j)+" !='undefined')\n");
               out.println("  canDelete =1;");
            }
            if(bDelete)
               out.println("else\n canDelete =0;\n");
         }
      %>
      <%if(bUpdate){%>
         if(canModify ==0)
			{
            document.all.btUpdate.disabled =true;
			}
         else if(canModify ==1)
            document.all.btUpdate.disabled =false;
      <%}%>
      <%if(bDelete){%>
         if(canDelete ==0)
            document.all.btDel.disabled =true;
         else if(canDelete ==1)
            document.all.btDel.disabled =false;
      <%}%>
      <%if(bInfo){%>
         if(canInfo ==0)
            document.all.btInfo.disabled =true;
         else if(canInfo ==1)
            document.all.btInfo.disabled =false;
      <%}
			if(jsRowClickEvent !=null)
			{
				out.println(jsRowClickEvent);
				jsRowClickEvent =null;
			}
		}
		if(bSelect)
		{
			%>
			document.all.btSelect.disabled =false;
			document.all.btInfo.disabled =false;
			<%
		}
		%>
   }
   //catch(e)
	//{
	//}
}
<%
if(bInfo)
{
%>
function onInfo()
{
	var type =0;
   <%
   String src =GlobalUtil._WEB_PATH+"/system/card/CardInfo.jsp";
   if(alTopConfig !=null)
   {
      for(int i=0; i<alTopConfig.size(); i++)
      {
         Row hmTmp =(Row)alTopConfig.get(i);
			//out.println(hmTmp);
         if(hmTmp.get("COMP_TYPE").toString().equals("90"))
         {
				if(hmTmp.get("ACT_TYPE").toString().equals("3"))
				{
					%>
						type =3;
					<%
					String sJavaScript =hmTmp.get("JAVASCRIPT").toString();
					sJavaScript =StringUtil.replace(sJavaScript, "$WEB_PATH$", GlobalUtil._WEB_PATH);
					sJavaScript =StringUtil.replace(sJavaScript, "$KEYS$", sbKeys.toString());
					//替换request中的变量
					while(sJavaScript.indexOf("$REQUEST-") !=-1)
					{
						String sTmp =sJavaScript.substring(sJavaScript.indexOf("REQUEST-"));
						sTmp =sTmp.substring(0, sTmp.indexOf("$") +1);
						String sKey =sTmp.substring("REQUEST-".length(), sTmp.length() -1);
						String sValue =request.getParameter(sKey) ==null?"":request.getParameter(sKey);
						sJavaScript =StringUtil.replace(sJavaScript,"$REQUEST-"+sKey+"$", sValue);
					}
					//替换session中的变量
					while(sJavaScript.indexOf("$SESSION-") !=-1)
					{
						String sTmp =sJavaScript.substring(sJavaScript.indexOf("SESSION-"));
						sTmp =sTmp.substring(0, sTmp.indexOf("$") +1);
						String sKey =sTmp.substring("SESSION-".length(), sTmp.length() -1);
						String sValue =session.getAttribute(sKey) ==null?"":session.getAttribute(sKey).toString();
						sJavaScript =StringUtil.replace(sJavaScript,"$SESSION-"+sKey+"$", sValue);
					}
					//替换登陆会话中的变量
					while(sJavaScript.indexOf("$LOGIN-") !=-1)
					{
						String sTmp =sJavaScript.substring(sJavaScript.indexOf("LOGIN-"));
						sTmp =sTmp.substring(0, sTmp.indexOf("$") +1);
						String sKey =sTmp.substring("LOGIN-".length(), sTmp.length() -1);
						String sValue ="";
						if(session.getAttribute("user") !=null)
						{
							Identity oUser =(Identity)session.getAttribute("user");
							sValue =oUser.get(sKey) ==null?"":oUser.get(sKey).toString();
						}
						sJavaScript =StringUtil.replace(sJavaScript,"$LOGIN-"+sKey+"$", sValue);
					}
					out.println(sJavaScript);
					break;
				}
				else
				{
					src =hmTmp.get("ACT_NAME").toString();
					if(src.toUpperCase().indexOf("HTTP") !=-1)
						src =GlobalUtil._WEB_PATH+src;
					break;
         }
      }
   }
}
   %>
	if(type ==0)
	{
		src ='<%=src%>?card=<%=sCard%>'<%=sbKeys.toString()%>;
		var oLayer =new Layer('<%=sTableCName%>详细信息',src);
		oLayer.show();
	}
}
<%}%>
<%
if(bAdd)
{
%>
function onAdd()
{
	<%
	String sAdd =null;
	if(alTopConfig !=null)
		for(int i=0; i<alTopConfig.size(); i++)
		{
			Row hmTmp =(Row)alTopConfig.get(i);
			if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("89"))
			{//添加按钮的替换事件
				sAdd =hmTmp.get("JAVASCRIPT").toString();
				break;
			}
		}
	if(sAdd !=null)
	{
		sAdd =StringUtil.replace(sAdd, "$WEB_PATH$", GlobalUtil._WEB_PATH);
		sAdd =StringUtil.replace(sAdd, "$KEYS$", sbKeys.toString());
		out.println(sAdd);
	}
	else
	{
	%>
		//
		var withUpload =0;
		<%if(hasBlobField){%>
			src ='<%=GlobalUtil._WEB_PATH%>/system/card/CardEditWithUpload.jsp?card=<%=sCard%>&operate=1';
		<%}
		else{%>
			src ='<%=GlobalUtil._WEB_PATH%>/system/card/CardEdit.jsp?card=<%=sCard%>&operate=1';
		<%}%>
		<%
		if(hmQuery !=null && hmQuery.size() >0)
		{
			Object[] oKeys =hmQuery.keySet().toArray();
			for(int t=0; t<oKeys.length; t++)
			{
				%>src +="&<%=oKeys[t]%>=<%=hmQuery.get(oKeys[t])%>";
			<%}
		}
		%>
		document.location.href=src;
		/*
		var features ="dialogHeight = 528px; dialogWidth = 600px; help: no; status: no;";//Modal Dialog 
		var ret=window.showModalDialog(src+"&all=1",window, features)
		//var ret =runCardOpen(src+"&all=1", true, 600, 528);
		if(ret !="" && typeof ret !='undefined')
		{
			if(ret =='1')
				return;
		}
		document.formpage.submit();
		*/
	<%}%>
}
<%}%>
<%
if(bUpdate)
{
%>
function onUpdate()
{
	<%
	String sAdd =null;
	if(alTopConfig !=null)
		for(int i=0; i<alTopConfig.size(); i++)
		{
			Row hmTmp =(Row)alTopConfig.get(i);
			if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("91"))
			{//修改按钮的替换事件
				sAdd =hmTmp.get("JAVASCRIPT").toString();
				break;
			}
		}
	if(sAdd !=null)
	{
		sAdd =StringUtil.replace(sAdd, "$WEB_PATH$", GlobalUtil._WEB_PATH);
		sAdd =StringUtil.replace(sAdd, "$KEYS$", sbKeys.toString());
		out.println(sAdd);
	}
	else
	{
	%>
		<%
		if(hasBlobField){%>
			src ='<%=GlobalUtil._WEB_PATH%>/system/card/CardEditWithUpload.jsp?card=<%=sCard%>&operate=2'
					+<%=sbKeys.toString()%>;
		<%}
		else{%>
		src ='<%=GlobalUtil._WEB_PATH%>/system/card/CardEdit.jsp?card=<%=sCard%>&operate=2'<%=sbKeys.toString()%>;
		<%}%>
		<%
		if(hmQuery !=null && hmQuery.size() >0)
		{
			Object[] oKeys =hmQuery.keySet().toArray();
			for(int t=0; t<oKeys.length; t++)
			{
				%>src +="&<%=oKeys[t]%>=<%=hmQuery.get(oKeys[t])%>";
			<%}
		}
		%>
		document.location.href=src+"&all=1";
		/*
		var features ="dialogHeight = 528px; dialogWidth = 600px; help: no; status: no;";//Modal Dialog 
		var ret=window.showModalDialog(src+"&all=1",window, features)
			//var a =runCardOpen(src, true, 600, 528);
		if(ret !="" && typeof ret !='undefined')
		{
			if(ret =='1')
				return;
		}
		document.formpage.submit();
		*/
	<%}%>
}
<%}%>
<%
if(bDelete)
{
%>
function onDel()
{
	$E.disabled();
	//调用Ajax删除数据
	var s=new Server("saveCardData");
	s.setParamValue("default", "card", "<%=sCard%>");
	s.setParamValue("default", "operate", "3");//删除
	<%
	String sDel =null;
	String sbAjaxHtml ="";
	String sTimeSeq =null;
	if(alTopConfig !=null)
		for(int i=0; i<alTopConfig.size(); i++)
		{
			Row hmTmp =(Row)alTopConfig.get(i);
			sTimeSeq =hmTmp.getString("TIME_SEQ");
			if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("92"))
			{//删除按钮的替换事件
				sDel =hmTmp.get("JAVASCRIPT").toString();
				break;
			}
		}
	if(sDel !=null && sTimeSeq !=null && sTimeSeq.equals("2"))
	{
		sDel =StringUtil.replace(sDel, "$WEB_PATH$", GlobalUtil._WEB_PATH);
		sDel =StringUtil.replace(sDel, "$KEYS$", sbKeys.toString());
		out.println(sDel);
	}
	else
	{
		if(sDel !=null)
			out.println(sDel+"\n");
		sbTmp.setLength(0);;
		if(alTableKeys !=null && alTableKeys.size() >0)
			for(int j=0; j<alTableKeys.size(); j++)
			{
				out.println("if(document.all."+alTableKeys.get(j)+".value =='')\n{\n");
				out.println("message('请选择一条记录');\n return false;\n");
				out.println("}\n");
				sbAjaxHtml +=" s.setParamValue(\"default\", \""+alTableKeys.get(j)+"\", document.all."+alTableKeys.get(j)+".value);\n";
				//sbTmp.append("+'&"+alTableKeys.get(j)+"='+document.all."+alTableKeys.get(j)+".value");
				
			}
		%>
		if(confirm("此操作将从数据库删除此记录，请谨慎操作，确认删除？"))
		{
			//src ='<%=GlobalUtil._WEB_PATH%>/system/card/carddel.jsp?card=<%=sCard%>&operate=3'<%=sbTmp.toString()%>;
			//alert(src);
			//window.parent.hiddenFrame.location =src;
			<%=sbAjaxHtml%>
			//	alert(s.getXml());
			s.send(s, false, function(){
					alert("保存成功！");
					formpage.submit();
				}
			);
		}
	<%}%>
	//恢复元件状态
	$E.abled();
}
<%}%>
<%
if(bBatchDelete)
{
%>
function onBatchDel()
{
	disnabledAllElement();
	<%
	String sBatchDel =null;
	if(alTopConfig !=null)
		for(int i=0; i<alTopConfig.size(); i++)
		{
			Row hmTmp =(Row)alTopConfig.get(i);
			if(hmTmp.get("COMP_TYPE") !=null && hmTmp.get("COMP_TYPE").toString().equals("85"))
			{//删除按钮的替换事件
				sBatchDel =hmTmp.get("JAVASCRIPT").toString();
				break;
			}
		}
	if(sBatchDel !=null)
	{
		sBatchDel =StringUtil.replace(sBatchDel, "$WEB_PATH$", GlobalUtil._WEB_PATH);
		sBatchDel =StringUtil.replace(sBatchDel, "$KEYS$", sbKeys.toString());
		out.println(sBatchDel);
	}
	else
	{
		sbTmp.setLength(0);;
		%>
		if(confirm("此操作将从数据库删除选中记录，请谨慎操作，确认删除？"))
		{
			var batchDels =document.getElementsByName("<%=sCard%>_rowCheckBox");
			<%
			for(int j=0; j<alTableKeys.size(); j++)
			{
				out.println("var "+alTableKeys.get(j)+"='';\n");
			}
			%>
			if(batchDels.length >0)
			{
				for(i=0; i<batchDels.length; i++)
				{
					if(!batchDels[i].checked)
						continue;
					delValue =batchDels[i].value;
					var arDelValue =delValue.split(";");
					for(ii=0; ii<arDelValue.length; ii++)
					{
						var arKeyValue =arDelValue[ii].split("=");
						<%
						for(int i=0; i<alTableKeys.size(); i++)
						{
							//out.println(alTableKeys.get(j)+"='';\n");
							out.print("if('"+alTableKeys.get(i)+"' ==arKeyValue[0])\n");
							out.print("if("+alTableKeys.get(i)+"=='')\n{\n");
							out.print(alTableKeys.get(i) +"=arKeyValue[1];\n");
							out.print("}\n");
							out.print("else\n{\n");
							out.print(alTableKeys.get(i) +"+=','+arKeyValue[1];\n");
							out.print("}\n");
						}
						%>
					}
				}
				var params ="";
				<%
				for(int j=0; j<alTableKeys.size(); j++)
				{
					out.print("params +='&"+alTableKeys.get(j)+"='+"+alTableKeys.get(j)+";");
				}
				%>
				src ='<%=GlobalUtil._WEB_PATH%>/system/card/CardBatchDel.jsp?card=<%=sCard%>&operate=4'+params;
				window.parent.hiddenFrame.location =src;
			}
		}
		else
			return false;
	<%}%>
}
<%}%>
function onSort(field_ename)
{
	var orderField =document.formpage.orderfield.value;
	var orderType =document.formpage.ordertype.value;
	if(orderField ==field_ename)
	{
		if(orderType =='' || orderType =='desc')
			orderType ="asc";
		else
			orderType ="desc";
	}
	else
	{
		orderField =field_ename;
		orderType ='desc';
	}
	document.formpage.orderfield.value =orderField;
	document.formpage.ordertype.value =orderType;
	document.formpage.submit();
}
function onSelectRow(type)
{
	var sReturn = new Array();
	if(type ==1)
	{
		var colmns =document.all.t_<%=sCard%>.rows[0].cells.length;
		var sTmp="";
		for(i=0; i<colmns; i++)
		{
			if(sTmp=="")
				sTmp =document.all.t_<%=sCard%>.rows[0].cells[i].innerText;
			else
				sTmp +="$"+document.all.t_<%=sCard%>.rows[0].cells[i].innerText;
		}
		sReturn[0] =sTmp;
		sTmp ="";
		var sValue ="";
		for(j=0; j<colmns; j++)
		{
			if(sTmp=="")
				sTmp =getTableSingleSelected(document.all.t_<%=sCard%>).cells[j].innerText;
			else
				sTmp +="$"+getTableSingleSelected(document.all.t_<%=sCard%>).cells[j].innerText;
		}
		sValue =getTableSingleSelected(document.all.t_<%=sCard%>).cells[0].innerText;
		sReturn[1] =sTmp;
		sReturn[2] =sValue;
	}
	window.returnValue =sReturn;
	window.close();
}
function onCheckBatch(checkHandle)
{
	checkall("<%=sCard%>_rowCheckBox", checkHandle.checked);
	if(checkHandle.checked)
	{
		if(document.getElementsByName("btBatchDel").length >0)
			document.getElementsByName("btBatchDel")[0].disabled =false;
	}
	else
	{
		if(document.getElementsByName("btBatchDel").length >0)
			document.getElementsByName("btBatchDel")[0].disabled =true;
	}
}
function onCheckBoxRow(checkHandle)
{
	if(checkHandle.checked)
	{
		if(document.getElementsByName("btBatchDel").length >0)
			document.getElementsByName("btBatchDel")[0].disabled =false;
	}
	else
	{
		for(i=0; i<document.getElementsByName(checkHandle.name).length; i++)
		{
			if(document.getElementsByName(checkHandle.name)[i].checked)
			{
				document.getElementsByName("btBatchDel")[0].disabled =false;
				return;
			}
		}
		document.getElementsByName("btBatchDel")[0].disabled =true;
	}
}
<%if(jsRowDbClickEvent !=null && jsRowDbClickEvent.trim().length() >0){%>t_<%=sCard%>.ondblclick=function(){<%=jsRowDbClickEvent%>};<%}%>
</script>
<%
if(alTopConfig !=null)
{
	alTopConfig.clear();
	alTopConfig =null;
}
sbKeys =null;
%>