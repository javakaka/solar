<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="getStaffTrace" dynamic="false">
	<$:P name="staff_no" from="request"/>
</$:A>
<$:M dtype="1"/>
<$:G title="�û�ϵͳ�����켣">
<table width=100% cellpadding="2" cellspacing="1" class="table_c">
	<tr class="tr_c">
		<td class="td_c" align="center" nowrap>ҳ��</td>
		<td align="center" class="td_c" nowrap>����ʱ��</td>
		<td align="center" class="td_c" nowrap>�˳�ʱ��</td>
	</tr>
		<$:T var="trace" name="Trace">
		<tr class="tr_c">
			<td nowrap><$:C item='trace.PAGE_URL'/></td>
			<td nowrap><$:C item='trace.LOGIN_TIME'/></td>
			<td nowrap><$:C item='trace.LOGOUT_TIME'/></td>
		</tr>
		</$:T>
		<tr class="tr_c"> 
			<td colspan="5" height="1%" align="right">  
				<form name="formpage">
					<$:Page pagesize="10"/>
				</form>
			</td>
		</tr>
</table>
</$:G>
