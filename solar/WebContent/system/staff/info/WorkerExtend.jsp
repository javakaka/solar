<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Datetime.js"></script>
<script src="Staff.js"></script>
<body onLoad="getWorkerInfo(3)">
<table width="100%" cellpadding="2" cellspacing="1" border=0 class="table_c">
	<tr class="tr_c">
		<td class="td_c center" valign="top" nowrap>教育<br/>背景</td>
		<td width="43%">
			<textarea name="education" style="width:100%" rows="6"></textarea>
		</td>
		<td class="td_c center" valign="top" nowrap>主要<br/>科研<br/>项目</td>
		<td width="43%">
			<textarea name="project" style="width:100%" rows="6"></textarea>
		</td>
	</tr>
	<tr class="tr_c">
		<td class="td_c center" valign="top" nowrap>获奖<br/>清空</td>
		<td width="43%">
			<textarea name="award" style="width:100%" rows="6"></textarea>
		</td>
		<td class="td_c center" valign="top" nowrap>代表性<br/>著作</td>
		<td width="43%">
			<textarea name="booke" style="width:100%" rows="6"></textarea>
		</td>
	</tr>
	<tr class="tr_c">
		<td class="td_c center" valign="top" nowrap>研究<br/>方向</td>
		<td width="43%">
			<textarea name="research" style="width:100%" rows="6"></textarea>
		</td>
		<td class="td_c center" valign="top" nowrap>主讲<br/>课程</td>
		<td width="43%">
			<textarea name="teaching" style="width:100%" rows="6"></textarea>
		</td>
	</tr>
	 <tr class="tr_c">
	  <td colspan="4" class="center">
			<input type="button" value="保存" onClick="onSaveWorker('extend')">
		 </td>
	 </tr>
</table>
</body>
</html>
<script language="javascript">
<!--
var can_edit_worker =<%=com.juts.logic.system.security.SecurityQuery.promission(ServletUtil.getLoginStaffNo(request), "ARACHIVE_WORKER_EDIT", 2)%>;
//-->
</script>