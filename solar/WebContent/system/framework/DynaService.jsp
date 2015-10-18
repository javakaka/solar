<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="getFmDynaServices" dynamic="true">
	<$:P name="action_id" default="" from="request" aliasName="service_name"/>
	<$:P name="action_desc" default="" from="request" aliasName="service_desc"/>
</$:A>
<$:M dtype="1"/>
<DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 398px"> 
<table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" width="100%" cellpadding="2" cellspacing="1" class="table_c">	
	<tr style="POSITION: relative" class="tr_c">
		<td class="td_c" width=1% nowrap><$:I item="fm_services.service_desc"/></td><td class="td_c"><$:I item="fm_services.service_name"/></td>
	</tr>
	<$:T var="actions" name="DynaServics">
	  <tr class="tr_c" <$:R item="actions.ACTION_ID"/>>
		<td nowrap bgColor="silver"><input type=checkbox class="radio" name="service" onClick="setService()" value='1,<$:C item="actions.ACTION_ID"/>,<$:C item="actions.ACTION_DESC"/>' id='D_<$:C item="actions.ACTION_ID"/>'><label for='D_<$:C item="actions.ACTION_ID"/>'  style="cursor=hand"><$:C item="actions.ACTION_ID"/></td><td bgColor="silver"><label for='D_<$:C item="actions.ACTION_ID"/>' style="cursor=hand"><$:C item="actions.ACTION_DESC"/></label></td>
	  </tr>
	</$:T>
</table>
</DIV>
<SCRIPT LANGUAGE="JavaScript">
<!--
function setService()
{
	var oServices =document.getElementsByName("service");
	parent.window.oBindDynaServices =new Array();

	for(i=0; i<oServices.length; i++)
	{
		if(oServices[i].checked)
		{
			var s =oServices[i].value.split(",");
			parent.window.oBindDynaServices.push(s);
		}
	}
	parent.window.viewBindServices();
}
//-->
</SCRIPT>