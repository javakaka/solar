<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<logic:present parameter="op">
   <logic:equal parameter="op" value="0">
         <$:A service="SYS_015" dynamic="false">
         </$:A>
   </logic:equal>
</logic:present>
<form method="POST">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="2">
   <tr> 
   <td width="1%" nowrap>静态参数字段名:<$:W name="table_ename" from="request" desc="表名" warn="true" alerttype="1" window="Dialog"/></td>
   </tr>
   <tr> 
      <td valign="top"> 
         <table width="100%" border="1" cellpadding="0" cellspacing="2">
         <$:A service="getTableFields" dynamic="true">
            <$:P name="table_ename"/>
         </$:A>
         <$:M dtype="1"/>
         <$:T var="field" name="Fields">
         <tr> 
            <td nowrap><$:C item="field.FIELD_CNAME"/></td>
            <td><input type=text name='_para_<$:W name="table_ename" from="request"/><$:C item="field.FIELD_ENAME"/>' size=20>[<FONT COLOR="#FF0000"><$:C item="field.FIELD_DESC"/></FONT>]</td>
         </tr>
         </$:T>
         </table>
         <input type=hidden name="_para_table_ename" value='<$:W name="table_ename" from="request"/>'>
         <input type=hidden name="_para_type" value='<$:W name="_para_type" from="request"/>'>
         <input type=hidden name="op" value='1'>
      </td>
  </tr>
  <tr> 
      <td height="1"><hr></td>
  </tr>
  <tr align="right">
      <td height="1" colspan="6"> 
      <input type="button" onClick="onSave(this.form)" value=<$:I item="html.button.save"/> ><input type="button" value=<$:I item="html.button.close"/>  onclick="parent.runParentRefresh()">
   </td>
  </tr>
</table>
</form>
</body>
<script>
function save(type)
{
   var src ='SaveParams.jsp';
   var table_ename='<$:W name="table_ename" from="request"/>';
   var field_ename='<$:W name="field_ename" from="request"/>';
   var used_view  =document.all.used_view.value;
   if(type=='2')
   {
      if(confirm("确实要删除此静态参数的值吗?"))
      {
         src +="?table_ename="+table_ename+"&field_ename="+field_ename+"&used_view="+used_view+"&operate="+type;
      }
      else
         return;
   }
   else if(type =='1' || type=='0')
   {
      if(!checkForm(document))
         return;
      var disp_order =document.all.disp_order.value;
      var disp_view  =document.all.disp_view.value
      var note       =document.all.notes.value;
      src +="?table_ename="+table_ename+"&field_ename="+field_ename;
      src +="&disp_order="+disp_order+"&used_view="+used_view+"&disp_view="+disp_view+"&note="+note+"&operate="+type;
   }
   document.all.save.src=src;
}
function onSave(form)
{
   form.op.value ="0";
   form.submit();
}
</script>

