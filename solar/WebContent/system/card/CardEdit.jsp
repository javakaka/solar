<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.juts.utility.*,com.juts.web.utility.ServletUtil,com.juts.framework.vo.*,com.juts.web.status.*,com.juts.framework.engine.*,com.juts.framework.data.DataAccess"%>
<%@ include file="/include/Head.jsp"%>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Datetime.js"></script>
<base target="_self">
<%
   int iOperate =Integer.parseInt(ServletUtil.get(request, "operate", "0"));
	int iHtmlEditNums =0; //由于html edit的特殊性，用此变量记录页面中html edit的数量
%>
<body onLoad="onBodyLoad()">
<form name="cardedit" method="post">
   <%
	DataSet alHasPrintPonent =new DataSet();//记录网页显式输出控件
	boolean bHasWordEditor =false; //是否有word控件
	boolean bHasExcelEditor =false;//是否有Excel控件

   String sCard =request.getParameter("card")==null?"":request.getParameter("card");
   String sColor =ServletUtil._DEFAULT_TABLE_STYLE;
   Identity oUser =(Identity)pageContext.getSession().getAttribute("user");
   if(oUser.get("table-style") !=null 
         && !oUser.get("table-style").toString().equals(""))
      sColor =oUser.get("table-style").toString();
   %>
   <$:G title="编辑信息[后面带<font color=red>*</font>为必填项]">
