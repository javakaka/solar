<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="getFieldDefineNo" dynamic="true">
	<$:P name="table_ename" from="request"/>
	<$:P name="field_ename" from="request"/>
</$:A>
<$:M dtype="1"/>
<$:T var="IdParse" name="IdParse" pagesize="1">
	<$:G title="�Զ�����">
	<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
		<tr class="tr_c">
			<td nowrap class="td_c"><B>��Ź���</B></td>
			<td><$:C item="config.IDPARSE"/><input type=text value='<$:C item="IdParse.IDPARSE"/>' name='idparse' size="50">
		</tr>
		<tr class="tr_c">
			<td valign=top class="td_c"><B>��ʾ</B></td>
			<td valign=top height=150 valign=middle>$D[<I>yyyy-MM-dd HH:mm:ss</I>]:$D[]��ʾ��ǰ����ʱ��,<I>yyyy-MM-dd HH:mm:ss</I>��ʾ��ǰ��������ʾ��ʽ(2005-01-01 12:00:00);yyyy(��)MM(��)dd(��)HH(Сʱ)mm(����)ss(��)<br>$[Nn]:$[N]��ʾ����¼���,$[NNN]����ʾ����ţ�����3Ϊǰ�油0������002<br><FONT COLOR="red">���磺T$D[yyyyMMddHH]:���ɵı���ǣ�T2005010112</FONT></td>
		</tr>
	</table>
	</$:G>
	<div align=center>
	<input type="submit"  onClick="onDefineNo()" value=<$:I item="html.button.save"/>><input type="button"   value=<$:I item="html.button.close"/>  onClick="window.close()">
	</div>
<input type=hidden name="op" value="1">
<input type=hidden name="table_ename" value='<$:W name="table_ename" from="request"/>'>
<input type=hidden name="field_ename" value='<$:W name="field_ename" from="request"/>'>
</$:T>
<script>
function onDefineNo()
{
	var s =new Server("saveTableFieldDefineNo", 1);
	s.setParamValue("default", "table_ename", $V("table_ename") );
	s.setParamValue("default", "field_ename", $V("field_ename") );
	s.setParamValue("default", "idparse", $V("idparse") );
	if(s.send(s, true))
	{
		alert("�����ɹ���");
	}
}
</script>