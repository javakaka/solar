<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body style="BACKGROUND: url(<%=GlobalUtil._WEB_PATH%>/images/email.gif) fixed no-repeat">
<$:A service="getFolderMail" dynamic="false" pagesize="15">
	<$:P name="folder_no"  value="1"/>
</$:A>
<$:M dtype="1"/>
<table width="100%" cellpadding="0" cellspacing="0">
<$:T var="mail" name="FolderMail">
  <tr>
  <td width=1%><$:C item="mail.HAS_ATTACH" replace="[0,][1,<img src='../../../images/attach.gif'>]"/>
  </td>
  <td>
		<$:C item="mail.NEW_FLAG" replace="[1,<font color='#CC0000'>Î´¶Á</font>][0,]"/><a href="javascript:onRead('<$:C item="mail.MAIL_NO"/>','<$:C item="mail.OWNER_ID"/>',<$:C item="mail.NEW_FLAG"/>)">
		<$:C item="mail.SUBJECT" sub="50"/>(<$:C item="mail.MAIL_SIZE" replace="[null,0]"/>kb)<i><$:C item="mail.SEND_TYPE" replace="[0,][1,][2,³­][3,°µ]"/></i>
	</td>
	</tr>
</$:T>
</body>
<script>
function onRead(mail_no, owner_id, new_flag)
{
	parent.window.document.location="<%=GlobalUtil._WEB_PATH%>/mail/inner/Read.jsp?mail_no="+mail_no+"&owner_id="+owner_id+"&first_read="+new_flag;
}
</script>