<!--    <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 450px"> 
 -->   <table cellpadding="2" cellspacing="1" class="table_c" width="100%">
   <%
      Row hmData =null;
      Enumeration en =request.getParameterNames();
      while(en.hasMoreElements()){
         if(hmData ==null) hmData =new Row();
         Object oPara =en.nextElement();
         hmData.put(oPara, request.getParameter(oPara.toString()));
      }
   %>
      <$:A service="getTableView" dynamic="false" condition="<%=hmData%>"/>
      <$:M dtype="1"/>
      <%
      if(ServletUtil.getResult(request,"FIELDSINFO") !=null)
      {
         int iRowTmp =0;
         int iColTmp =0;
			int iAllCols =0;
         DataSet alData =(DataSet)ServletUtil.getResult(request,"FIELDSINFO");
         if(alData !=null && alData.size() >0)
         {
			 //获取总列数
            for(int i=0; i<alData.size(); i++)
            {
               Row hmTmp =(Row)alData.get(i);
               int iRow =Integer.parseInt(hmTmp.get("IROW").toString());
					if(iRow ==1)
					{//得到总列数，用以计算td的width
						int iColspan =Integer.parseInt(hmTmp.get("COLSPAN").toString());
						iAllCols +=iColspan;
					}
				}
            for(int i=0; i<alData.size(); i++)
            {
               Row hmTmp =(Row)alData.get(i);
               int iRow =Integer.parseInt(hmTmp.get("IROW").toString());
               int iCol =Integer.parseInt(hmTmp.get("ICOLUMN").toString());
               int iRowspan =Integer.parseInt(hmTmp.get("ROWSPAN").toString());
               int iColspan =Integer.parseInt(hmTmp.get("COLSPAN").toString());
               String sStyleId =hmTmp.get("STYLE_ID").toString();
               String sFieldCname =hmTmp.get("FIELD_CNAME").toString();
					String sRemind =hmTmp.get("REMIND")==null?"":hmTmp.get("REMIND").toString();
               String sFieldEname =hmTmp.get("FIELD_ENAME").toString();
//					out.println(sFieldEname);
               String sFieldValue =hmTmp.get("FIELD_VALUE")==null?"":hmTmp.get("FIELD_VALUE").toString();
               String sFieldValueTmp =hmTmp.get("FIELD_VALUE_TMP")==null?sFieldValue:hmTmp.get("FIELD_VALUE_TMP").toString();

               String sDefaultValue =hmTmp.get("DEFAULT_VALUE")==null?"":hmTmp.get("DEFAULT_VALUE").toString();
               if(iOperate ==1 && !sDefaultValue.equals("")
                  && (sFieldValue.equals("") || sFieldValueTmp.equals("")))
               {
						if(sDefaultValue.toUpperCase().equals("SYSDATE"))
						{
							if(sStyleId.equals("004001"))//选择日期
								sDefaultValue =DateUtil.toString(new java.util.Date(), "yyyy-MM-dd");
							else// if(sStyleId.equals("004002"))//选择日期时间
								sDefaultValue =DateUtil.toString(new java.util.Date(), "yyyy-MM-dd HH:mm:ss");
	                  sFieldValueTmp =sDefaultValue;
						}
						else if(sDefaultValue.toUpperCase().equals("SITE-NO"))
						{
								sDefaultValue =oUser.get("site-no").toString();
								sFieldValueTmp =oUser.get("site-name").toString();
						}
						else if(sDefaultValue.toUpperCase().equals("STAFF-NAME"))
						{
								sDefaultValue =oUser.get("real-name").toString();
								sFieldValueTmp =sDefaultValue;
						}
						else if(sDefaultValue.toUpperCase().equals("STAFF-NO"))
						{
								sDefaultValue =oUser.get("staff-no").toString();
								sFieldValueTmp =oUser.get("real-name").toString();
						}
                  sFieldValue =sDefaultValue;
               }
					int iIsNull =Integer.parseInt(hmTmp.get("IS_NULL")==null?"0":hmTmp.get("IS_NULL").toString());
               long iFieldType =Long.parseLong(hmTmp.get("FIELD_TYPE").toString());
               int iFieldLength =0;
               String sProps ="desc='"+sFieldCname+"'";
               if(iFieldType ==1 || iFieldType ==3)
                  sProps +=" datatype='number'";
               else
                  sProps +=" datatype='string'";

               if(hmTmp.get("FIELD_LENGTH") !=null)
               {
                  iFieldLength =Integer.parseInt(hmTmp.get("FIELD_LENGTH").toString());
                  
                  if(iFieldType ==1)//iFieldType ==3
                  {
                     String sTmp ="";
                     for(int k=0; k<iFieldLength; k++)
                        sTmp +="9";
                     if(!sTmp.equals(""))
                        iFieldLength =Integer.parseInt(sTmp);
                  }
               }

               boolean bIsNotNull = iIsNull==1?true:false;
               if(bIsNotNull)
                  sProps +="  notnull ";
               if(iFieldLength !=0 && iFieldType !=3)
                  sProps +=" max='"+iFieldLength+"'";

               if(iRowTmp != iRow)
               {
                  if(iRowTmp !=0)
                     out.println("</TR>");
                  out.println("<TR class=tr_c>");
                  iRowTmp =iRow;   
               }
               out.println("<TD width=1% nowrap class='td_c' align=right rowspan="+iRowspan+" valign=top>");
					if(sRemind.length() >0)
						out.println("<font color='#990066'><label style='cursor:help' title='提示:\n"+sRemind+"'>⊙提示</font>");
					out.println("<b>"+sFieldCname);
               if(bIsNotNull)
                  out.println("<font color='red'>*</font>");
               out.println("</b>:");
					//out.println("<br>");
					out.println("</td>");
					out.println("<td valign=top rowspan="+iRowspan+" colspan="
                  +(iColspan*2-1));
					if(iAllCols !=0)
					{
						out.println(" width='"+(iColspan*100/iAllCols)+"%' ");
					}
					out.println(">");

					if(sFieldValue.equals("") && iOperate ==1 && request.getParameter(sFieldEname) !=null)
					{
						//sFieldValue =StringUtil.isoToGBK(request.getParameter(sFieldEname));
						sFieldValue =request.getParameter(sFieldEname);
						sFieldValueTmp =request.getParameter(sFieldEname+"_TMP");
						//StringUtil.isoToGBK(request.getParameter(sFieldEname+"_TMP"));
						//记录输出元素
						alHasPrintPonent.add(sFieldEname);
						alHasPrintPonent.add(sFieldEname+"_TMP");
					}
               if(sStyleId.equals("001001"))//登录人IP
               {
                  if(iOperate ==2)//修改数据
                     out.println("<input type=text name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                  else
                     out.println("<input type=text name='"+sFieldEname+"' value='"+oUser.get("ip-address")+"'>");
               }
               else if(sStyleId.equals("001002"))//登录人部门
               {
                  if(iOperate ==2){//修改数据
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'>");
                  }
                  else
                  {
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+oUser.get("site-no")+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+oUser.get("site-name")+"' readonly class='disabled'>");
                  }
               }
               else if(sStyleId.equals("001003"))//登录人岗位
               {
                  if(iOperate ==2){//修改数据
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'>");
                  }
                  else
                  {
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+oUser.get("posi-no")+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+oUser.get("posi-name")+"' readonly class='disabled'>");
                  }
               }
               else if(sStyleId.equals("001004"))//登录人姓名
               {
                  if(iOperate ==2){//修改数据
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'>");
                  }
                  else
                  {
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+oUser.get("staff-no")+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+oUser.get("real-name")+"' readonly class='disabled'>");
                  }
               }
               else if(sStyleId.equals("001005"))//登录人员工编号
               {
                  if(iOperate ==2){//修改数据
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'>");
                  }
                  else
                  {
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+oUser.get("staff-no")+"'>");
                     out.println("<input type=text name='"+sFieldEname+"_TMP' value='"+oUser.get("real-name")+"' readonly class='disabled'>");
                  }
               }
               else if(sStyleId.equals("002001"))//标准输入Text
               {
                  if(iOperate ==2)//修改数据
                     out.println("<input type=text style=\"width:100%\" name='"+sFieldEname+"' value='"+sFieldValue+"' "+sProps+">");
                  else
                     out.println("<input type=text style=\"width:100%\" name='"+sFieldEname+"' "+sProps+" value='"+sFieldValue+"'>");
               }
               else if(sStyleId.equals("002002"))//密码输入
               {
                  if(iOperate ==2)//修改数据
                     out.println("<input type=password style=\"width:100%\" name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                  else 
                     out.println("<input type=password style=\"width:100%\" name='"+sFieldEname+"' value='"+sFieldValue+"'>");
               }
               else if(sStyleId.equals("002003"))//隐藏字段
                  out.println("");
               else if(sStyleId.equals("002004"))//标准输入TextArea
               {
                  if(iOperate ==2)//修改数据
                     out.println("<textarea name=\""+sFieldEname+"\" style=\"width:100%\" rows=5 "+sProps+">"+sFieldValue+"</textarea>");
                  else 
                     out.println("<textarea name=\""+sFieldEname+"\" style=\"width:100%\" rows=5 "+sProps+">"+sFieldValue+"</textarea>");
               }
               else if(sStyleId.equals("002006"))//标准输入(TextArea)[html编辑]
					{
						iHtmlEditNums ++;
						%>
							<input type=hidden name="<%=sFieldEname%>" value='<%=sFieldValue%>'>
							<input type=hidden name="htmledit" value="<%=sFieldEname%>">
							<IFRAME id="eWebEditor<%=iHtmlEditNums%>" src="<%=GlobalUtil._WEB_PATH%>/portal/webedit/EWebEditor.jsp?id=<%=sFieldEname%>&style=standard&mode=faq" frameborder="0" scrolling="no" width="100%" height="350"></IFRAME>
						<%
					}
               else if(sStyleId.equals("002007"))//word控件绑定
					{
						bHasWordEditor =true;
						if(iOperate ==1)
						{//添加:得到系统的模板列表
							String sRecordId =DataAccess.getSequence("DOCUMENT.RECORDID");
							String sProp ="onChange=onEditOffice(this,'"+sRecordId+"','.doc')";
							%>
							<input type=hidden name="<%=sFieldEname%>" value="<%=sRecordId%>">
							<$:A service="getOfficeTemplates">
								<$:P name="table_ename" value="<%=sCard%>"/>
								<$:P name="field_ename" value="<%=sFieldEname%>"/>
							</$:A>
							<zz:Error dtype="1"/> 
							套用模板<zz:Select name="template" rs="Template" valueField="TEMPLATEID" textField="FILENAME" firstText="请选择..." props="<%=sProp%>"/>
							<IFRAME id="eWordEditor" src="<%=GlobalUtil._WEB_PATH%>/officeedit/DocumentEdit.jsp?Template=&RecordID=<%=sRecordId%>&FileType=.doc" frameborder="0" scrolling="no" width="100%" height="550"></IFRAME>
							<%
						}
						else
						{//修改数据
							String sRecordId =sFieldValue;
							%>
							<input type=hidden name="<%=sFieldEname%>" value="<%=sRecordId%>">
							<IFRAME id="eWordEditor" src="<%=GlobalUtil._WEB_PATH%>/officeedit/DocumentEdit.jsp?Template=&RecordID=<%=sRecordId%>&FileType=.doc" frameborder="0" scrolling="no" width="100%" height="550"></IFRAME>
							<%
						}
					}
               else if(sStyleId.equals("002008"))//Excel控件绑定
					{
						bHasExcelEditor =true;
						if(iOperate ==1)
						{//添加:得到系统的模板列表
							String sRecordId =DataAccess.getSequence("DOCUMENT.RECORDID");
							String sProp ="onChange=onEditOffice(this,'"+sRecordId+"','.xls')";
							%>
							<input type=hidden name="<%=sFieldEname%>" value="<%=sRecordId%>">
							<$:A service="getOfficeTemplates">
								<$:P name="table_ename" value="<%=sCard%>"/>
								<$:P name="field_ename" value="<%=sFieldEname%>"/>
							</$:A>
							<zz:Error dtype="1"/> 
							套用模板<zz:Select name="template" rs="Template" valueField="RECORDID" textField="FILENAME" firstText="请选择..." props="<%=sProp%>"/>
							<IFRAME id="eExcelEditor" src="<%=GlobalUtil._WEB_PATH%>/officeedit/DocumentEdit.jsp?Template=&RecordID=<%=sRecordId%>&FileType=.xls" frameborder="0" scrolling="no" width="100%" height="550"></IFRAME>
							<%
						}
						else
						{//修改数据
							String sRecordId =sFieldValue;
							%>
							<input type=hidden name="<%=sFieldEname%>" value="<%=sRecordId%>">
							<IFRAME id="eExcelEditor" src="<%=GlobalUtil._WEB_PATH%>/officeedit/DocumentEdit.jsp?Template=&RecordID=<%=sRecordId%>&FileType=.doc" frameborder="0" scrolling="no" width="100%" height="550"></IFRAME>
							<%
						}
					}
               else if(sStyleId.startsWith("003"))//编号类
               {
                  if(iOperate ==2)//修改数据
                  {
                     out.println("["+sFieldValue+"]");
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                  }
                  out.println("<FONT COLOR=red>系统自动生成</FONT>");
               }
               else if(sStyleId.equals("004001"))//选择日期
               {
                  out.println("<input type=text size=10 readonly class='disabled' name='"+sFieldEname+"' value='"+sFieldValue+"' "+sProps+" onClick='setDay(this)'>");
               }
               else if(sStyleId.equals("004002"))//选择日期时间
               {
                  out.println("<input type=text size=20 readonly class='disabled' name='"+sFieldEname+"' value='"+sFieldValue+"' "+sProps+">");
               }
               else if(sStyleId.equals("005001"))//单项选择
                  out.println("");
               else if(sStyleId.equals("005002"))//单项选择(radio)
					{
						Row hmDataTmp =hmDataTmp =new Row();
						Enumeration enTmp =request.getParameterNames();
						while(enTmp.hasMoreElements())
						{
							String sPara =enTmp.nextElement().toString();
							//剔除分页的数据
							if(!sPara.toUpperCase().equals(ServletUtil._SOFT_TAG.toUpperCase()+"PAGESIZE")
									&& !sPara.toUpperCase().equals("ORDERTYPE")
									&& !sPara.toUpperCase().equals("ORDERFIELD")
									&& !sPara.toUpperCase().equals("SUMROW")
									&& !sPara.toUpperCase().equals(ServletUtil._SOFT_TAG.toUpperCase()+"CURRENTPAGE"))
							{
								hmDataTmp.put(sPara, request.getParameter(sPara));
							}
						}
						%><$:A service="getSourceData" dynamic="false" condition="<%=hmDataTmp%>" exclude="1">
                     <$:P name="table_ename" value="<%=sCard%>"/>
                     <$:P name="field_ename" value="<%=sFieldEname%>"/>
                  </$:A>
                  <$:M dtype="1"/>
						<%
						if(ServletUtil.getResult(request,"SOURCE_DATA") !=null)
						{
							DataSet alSourceData =(DataSet)ServletUtil.getResult(request,"SOURCE_DATA");
							for(int a=0; a<alSourceData.size(); a++)
							{
								Row hmTmpa =(Row)alSourceData.get(a);
								out.println("<input type=radio id='"+sFieldEname+hmTmpa.get("VALUE")+"' name='"+sFieldEname+"' class='radio' value='"+hmTmpa.get("VALUE")+"'><label style='cursor:hand' for='"+sFieldEname+hmTmpa.get("VALUE")+"'>"+hmTmpa.get("TEXT")+"</label>");
							}
							alSourceData.clear();
							alSourceData =null;

							%>
							<script language="javascript">
								if(document.all.<%=sFieldEname%>.length >0)
								{
									for(i=0; i<document.all.<%=sFieldEname%>.length; i++)
									{
										if(document.all.<%=sFieldEname%>[i].value=='<%=sFieldValue%>')
											document.all.<%=sFieldEname%>[i].checked  =true;
									}
								}
								else
								{
									if(document.all.<%=sFieldEname%>.value=='<%=sFieldValue%>')
											document.all.<%=sFieldEname%>.checked  =true;
								}
							</script>
							<%
						}
					}
               else if(sStyleId.equals("005003"))//多项选择
					{%>
                  <$:A service="getSourceData" dynamic="false">
                     <$:P name="table_ename" value="<%=sCard%>"/>
                     <$:P name="field_ename" value="<%=sFieldEname%>"/>
                  </$:A>
                  <$:M dtype="1"/>
						<%
						if(ServletUtil.getResult(request,"SOURCE_DATA") !=null)
						{
							DataSet alSourceData =(DataSet)ServletUtil.getResult(request,"SOURCE_DATA");
							for(int a=0; a<alSourceData.size(); a++)
							{
								Row hmTmpa =(Row)alSourceData.get(a);
								out.println("<input type=checkbox id='"+sFieldEname+hmTmpa.get("VALUE")+"' name='"+sFieldEname+"' class='radio' value='"+hmTmpa.get("VALUE")+"'><label style='cursor:hand' for='"+sFieldEname+hmTmpa.get("VALUE")+"'>"+hmTmpa.get("TEXT")+"</label>");
							}
							alSourceData.clear();
							alSourceData =null;
							%>
							<script language="javascript">
								if(document.all.<%=sFieldEname%>.length >0)
								{
									for(i=0; i<document.all.<%=sFieldEname%>.length; i++)
									{
										if(document.all.<%=sFieldEname%>[i].value=='<%=sFieldValue%>')
											document.all.<%=sFieldEname%>[i].checked  =true;
									}
								}
								else
								{
									if(document.all.<%=sFieldEname%>.value=='<%=sFieldValue%>')
											document.all.<%=sFieldEname%>.checked  =true;
								}
							</script>
							<%
						}
					}
               else if(sStyleId.equals("005004"))//数据下拉
               {
						sProps +="style='width=100%'";
						Row hmDataTmp =null;
						Enumeration enTmp =request.getParameterNames();
						while(enTmp.hasMoreElements()){
							if(hmDataTmp ==null) hmDataTmp =new Row();
							String sPara =enTmp.nextElement().toString();
							//剔除分页的数据
							if(!sPara.toUpperCase().equals(ServletUtil._SOFT_TAG.toUpperCase()+"PAGESIZE")
									&& !sPara.toUpperCase().equals("ORDERTYPE")
									&& !sPara.toUpperCase().equals("ORDERFIELD")
									&& !sPara.toUpperCase().equals("SUMROW")
									&& !sPara.toUpperCase().equals(ServletUtil._SOFT_TAG.toUpperCase()+"CURRENTPAGE"))
							{
								hmDataTmp.put(sPara, request.getParameter(sPara));
							}
						}
						%><$:A service="getSourceData" dynamic="false" condition="<%=hmDataTmp%>" exclude="1">
							<$:P name="table_ename" value="<%=sCard%>"/>
                     <$:P name="field_ename" value="<%=sFieldEname%>"/>
                  </$:A>
                  <$:M dtype="1"/>
                  <$:L name="<%=sFieldEname%>" rs="SOURCE_DATA" valueField="VALUE" 	textField="TEXT" firstText="请选择..." props="<%=sProps%>"/>
               <%
                  request.removeAttribute(ServletUtil._SOFT_TAG+"SOURCE_DATA");
                  if(iOperate ==2)
                  {
                     %>
                     <script>
                        document.all.<%=sFieldEname%>.value='<%=sFieldValue%>';   
                     </script>
                     <%
                  }
                  else if(!sFieldValue.equals(""))
                  {
                     %>
                     <script>
                        document.all.<%=sFieldEname%>.value='<%=sFieldValue%>';   
                     </script>
                     <%
                  }
               }
               else if(sStyleId.equals("005005"))//打开页面选择
               {
                  %>
						<$:A service="getSourceData" dynamic="false">
                     <$:P name="table_ename" value="<%=sCard%>"/>
                     <$:P name="field_ename" value="<%=sFieldEname%>"/>
                  </$:A>
                  <zz:Error dtype="1"/>
						<%
						String sUrl =null;
						if(ServletUtil.getResult(request,"DATA") !=null)
						{
							DataSet alSourceData =(DataSet)ServletUtil.getResult(request,"DATA");
							Row hmSource =(Row)alSourceData.get(0);
							sUrl =hmSource.get("OPEN_PAGE_URL")==null?null:hmSource.get("OPEN_PAGE_URL").toString();
							if(sUrl !=null)
							{
								sUrl =StringUtil.replace(sUrl, "$WEB_PATH$", GlobalUtil._WEB_PATH);
							}
						}
						out.println("<input type=text readonly class='disabled' name='_txt"+sFieldEname+"' value='"+sFieldValueTmp+"'>");
						out.println("<input type=hidden class='disabled' name='"+sFieldEname+"' value='"+sFieldValue+"'>");
						if(sUrl !=null)
						{
							/*
							打开页面选择返回任意多的数据，然后通过表格来显示数据
							out.println("<input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectPage(document.all."+sFieldEname+",\""+sUrl+"\",\"tb_"+sFieldEname+"\"); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
							out.println("<table border=1 width=98% align=center id='tb_"+sFieldEname+"'></table>");
							*/
							out.println("<input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectPageThin(document.all._txt"+sFieldEname+",\""+sUrl+"\",document.all."+sFieldEname+"); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
						}
					}
               else if(sStyleId.equals("006001"))
               {//选人(单选)
                     if(sFieldValueTmp.equals("staff-no"))
							{
								sFieldValueTmp =(String)oUser.get("REAL-NAME");
								sFieldValue =(String)oUser.get("STAFF-NO");
							}
							out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
							if(sFieldValueTmp.length() ==0)
								sFieldValueTmp ="点击选择......";
                     out.println("<input type=text style=\"width:80%\" name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled' onClick='onSelectStaff(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP); return false;' style='cursor=hand'>");
							//out.println("<input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectStaff(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
               }
               else if(sStyleId.equals("006002"))
               {//选人(多选)
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text style=\"width:90%\" name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'><input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectStaff(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP,1); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
               }
               else if(sStyleId.equals("006003"))
               {//选部门(单选)
							if(sFieldValueTmp ==null)
								sFieldValueTmp ="";
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text style=\"width:90%\" name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'><input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectSite(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
               }
               else if(sStyleId.equals("006004"))
               {//选部门(多选)
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text style=\"width:90%\" name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'><input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectSite(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP,1); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
               }
               else if(sStyleId.equals("006005"))
               {//混选
						%>
							<textarea name="<%=sFieldEname%>text" readonly class='disabled' style="width:90%" rows=5 <%=sProps%>><%=sFieldValueTmp%></textarea>
							<input type='image' SRC='<%=GlobalUtil._WEB_PATH%>/images/select.gif' onClick='onSelectOrg(this,"<%=sFieldEname%>text","<%=sFieldEname%>"); return false;' style='cursor=hand' name='<%=sFieldEname%>IMG'>
							<input type=hidden name="<%=sFieldEname%>" value="<%=sFieldValue%>">
						<%
					}
               else if(sStyleId.equals("006007"))
               {//选岗位(单选)
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text style=\"width:90%\" name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'><input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectPosition(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
               }
               else if(sStyleId.equals("006008"))
               {//选岗位(多选)
                     out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>");
                     out.println("<input type=text style=\"width:90%\" name='"+sFieldEname+"_TMP' value='"+sFieldValueTmp+"' readonly class='disabled'><input type='image' SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectPosition(document.all."+sFieldEname+",document.all."+sFieldEname+"_TMP,1); return false;' style='cursor=hand' name='"+sFieldEname+"IMG'>");
               }
					else if(sStyleId.equals("002009"))
					{//只读控件
						out.println("<input type=hidden name='"+sFieldEname+"' value='"+sFieldValue+"'>"+sFieldValue);
					}
					//输出界面提示
					//if(sRemind.length() >0)
					//	out.println("<font color='#990066'>["+sRemind+"]</font>");
               out.println("</TD>");
				}
            out.println("</TR>");
         }
      }
      %>
   </table>
