<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="js/International.js"></SCRIPT>
</HEAD>
<BODY onload="loadInternational()">
<table width="100%" cellpadding="0" cellspacing="0" border=0>
<tr>
	<td width="70%" valign="top">
	<$:G title="国际化条目设置" height="400">
		<table id="idTbItems" width="100%" cellpadding="2" cellspacing="1" class="table_c">
			<tr class="tr_c">
				<td class="td_c" align="center" width="10%">资源类型</td>
				<td class="td_c" align="center" width="40%">资源标识</td>
				<td class="td_c" align="center">资源放置位置</td>
			</tr>
			<tr class="tr_c">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		<div id="idDivPage">
		</div><br><br>
		<div align="left">
			快速定位，资源标识：<input type=text name="res_item"><input type=button value="定位" onClick="onQueryResItem()">
		</div>
	</$:G>
	</td>
	<td width=1% nowrap align=center valign="top">
		<table>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td align="center"><input type="button" value="新增语言" onClick="onEditLanguage(0)"></td></tr>
			<tr><td align="center"><input type="button" value="编辑语言" onClick="onEditLanguage(1)"></td></tr>
			<tr><td align="center"><input type="button" value="删除语言" onClick="onEditLanguage(2)"></td></tr>
			<tr><td align="center"><HR></td></tr>
			<tr><td align="center"><input type="button" value="新增条目" onClick="onEditItem(0)"></td></tr>
			<tr><td align="center"><input type="button" value="编辑条目" onClick="onEditItem(1)"></td></tr>
			<tr><td align="center"><input type="button" value="删除条目" onClick="onEditItem(2)"></td></tr>
		</table>
	</td>
	<td width="30%" valign="top">
	<$:G title="国际化语言分类" height="400">
		<table id="idTbLanguage" width="100%" cellpadding="2" cellspacing="1" class="table_c">
			<tr class="tr_c">
				<td class="td_c">分类标识</td>
				<td class="td_c">分类名称</td>
				<td class="td_c">状态</td>
				<td class="td_c"></td>
			</tr>
			<tr class="tr_c">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</$:G>
	</td>

</tr>
</table>
</BODY>
</HTML>