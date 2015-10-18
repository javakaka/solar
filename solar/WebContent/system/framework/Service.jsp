<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 398px"> 
<$:A service="getFmServices" dynamic="true">
	<$:P name="service_name" default="" from="request"/>
	<$:P name="service_desc" default="" from="request"/>
</$:A>
<$:M dtype="1"/>
<table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" width="100%" cellpadding="2" cellspacing="1" class="table_c">	
	<tr style="POSITION: relative" class="tr_c">
		<td class="td_c" width=1% nowrap><$:I item="fm_services.service_desc"/></td><td class="td_c"><$:I item="fm_services.service_name"/></td>
	</tr>
	<$:T var="services" name="Services">
	  <tr class="tr_c" <$:R item="services.SERVICE_NAME,SERVICE_DESC"/>>
		<td nowrap bgColor="silver"><input type=checkbox onClick="setService()" class="radio" name="service" value='0,<$:C item="services.SERVICE_NAME"/>,<$:C item="services.SERVICE_DESC"/>' id='<$:C item="services.SERVICE_NAME"/>'><label for='<$:C item="services.SERVICE_NAME"/>' style="cursor=hand"><$:C item="services.SERVICE_NAME"/></label></td><td bgColor="silver"><label for='<$:C item="services.SERVICE_NAME"/>' style="cursor=hand"><$:C item="services.SERVICE_DESC"/></label></td>
	  </tr>
	</$:T>
</table>
</DIV>
<SCRIPT LANGUAGE="JavaScript">
<!--
function setService()
{
	var oServices =document.getElementsByName("service");
	parent.window.oBindServices =new Array();

	for(i=0; i<oServices.length; i++)
	{
		if(oServices[i].checked)
		{
			var s =oServices[i].value.split(",");
			parent.window.oBindServices.push(s);
		}
	}
	parent.window.viewBindServices();
}
//-->
</SCRIPT>