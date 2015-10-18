<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%@ page import="com.platform.web.util.HashArray"%>
<body>
<$:G title="表数据列表">

<$:A service="SYS_014" dynamic="false">
<$:P name="table_ename"/>
</$:A>
<$:M dtype="1"/>
<table id="tabMain" onClick="onRow()" cellpadding="3" border="1" width=100%>
   <tr> 
   <td height="1" align=right colspan=5>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="button" name="btnadd" value=<$:I item="html.button.add"/> td_c onclick="modify(0)"><input type="button" name="btndel" value=<$:I item="html.button.del"/> td_c onclick="modify(2);" disabled><input type="button" name="btnupdate" value=<$:I item="html.button.update"/> td_c onclick="modify(1);" disabled></td>
   </tr>
   <tr> 
   <$:T var="field" name="FIELDS">
      <td class="td_c"><$:C item="field.FIELD_CNAME"/></td>
   </$:T>
   </tr>
   <%
   DataSet alFields =(DataSet)ServletUtil.getResult(request, "FIELDS");
   DataSet alData =null;
   if(ServletUtil.getResult(request, "TABLEDATA") !=null)
      alData=(DataSet)ServletUtil.getResult(request, "TABLEDATA");
   StringBuffer sbTr =new StringBuffer();
   StringBuffer sbTds =new StringBuffer();   
   if(alData !=null){
      for(int i=0; i<alData.size(); i++)
      {   
         sbTr.setLength(0);
         sbTds.setLength(0);

         Row haRow =(Row)alData.get(i);

         for(int j=0; j<alFields.size(); j++)
         {
            Row hmField =(Row)alFields.get(j);
            if(hmField.getString("IS_KEY").equals("1"))
               sbTr.append(" "+hmField.get("FIELD_ENAME")+"='"
                  +haRow.get(hmField.get("FIELD_ENAME").toString().toUpperCase())+"'");
            sbTds.append("<td nowrap>"
               +haRow.get(hmField.get("FIELD_ENAME").toString().toUpperCase())+"</td>");
         }
         %>
      <tr <%=sbTr.toString()%>>
         <%=sbTds.toString()%>
      </tr>
   <%}%>
   </table>
   <%
}%>
   </$:G>   
   </body>
   </html>
   <script>
   function modify(type)
   {
      var table_ename='<$:W name="table_ename" from="request"/>';
      if(type=='0')
      {
   runOpen('<%=GlobalUtil._WEB_PATH%>/system/parameters/ValueAdd2.jsp?table_ename='+table_ename+'&_para_type='+type, true, 400, 400);
      }
      else
      {
         var used_view =Table.clickRow(document.all.tabMain).USED_VIEW;
         var disp_view =Table.clickRow(document.all.tabMain).DISP_VIEW;
         var disp_order =Table.clickRow(document.all.tabMain).DISP_ORDER;
         var notes =Table.clickRow(document.all.tabMain).NOTES;
         if(table_ename !="" && typeof table_ename !='undefined')
         {
            runOpen('<%=GlobalUtil._WEB_PATH%>/system/parameters/ValueAdd2.jsp?table_ename='+table_ename+'&used_view='+used_view+'&disp_view='+disp_view+'&disp_order='+disp_order+'&dispdisp_order='+disp_order+'&notes='+notes+'&type='+type, true, 400, 200);
         }
         else
            $E.message("请选择一条要修改的记录");
      }
   }
   function onRow()
   {
      Table.click();
      document.all.btndel.disabled=false;
      document.all.btnupdate.disabled=false;
   }
   </script>

