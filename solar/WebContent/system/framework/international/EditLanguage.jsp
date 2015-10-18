<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
</HEAD>
<BODY onload="loadLanInfo()">
<$:G title="语言编辑">
<table width="100%" cellpadding="2" cellspacing="1" border=0 class="table_c">
<tr class="tr_c">
	<td class="td_c" width="1%" nowrap>国际化语言分类标识：</td>
	<td><input type="text" width="100%" name="lan_no" notnull datatype="string" desc="国际化语言分类名称"><font color="red">*</font></td>
</tr>
<tr class="tr_c">
	<td class="td_c" width="1%" nowrap>国际化语言分类名称：</td>
	<td><input type="text" width="100%" name="lan_name" notnull datatype="string" desc="国际化语言分类名称"><font color="red">*</font></td>
</tr>
<tr class="tr_c">
	<td class="td_c" width="1%" nowrap>国际化语言分类状态：</td>
	<td><input type="checkbox" id="ckLanState"><label for="ckLanState" style="cursor:hand">有效</label></td>
</tr>
</table>
<input type="hidden" name="hlan_no" value="">
</$:G>
</BODY>
</HTML>
<script>
function loadLanInfo()
{
	document.all.lan_no.focus();
	if($E.getParameter("lan_no") !="")
	{
		$S("lan_no", $E.getParameter("lan_no"));
		$S("hlan_no", $E.getParameter("lan_no"));
		document.all.lan_no.readOnly =true;
	}
	$S("lan_name", $E.getParameter("lan_name"));
	if($E.getParameter("lan_state") =="1")
		ckLanState.checked =true;
}
</script>