<!--    </div>
 -->   </$:G>
   <table width=100%>
   <tr><td>
   	<div align=right width="580">
		<input type="reset" id="btReset" value=<$:I item="html.button.reset"/>  class="btfirst"><input type="button" class="btnofirst" id="btSave" value=<$:I item="html.button.save"/>  onClick="onEdit(this.form)" name="btEdit"><!-- <%if(iOperate ==1){%><input type="button" class="btnofirst" value=<$:I item="html.button.addagain"/>  onClick="onAddAgain(form)"><%}%> --><%if(request.getParameter("popup")==null){%><!-- <input type="button" class="btnofirst" value=<$:I item="html.button.closerefresh"/> onclick="document.location.href='<%=GlobalUtil._WEB_PATH%>/system/card/cardlist.jsp?<%=session.getAttribute("_PAGEURLPARA")%>';" name="btRClose"><input type="button" value=<$:I item="html.button.close"/> class="btnofirst" onclick="history.go(-1);" name="btClose"> -->
		<%}
		else
		{
			%><input type="button" value=<$:I item="html.button.close"/> class="btnofirst" onclick="window.close();" name="btClose"><%
		}%>
<!--得到表高级设置-->
<$:A service="getCardTopConfig" dynamic="true">
	<$:P name="card" value="<%=sCard%>"/>
