<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="GetFaq" dynamic="true">
   <$:P name="faq_no" default="0"/>
</$:A>
<$:M dtype="1"/>
<$:T var="faq" name="FaqInfo">
<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
   <tr class="tr_c">
		<td width=1% nowrap>标题</td><td align=center class="td_c"><$:C item="faq.SUBJECT"/></td>
	</tr>
   <tr class="tr_c">
		<td width=1% nowrap>内容</td><td>&nbsp;&nbsp;<$:C item="faq.CONTENT"/></td>
	</tr>
</table>
<div align=center>
	<a href='Child.jsp?pfaq_no=<$:C item="faq.PFAQ_NO"/>'>[ 返回 ]</a><br>&nbsp;
</div>
</$:T>
<table cellpadding="0" cellspacing="0" class="table_c" width=100%>
	<tr class="tr_c">
		<td>相关帮助：</td>
	</tr>
	<$:T var="rfaq" name="ReferFaq">
	<tr class="tr_c">
		<td><$:C item="rfaq.ROWID"/>、&nbsp;&nbsp;<a href='FaqInfo.jsp?faq_no=<$:C item="rfaq.FAQ_NO"/>'><$:C item="rfaq.SUBJECT"/></a></td>
	</tr>
	</$:T>
</table>
