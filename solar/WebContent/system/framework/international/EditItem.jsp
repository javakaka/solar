<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
</HEAD>
<BODY onload="loadItemInfo()">
<$:G title="语言编辑">
<table width="100%" cellpadding="2" cellspacing="1" border=0 class="table_c">
<tr class="tr_c">
	<td class="td_c" width="1%" nowrap>资源类型：</td>
	<td>
		<select name="res_type" style="width:50%">
			<option value="1">文本</option>
			<option value="2">文件</option>
		</select>
	</td>
</tr>
<tr class="tr_c">
	<td class="td_c" width="1%" nowrap>资源标识：</td>
	<td><input type="text" style="width:90%" name="res_item" notnull datatype="string" desc="国际化语言分类名称"><font color="red">*</font></td>
</tr>
<tr class="tr_c">
	<td class="td_c" width="1%" nowrap>资源放置位置：</td>
	<td><input type="text" style="width:100%" name="res_position"></td>
</tr>
</table>
<input type="hidden" name="hres_item" value="">
</$:G>
</BODY>
</HTML>
<script>
function loadItemInfo()
{
	document.all.res_item.focus();
	if($E.getParameter("res_item") !="")
	{
		$S("res_item", $E.getParameter("res_item"));
		$S("res_type", $E.getParameter("res_type"));
		$S("hres_item", $E.getParameter("res_item"));
		$S("res_position", $E.getParameter("res_position"));

		
		document.all.res_item.readOnly =true;
	}
}
</script>