<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>

<script>
function row()
{
	try
	{
		runTableMultipleSelect();
	}
	catch(e){}
}


</script>
	<FIELDSET><LEGEND>频道列表</LEGEND>
<table  id="tabMain" name="tabMain" cellpadding="3" border="1" width="100%" onClick="row()" >	
	<tr>
		<td class="td_tilte" width=1% nowrap>左边频道</td>		
		<td class="td_tilte" width=1% nowrap>中间频道</td>
        <td class="td_tilte" width=1% nowrap>右边频道</td>
		
	</tr>

    <zz:Run service="SYS_050" dynamic="true" pagesize="10"/>
	<zz:Error dtype="1"/>
	<zz:Result var="services" name="SYS_050" fieldNum="3"   pagesize="10"> 
	  <tr <zz:Row item="services.LEFT_CHN,CENTER_CHN,RIGHT_CHN"/>>
		<td nowrap>&nbsp;<zz:Field item="services.LEFT_CHN"/></td>
		<td nowrap><zz:Field item="services.CENTER_CHN"/></td>
		<td nowrap>&nbsp;<zz:Field item="services.RIGHT_CHN"/></td>
	  </tr>
	</zz:Result>
	<tr> 
	<td colspan="6" height="1%" align="right">  
		<form name="formpage">
			<zz:Page pagesize="10"/>
		</form>
	</td>
	</tr>
</table>
<p><input type="button" value="submit"class="bt" onClick ="openssdjhasj()" >

</FIELDSET>