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
  <td width="1%" class="td_c right" nowrap>部门：</td>
  <td width="250px"><span id="idSpanSiteName"></span>●<span id="idSpanPosiName"></span></td>
  <td width="1%" class="td_c right" nowrap>职称：</td>
  <td id="idTdTitleName" width="250px">
	<$:A service="getSysDictoryItems" dynamic="false">
		<$:P name="item" value="NORC_TITLE_NAME"/>
	 </$:A> <$:M dtype="1"/> <$:L name="title_name" rs="NORC_TITLE_NAME" valueField="used_view" textField="disp_view" firstText="请选择..."/>
  </td>
  <td class="td_c center" nowrap colspan="2">照片</td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>工号：</td>
  <td><input type="text" name="worker_no" width="100%" notnull desc="工号"></td>
  <td width="1%" class="td_c right" nowrap>姓名：</td>
  <td><input type="text" name="name" width="100%" notnull desc="姓名"></td>
  <td width="150px" colspan="2" width="250px" rowspan="5" align="center" valign="top">
		<img id="idImgWorkerHeadPhoto" src="images/noupload.jpg" width="150px" height="200px"><br/>
		<input type="button" value="上传" onClick="onUploadWorkerImg()">
	 </td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>性别：</td>
  <td>
		<input type="radio" name="sex" id="sex1" checked><label for="sex1" class="hand">男</label>
		<input type="radio" name="sex" id="sex2"><label for="sex2" class="hand">女</label>
  </td>
  <td width="1%" class="td_c right" nowrap>生日：</td>
  <td><input type="text" size="10" name="birthday" readonly onClick='setDay(this)'></td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>办公室：</td>
  <td><input type="text" name="office" width="100%" notnull desc="办公室"></td>
  <td width="1%" class="td_c right" nowrap>办公电话：</td>
  <td><input type="text" name="tel_phone" width="100%" notnull desc="办公电话"></td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>手机号码：</td>
  <td><input type="text" name="mobile" width="100%" notnull desc="手机号码"></td>
  <td width="1%" class="td_c right" nowrap>邮箱：</td>
  <td><input type="text" name="email" width="100%" notnull desc="邮箱"></td>
 </tr>
 <tr class="tr_c">
  <td width="1%" class="td_c right" nowrap>简单介绍：</td>
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
		<input type="button" value="保存" onClick="onSaveWorker('base')">
	 </td>
 </tr>
 <%}%>
</table>
</body>
</html>