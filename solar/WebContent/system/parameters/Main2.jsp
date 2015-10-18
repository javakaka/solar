<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<table width=100% height=100%>
   <tr>
   <td valign=top width="150">
   <table id="tabMain" width="100%" name="tabMain" cellpadding="3" border="1" width="100%" onClick="row()">	
      <tr>
         <td class="td_c"width=1% nowrap>数据库表名</td>
      </tr>
      <$:A service="SYS_047" dynamic="true"/>
      <$:M dtype="1"/>
      <$:T var="table" name="SYS_047">
        <tr <$:R item="table.TABLE_ENAME"/>>
         <td nowrap><$:C item="table.TABLE_CNAME"/></td>
        </tr>
      </$:T>
	</table>
   </td>
    <td valign="top" height=100%>
		<iframe src="Root.jsp" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</td>
  </tr>
</table>
</body>
<script>
function row()
{
   Table.click();
   var table_ename =Table.clickRow(document.all.tabMain).TABLE_ENAME;
   if(table_ename !="" && typeof table_ename !='undefined')
   {
      document.all.DIFRAME.src ="Data.jsp?table_ename="+table_ename;
      return false;
   }
}
</script>
