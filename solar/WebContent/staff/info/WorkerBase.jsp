<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Datetime.js"></script>
<script src="Staff.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
var lid ='<%=ServletUtil.getLoginStaffNo(request)%>';
var can_edit_worker =<%=com.juts.logic.system.security.SecurityQuery.promission(ServletUtil.getLoginStaffNo(request), "ARACHIVE_WORKER_EDIT", 2)%>;
//-->
</SCRIPT>
<body onLoad="getWorkerInfo(2)">
<table width="100%" cellpadding="2" cellspacing="1" border=0 class="table_c">
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>���ţ�</td>
  <td width="250px"><span id="idSpanSiteName"></span>��<span id="idSpanPosiName"></span></td>
  <td width="1%" class="td_c right" nowrap>ְ�ƣ�</td>
  <td id="idTdTitleName" width="250px">
	<$:A service="getSysDictoryItems" dynamic="false">
		<$:P name="item" value="NORC_TITLE_NAME"/>
	 </$:A> <$:M dtype="1"/> <$:L name="title_name" rs="NORC_TITLE_NAME" valueField="used_view" textField="disp_view" firstText="��ѡ��..."/>
  </td>
  <td class="td_c center" nowrap colspan="2">��Ƭ</td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>���ţ�</td>
  <td><input type="text" name="worker_no" width="100%" notnull desc="����"></td>
  <td width="1%" class="td_c right" nowrap>������</td>
  <td><input type="text" name="name" width="100%" notnull desc="����"></td>
  <td width="150px" colspan="2" width="250px" rowspan="5" align="center" valign="top">
		<img id="idImgWorkerHeadPhoto" src="images/noupload.jpg" width="150px" height="200px"><br/>
		<input type="button" value="�ϴ�" onClick="onUploadWorkerImg()">
	 </td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>�Ա�</td>
  <td>
		<input type="radio" name="sex" id="sex1" checked><label for="sex1" class="hand">��</label>
		<input type="radio" name="sex" id="sex2"><label for="sex2" class="hand">Ů</label>
  </td>
  <td width="1%" class="td_c right" nowrap>���գ�</td>
  <td><input type="text" size="10" name="birthday" readonly onClick='setDay(this)'></td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>�칫�ң�</td>
  <td><input type="text" name="office" width="100%" notnull desc="�칫��"></td>
  <td width="1%" class="td_c right" nowrap>�칫�绰��</td>
  <td><input type="text" name="tel_phone" width="100%" notnull desc="�칫�绰"></td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>�ֻ����룺</td>
  <td><input type="text" name="mobile" width="100%" notnull desc="�ֻ�����"></td>
  <td width="1%" class="td_c right" nowrap>���䣺</td>
  <td><input type="text" name="email" width="100%" notnull desc="����"></td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>�򵥽��ܣ�</td>
  <td colspan="3">
		<textarea name="intro" style="width:100%" rows="10"></textarea>
	 </td>
 </tr>
 <%
 if(com.juts.logic.system.security.SecurityQuery.promission(ServletUtil.getLoginStaffNo(request), "ARACHIVE_WORKER_EDIT", 2))
 {
 %>
 <tr class="tr_c">
  <td colspan="6" class="center">
		<input type="button" value="����" onClick="onSaveWorker('base')">
	 </td>
 </tr>
 <%}%>
</table>
</body>
</html>