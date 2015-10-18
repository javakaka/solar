<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="getStaffAuditNote" dynamic="true"/>
<$:M dtype="1"/>
<$:G title="选定常用语">
<table id="tabMain" name="tabMain" cellpadding="0" cellspacing="0" class="table_c" width=100% onClick="Table.click()" onDblClick="onSelectPishiyu()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap>类型</td>
		<td class="td_c" width=1% nowrap>常用语</td>
	</tr>
	<$:T var="audit" name="AuditNote">
		<tr  class="tr_c" <$:R item="audit.AUDIT"/>>
			<td nowrap><$:C item="audit.TYPE"/></td>
			<td nowrap><$:C item="audit.AUDIT"/></td>
		</tr>
	</$:T>
</table>
</$:G>
<div align=center>
<input type="button" value=<$:I item="html.button.submit"/>  onClick="onSelectPishiyu()"><input type="button" value=<$:I item="html.button.close"/>  onclick="window.close()">
</div>
<script>
function onSelectPishiyu()
{
   var pishiyu =Table.clickRow(document.all.tabMain).AUDIT;
   if(pishiyu !="" && (typeof pishiyu !='undefined'))
   {
      window.returnValue =pishiyu;
      window.close();
   }
}
</script>
