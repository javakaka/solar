<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:A service="getErrorLog" dynamic="true">
   <$:P name="error_id" from="request"/>
</$:A>
<$:M dtype="1"/>
<$:G title="������Ϣ" height="400">
<DIV onscroll="Table.fixRow()" class="Shadow" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 320"> 
         <table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" cellpadding="3" border="1" width="100%" 	bordercolor="white" bgcolor="#eeeeee">	
<$:T var="error" name="ErrorInfo" pagesize="1">
   <tr><td nowrap align="right" width="1%">����ţ�</td><td><$:C item="error.ERROR_CODE"/></td></tr>
   <tr><td nowrap align="right">����ʱ�䣺</td><td><$:C item="error.OCCUR_TIME"/></td></tr>
   <tr><td nowrap align="right">�����նˣ�</td><td><$:C item="error.TERMINAL"/></td></tr>
   <tr><td nowrap align="right">������־��</td><td><$:C item="error.ERROR_LOG" brsize="50"/></td></tr>
   <tr><td nowrap align="right">�쳣��Ϣ��</td><td><$:C item="error.ERROR_EXP" brsize="100"/></td></tr>
</$:T>
</table>
</DIV>
</$:G>
<div align=center>
<input type=button value='�ر�' class="btDown" onClick ="window.close()" >
</div>
