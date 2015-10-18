<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<$:G title="卡片信息预览图">
<$:G title="列表数据预览">
<table cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="Table.click()">
   <!--TH-->
   <TR class=tr_c>
      <$:A service="getTableListFields" dynamic="false">
         <$:P name="table_ename" default=""/>
      </$:A>

      <$:T var="field" name="Fields">
         <td class="td_c" width=1% nowrap><$:C item="field.FIELD_CNAME"/></td>
      </$:T>
   </TR>   
   <$:A service="getTableQueryFields" dynamic="true">
      <$:P name="table_ename" default=""/>
   </$:A>
   <%
   int iRows =10;

   if(ServletUtil.getResult(request,"FIELDS") !=null)
   {
      DataSet alData =(DataSet)ServletUtil.getResult(request,"FIELDS");
      if(alData.size() !=0)
      {
         Row hmTmp =(Row)alData.get(0);
         if(hmTmp.get("LIST_ROWS") !=null)
            iRows =Integer.parseInt((String)hmTmp.get("LIST_ROWS"));
      }
   }
   %>
   <!--TR-->
      <$:A service="getTableSeqData" dynamic="false" pagesize="<%=iRows%>">
         <$:P name="table_ename" default=""/>
      </$:A>

      <$:T var="table" name="TABLE_DATA" pagesize="<%=iRows%>" fieldNum="100">
         <tr class=tr_c><zz:FieldsSeq result="table"/></tr>
      </$:T>
   <tr class=tr_c> 
   <td colspan="7" height="1%" align="right">  
      <form name="formpage">
         <$:Page pagesize="<%=iRows%>"/>
      </form>
   </td>
   </tr>
</table>
</$:G>
<$:G title="详细信息预览&编辑">
<table cellpadding="2" cellspacing="1" class="table_c" width="100%">
   <$:A service="getFieldsDetail" dynamic="true">
      <$:P name="table_ename" default=""/>
   </$:A>
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
            if(iRowTmp != iRow)
            {
               if(iRowTmp !=0)
                  html.append("</TR>");
               html.append("<TR class=tr_c>");
               iRowTmp =iRow;   
            }
            html.append("<TD rowspan="+iRowspan+" colspan="
               +iColspan+"><b>"+sFieldCname+"</b><br><font color='#"+sColor+"'>"+sFieldCname+"值</font></TD>");
         }
         html.append("</TR>");
      }
   }
   out.println(html.toString());
   %>
</table>
<table cellpadding="2" cellspacing="1" class="table_c" width="100%">
   <$:A service="getFieldsDetail" dynamic="true">
      <$:P name="table_ename" default=""/>
   </$:A>
   <%
   String sTableEname =ServletUtil.get(request,"table_ename")==null?"":ServletUtil.get(request,"table_ename");
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
            String sStyleId =hmTmp.get("STYLE_ID").toString();
            String sFieldCname =hmTmp.get("FIELD_CNAME").toString();
            String sFieldEname =hmTmp.get("FIELD_ENAME").toString();
            if(iRowTmp != iRow)
            {
               if(iRowTmp !=0)
                  out.println("</TR>");
               out.println("<TR>");
               iRowTmp =iRow;   
            }
            out.println("<TD rowspan="+iRowspan+" colspan="
               +iColspan+" valign=top><b>"+sFieldCname+"</b><br>");
            if(sStyleId.equals("001001"))//登录人IP
               out.println("<input type=text name='"+sFieldEname+"' value='"+oUser.get("ip-address")+"'>");
            else if(sStyleId.equals("001002"))//登录人部门
               out.println("<input type=text name='"+sFieldEname+"' value='"+oUser.get("site-no")+"'>");
            else if(sStyleId.equals("001003"))//登录人岗位
               out.println("<input type=text name='"+sFieldEname+"' value='"+oUser.get("posi-no")+"'>");
            else if(sStyleId.equals("001004"))//登录人姓名
               out.println("<input type=text name='"+sFieldEname+"' value='"+oUser.get("staff-name")+"'>");
            else if(sStyleId.equals("001005"))//登录人员工编号
               out.println("<input type=text name='"+sFieldEname+"' value='"+oUser.get("staff-no")+"'>");
            else if(sStyleId.equals("002001"))//标准输入
               out.println("<input type=text name='"+sFieldEname+"'>");
            else if(sStyleId.equals("002002"))//密码输入
               out.println("<input type=password name='"+sFieldEname+"'>");
            else if(sStyleId.equals("002003"))//隐藏字段
               out.println("");
            else if(sStyleId.equals("002004"))//标准输入TextArea
            {
               out.println("<textarea name=\""+sFieldEname+"\" style=\"width:100%\" rows=5></textarea>");
            }
            else if(sStyleId.startsWith("003"))//编号类
               out.println("");
            else if(sStyleId.equals("004001"))//选择日期
            {
               out.println("<input type=text size=10 readonly name='"+sFieldEname+"'>");
               out.println("<input name=\"set_date"+sFieldEname+"\" type=\"button\" class=\"bt\""
                  +"onclick=\"runDateSelect(document.all."+sFieldEname+", false,false)\" value=\"...\">");
            }
            else if(sStyleId.equals("004002"))//选择日期时间
            {
               out.println("<input type=text size=20 readonly name='"+sFieldEname+"'>");
               out.println("<input name=\"set_date"+sFieldEname+"\" type=\"button\" class=\"bt\""
                  +"onclick=\"runDateSelect(document.all."+sFieldEname+", true,true)\" value=\"...\">");
            }
            else if(sStyleId.equals("005001"))//单项选择
               out.println("");
            else if(sStyleId.equals("005002"))//单项选择(radio)
               out.println("");
            else if(sStyleId.equals("005003"))//多项选择
               out.println("");
            else if(sStyleId.equals("005004"))//数据下拉
            {
            %>
               <$:A service="getSourceData" dynamic="false">
                  <$:P name="table_ename" value="<%=sTableEname%>"/>
                  <$:P name="field_ename" value="<%=sFieldEname%>"/>
               </$:A>
               <$:L name="<%=sFieldEname%>" rs="SOURCE_DATA" valueField="VALUE" 	textField="TEXT" firstText="请选择..."/>
            <%
               request.removeAttribute(ServletUtil._SOFT_TAG+"SOURCE_DATA");
            }
            out.println("</TD>");
         }
         out.println("</TR>");
      }
   }
   %>
</table>
</$:G>
</$:G>
</body>