</$:A>
<zz:Error dtype="1"/>
<%
DataSet alTopConfig =null;
if(ServletUtil.getResult(request,"TOPCONFIG") !=null)
   alTopConfig =(DataSet)ServletUtil.getResult(request,"TOPCONFIG");
%>
<!--得到表高级设置-->
<!--功能元件显示-->
	<$:A service="getPageComponents" dynamic="false">
		<$:P name="card" value="<%=sCard%>"/>
		<$:P name="page_type" value="2"/>
	</$:A>
	<$:M dtype="1"/>
	<%
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
                           int iCompType =Integer.parseInt((String)hmArray.getString("COMP_TYPE"));
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
   <!--功能元件显示-->
	</div>
	</td></tr></table>
<input type=hidden name="card" value="<%=sCard%>">
<%
//网页传传过来的参数
Enumeration oEn =request.getParameterNames();
while(oEn.hasMoreElements()){
	String sPara =oEn.nextElement().toString();
	if(sPara.equalsIgnoreCase("card") || sPara.equalsIgnoreCase("all"))
	{
		continue;
	}
	if(!alHasPrintPonent.contains(sPara) && request.getParameter(sPara) !=null)
		out.println("<input type=hidden name=\""+sPara+"\" value='"+request.getParameter(sPara)+"'>\n");
}
%>

