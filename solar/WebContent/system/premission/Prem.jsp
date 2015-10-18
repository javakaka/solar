<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<table width=100%>
	<tr>
	<td  width=150 valign=top>
   <$:G title="role.list" from="4">
	<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%"	onClick="row()">	
		<tr class="tr_title">
<!-- 			<td class="td_c" width=1% nowrap><$:I item="tsm_role.role_id"/></td> -->
			<td class="td_c" nowrap><$:I item="sm_role.role_name"/></td>
		</tr>
		<$:A service="getSysRoles" dynamic="true"/>
		<$:M dtype="1"/>
		<$:T var="role" name="Roles">
		  <tr class="tr_c" <$:R item="role.ROLE_ID,ROLE_NAME"/>>
<!-- 			<td nowrap><$:C item="role.ROLE_ID"/></td> -->
			<td nowrap>&nbsp;<$:C item="role.ROLE_NAME"/></td>
		  </tr>
		</$:T>
	</table>
   </$:G>
	</td>
	<td valign=top>
		<iframe id="prem_include" width="100%" height="520" frameborder="0" scrolling="no" src="./SelectTree.jsp"></iframe>
	</td>
	</tr>
</table>
<script>
function row()
{
	try
	{
		Table.click();
		var role_id =Table.clickRow("tabMain").ROLE_ID;
		if(role_id !="" && typeof role_id !='undefined')
		{
			document.all.prem_include.src ="SelectTree.jsp?role_id="+role_id;
		}
		else
			document.all.prem_include.src ="SelectTree.jsp";
	}
	catch(e){}
}	
</script>