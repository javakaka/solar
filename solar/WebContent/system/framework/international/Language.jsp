<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="js/International.js"></SCRIPT>
</HEAD>
<BODY onload="loadInternational()">
<table width="100%" cellpadding="0" cellspacing="0" border=0>
<tr>
	<td width="70%" valign="top">
	<$:G title="���ʻ���Ŀ����" height="400">
		<table id="idTbItems" width="100%" cellpadding="2" cellspacing="1" class="table_c">
			<tr class="tr_c">
				<td class="td_c" align="center" width="10%">��Դ����</td>
				<td class="td_c" align="center" width="40%">��Դ��ʶ</td>
				<td class="td_c" align="center">��Դ����λ��</td>
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
			���ٶ�λ����Դ��ʶ��<input type=text name="res_item"><input type=button value="��λ" onClick="onQueryResItem()">
		</div>
	</$:G>
	</td>
	<td width=1% nowrap align=center valign="top">
		<table>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td align="center"><input type="button" value="��������" onClick="onEditLanguage(0)"></td></tr>
			<tr><td align="center"><input type="button" value="�༭����" onClick="onEditLanguage(1)"></td></tr>
			<tr><td align="center"><input type="button" value="ɾ������" onClick="onEditLanguage(2)"></td></tr>
			<tr><td align="center"><HR></td></tr>
			<tr><td align="center"><input type="button" value="������Ŀ" onClick="onEditItem(0)"></td></tr>
			<tr><td align="center"><input type="button" value="�༭��Ŀ" onClick="onEditItem(1)"></td></tr>
			<tr><td align="center"><input type="button" value="ɾ����Ŀ" onClick="onEditItem(2)"></td></tr>
		</table>
	</td>
	<td width="30%" valign="top">
	<$:G title="���ʻ����Է���" height="400">
		<table id="idTbLanguage" width="100%" cellpadding="2" cellspacing="1" class="table_c">
			<tr class="tr_c">
				<td class="td_c">�����ʶ</td>
				<td class="td_c">��������</td>
				<td class="td_c">״̬</td>
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