</form>
<!-- <script>
<%
if(iOperate ==2){//修改数据
   Row hmData =null;
   Enumeration en =request.getParameterNames();
   while(en.hasMoreElements()){
      if(hmData ==null) hmData =new Row();
      Object oPara =en.nextElement();
      hmData.put(oPara, request.getParameter(oPara.toString()));
   }
%>
   <$:A service="getTableView" dynamic="false" condition="<%=hmData%>"/>
   <zz:Error dtype="1"/>
   <zz:Result var="field" name="FIELDSINFO">
      //document.all.<zz:Field item="field.FIELD_ENAME"/>.value='<zz:Field item="field.FIELD_VALUE"/>';
   </zz:Result>
<%}%>
</script> -->
</body>
<%--得到保存按钮的保存调用事件--%>
<$:A service="getTableData" dynamic="true">
	<$:P name="table" value="db_table_top_config"/>
	<$:P name="where" value="<%="where card='"+sCard+"' and comp_type=88"%>"/>
</$:A>
<$:M dtype="1"/>
<%
String sOnSaveJs ="";//保存按钮js事件
if(ServletUtil.getResult(request,"TABLE") !=null)
{
   DataSet alData =(DataSet)ServletUtil.getResult(request,"TABLE");
	Row hm =(Row)alData.get(0);
	sOnSaveJs =hm.get("JAVASCRIPT")==null?"":hm.get("JAVASCRIPT").toString();
}
request.removeAttribute(ServletUtil._SOFT_TAG+"TABLE");

%>
<script>
	<%
	if(alTopConfig !=null)	
	{
		for(int n=0; n<alTopConfig.size(); n++)
		{
			Row hmArray =(Row)alTopConfig.get(n);
			int iCompType =Integer.parseInt((String)hmArray.get("COMP_TYPE"));
			if(iCompType ==86)//普通方法
			{
				out.println("\nfunction "+hmArray.get("ACT_NAME")+"\n{");
				out.println(hmArray.get("JAVASCRIPT"));
				out.println("}\n");
			}
		}
	}
	%>

function onBodyLoad()
{
	<%
	if(alTopConfig !=null)	
	{
		for(int n=0; n<alTopConfig.size(); n++)
		{
			Row hmArray =(Row)alTopConfig.get(n);
			int iCompType =Integer.parseInt((String)hmArray.get("COMP_TYPE"));
			if(iCompType ==87)//页装载事件
			{
				out.println(hmArray.get("ACT_NAME")+";\n");
				//out.println(hmArray.get("JAVASCRIPT"));
			}
		}
	}
	%>
}
	<%
	if(alTopConfig !=null)	
	{
		for(int n=0; n<alTopConfig.size(); n++)
		{
			Row hmArray =(Row)alTopConfig.get(n);
			int iCompType =Integer.parseInt((String)hmArray.get("COMP_TYPE"));
			if(iCompType ==87)//页装载事件
			{
				out.println("\nfunction "+hmArray.get("ACT_NAME")+"\n{");
				out.println(hmArray.get("JAVASCRIPT"));
				out.println("}\n");
			}
		}
	}
	%>


function onEdit(form)
{
	var wordEditor =0;
	var excelEditor =0;
	<%
		if(bHasWordEditor)	
			out.println("wordEditor =1;\n");
		if(bHasExcelEditor)	
			out.println("excelEditor =1;\n");
	%>
   if(checkForm(form))
   {
		htmledit =document.getElementsByName("htmledit");
		if(htmledit.length >0)
		{//循环html textarea录入模式方式，得到数据
			for(i=0; i<htmledit.length; i++)
			{
				for(j=0; j<form.length; j++)
				{
					if(form[j].name ==htmledit[i].value)
					{
						switch(i)
						{
							case 0:
								form[j].value =eWebEditor1.getHTML();
								break;
							case 1:
								form[j].value =eWebEditor2.getHTML();
								break;
							case 2:
								form[j].value =eWebEditor3.getHTML();
								break;
							case 3:
								form[j].value =eWebEditor4.getHTML();
								break;

						}
					}
				}
			}
		}
		if(wordEditor ==1)
		{
			eWordEditor.window.onSubmitWebForm();
		}
		if(excelEditor ==1)
		{
			eExcelEditor.window.onSubmitWebForm();
		}
		<%=sOnSaveJs%>
		var s=new Server("saveCardData");
		s.setFormData();
		$E.disabled();
		//*
			s.send(s, false, function()
			{
				var sKeyValues =s.getDefaultParamValue("KeyValues");
				var sKeyUrl ="";
				if(sKeyValues !=null && sKeyValues !="")
				{
					$E.message("保存成功！");
					$E.abled();
					var saKeyValues =sKeyValues.split("|");
					for(var i=0; i<saKeyValues.length; i++)
					{
						sKeyUrl +="&"+saKeyValues[i];
						var saKeyValue =saKeyValues[i].split("=");
						if(document.getElementsByName(saKeyValue[0]).length ==1)
						{
							document.getElementsByName(saKeyValue[0])[0].value =saKeyValue[1];
						}
					}
					//$S("operate", "2");//置为修改状态
					if(sKeyUrl !="")
					{
						sKeyUrl ="&from=listadd"+sKeyUrl;//表示从添加后返回到列表页面，列表页面根据from参数来显示数据列表（把这次添加的数据放在第一行
					}
					//$E.loca("CardList.jsp?card="+$E.getParameter("card")+sKeyUrl);
					var callback =$E.getParameter("callback");
					if(callback !="")
					{
						eval(callback);
					}
					else
						$E.loca("CardList.jsp?"+$E.getQueryString());
				}
				else
				{
					$E.loca("CardList.jsp?"+$E.getQueryString());
				}
				/*
					if(confirm("再次添加数据？"))
						$E.loca("CardEdit.jsp?"+$E.getQueryString());
					else
						$E.loca("CardList.jsp?"+$E.getQueryString());
				*/
			}
		);
		//*/
		//form.submit();
   }
}
function onAddAgain(form)
{
   if(checkForm(form))
   {
		disnabledAllElement();
      form.addagain.value ="1";
      form.submit();
   }
}
function onSelectStaff(handlevalue,handletext,multi)
{
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
   var url ='<%=GlobalUtil._WEB_PATH%>/system/card/SelectStaff.jsp?staff_nos='+handlevalue.value;
   if(multi ==1)
      url +="&checkboxtype=1";
   var sel_staff_nos=window.showModalDialog(url,window, features);
   if(sel_staff_nos !="" && typeof sel_staff_nos !='undefined')
   {
      var staff =sel_staff_nos.split(".");
      handlevalue.value =staff[0];
      handletext.value =staff[1];
   }
}
function onSelectSite(handlevalue,handletext,multi)
{
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
   var url ='<%=GlobalUtil._WEB_PATH%>/system/card/SelectSite.jsp?site_nos='+handlevalue.value;
   if(multi ==1)
      url +="&checkboxtype=1";
   var sel_site_nos=window.showModalDialog(url,window, features);
   if(sel_site_nos !="" && typeof sel_site_nos !='undefined')
   {
      var site =sel_site_nos.split(".");
      handlevalue.value =site[0];
      handletext.value =site[1];
   }
}
function onSelectPosition(handlevalue,handletext,multi)
{
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
   var url ='<%=GlobalUtil._WEB_PATH%>/system/card/SelectPosition.jsp?position_nos='+handlevalue.value;
   if(multi ==1)
      url +="&checkboxtype=1";
   var sel_site_nos=window.showModalDialog(url,window, features);
   if(sel_site_nos !="" && typeof sel_site_nos !='undefined')
   {
      var site =sel_site_nos.split(".");
      handlevalue.value =site[0];
      handletext.value =site[1];
   }
}
function onSelectPageThin(handle, pageurl, hiddenHandle)
{
	var features ="dialogHeight = 520px; dialogWidth = 550px; help: no; status: no;";//Modal Dialog Window feature
	if(pageurl.indexOf("?")  !=-1)
		pageurl =pageurl+"&new=1&select=1";
	else
		pageurl =pageurl+"?new=1&select=1";
   var arrOutArgs=window.showModalDialog(pageurl,window, features);
	if (arrOutArgs != null)
	{
		if(typeof arrOutArgs[0] !='undefined' && typeof arrOutArgs[1] !='undefined')
		{
			handle.value =arrOutArgs[1];
			hiddenHandle.value =arrOutArgs[2];
		}
		else
		{
			handle.value ="";
			hiddenHandle.value ="";
		}
	}
}
function onSelectPage(handle, pageurl, tableId)
{
	var features ="dialogHeight = 520px; dialogWidth = 550px; help: no; status: no;";//Modal Dialog Window feature
	if(pageurl.indexOf("?")  !=-1)
		pageurl =pageurl+"&new=1&select=1";
	else
		pageurl =pageurl+"?new=1&select=1";
   var arrOutArgs=window.showModalDialog(pageurl,window, features);
	if (arrOutArgs != null)
	{
		if(typeof arrOutArgs[0] !='undefined' && typeof arrOutArgs[1] !='undefined')
		{
			var tmp=arrOutArgs[0];
			var tdCells =tmp.split("$");
			Table.runRowInsert(document.getElementById(tableId), tdCells, 0);
			tmp =arrOutArgs[1];
			tdCells =tmp.split("$");
			Table.clear(document.getElementById(tableId));
			Table.runRowInsert(document.getElementById(tableId), tdCells, 0);
			handle.value =arrOutArgs[2];
			for(i=0; i<document.getElementById(tableId).rows[0].cells.length; i++)
			{
				document.getElementById(tableId).rows[0].cells[i].className="td_tilte";
				document.getElementById(tableId).rows[0].className="tr_c";
			}
			document.getElementById(tableId).className="table_c";
			document.getElementById(tableId).cellpadding="2";
			document.getElementById(tableId).cellspacing="1";
		}
		else
		{
			runTableClear(document.getElementById(tableId));
			handle.value ="";
		}
	}
}
function onSelectOrg(handle, name, id)
{
	var text = document.getElementsByName(name);
	var hidden = document.getElementsByName(id);
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog Window feature
	var sQueryString ="?file=<%=GlobalUtil._WEB_PATH%>/system/card/GroupSelect.jsp";
	if(hidden[0].value !="")
		sQueryString +="&ids="+hidden[0].value;
	//var arrOutArgs = window.showModalDialog("../../common/dialog_fram.jsp"+sQueryString, null, features);
	var arrOutArgs = window.showModalDialog(WEB_PATH+"/system/card/GroupSelect.jsp", null, features);
	if (arrOutArgs != null)
	{
		/*
		hidden[0].value =arrOutArgs[0];
		text[0].value =arrOutArgs[1];
		*/
		tmp =arrOutArgs.split("|");
		text[0].value =tmp[0];
		hidden[0].value =tmp[1];
	}
}
function onEditOffice(handle, docid, filetype)
{
	var slTemplate =document.getElementsByName("template");
	for(i=0; i<slTemplate.length; i++)
	{
		if(handle ==slTemplate[i])
		{
			if(filetype ==".doc")
				document.all.eWordEditor.src ="<%=GlobalUtil._WEB_PATH%>/officeedit/DocumentEdit.jsp?Template="+slTemplate[i].value+"&RecordID="+docid+"&FileType="+filetype;
			else if(filetype ==".xls")
				document.all.eExcelEditor.src ="<%=GlobalUtil._WEB_PATH%>/officeedit/DocumentEdit.jsp?Template="+slTemplate[i].value+"&RecordID="+docid+"&FileType="+filetype;
			break;
		}
	}
}
</script>
