<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<script src="Staff.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree.js"></script>
<body onLoad="loadStaffs()">
<table width="100%" height="100%" class="table_c" cellpadding="2" cellspacing="1">
	<tr class="tr_c">
		<td valign="middle" height="25px" colspan="2" align="right">
			ϵͳ�Ǽ�Ա������<span class="bold Text_red"><%=com.juts.logic.system.org.OrgUtil.getOrgStaffs((String)
				com.juts.web.utility.ServletUtil.getLoginStaff(request,"bureau-no"))%></span>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<$:Shutcut shutcut="��ʦ��Ϣ" url="/norc/school/teacher/Teachers.jsp" icon="/images/icons/139.gif">��ݽ���</$:Shutcut>
		</td>
	</tr>
	<tr class="tr_c">
		<td width="200" valign="top">
			<$:A service="getDeptPostionTree" dynamic="false"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "DEPTPOSITION") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "DEPTPOSITION");
					%>
					<$:Tree treeData="<%=alTree%>" head="��֯����" pidF="UP_ID" idF="ID" pid="-1" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif"/>
					<%
				}
			%>
		</td>
		<td valign="top">
			<table width="100%" border="0" cellpadding="2" cellspacing="1" class="table_c">
				<tr class="tr_c">
					<td width="1%" class="td_c" nowrap>��ѯ��</td>
					<td nowrap class="right bold">��ţ�<input type="text" size="10" name="tech_no"></td>
					<td nowrap class="right bold">���ţ�<input type="text" size="15" name="site_name"></td>
					<td nowrap class="right bold">������<input type="text" size="6" name="name"></td>
					<td nowrap class="right bold">�Ա�
						<select name="sex">
							<option value="" selected>���գ�
							<option value="��">��
							<option value="Ů">Ů
						</select>
					</td>
					<td nowrap class="right bold">ְ��<input type="text" size="6" name="title_name"></td>
					<td nowrap class="right bold">�绰��<input type="text" size="6" name="phone"></td>
					<td align="center"><input type="button" value="����" onClick="onQueryTeachers()"></td>
				</tr>
				<tr class="tr_c"><td colspan="20" height="1px" style="background:#000000"></td></tr>
				<tr class="tr_c">
					<td colspan="20">
					<table id="idTbWorkers" width="100%" class="table_c" cellpadding="2" cellspacing="1">
						<tr class="tr_c">
							<td class="td_c center" width="100" sort_name='worker_no' style="cursor:hand" onClick="Td.sort(this, s, actions)" desc="���" title="�������">���</td>
							<td class="td_c center" sort_name='name' style="cursor:hand" onClick="Td.sort(this, s, actions)" desc="����" title="�������">����</td>
							<td class="td_c center" sort_name='site_name' style="cursor:hand" onClick="Td.sort(this, s, actions)" desc="����" title="�������">����</td>
							<td class="td_c center" sort_name='sex' style="cursor:hand" onClick="Td.sort(this, s, actions)" desc="����" title="�������">�Ա�</td>
							<td class="td_c center" sort_name='title_name' style="cursor:hand" onClick="Td.sort(this, s, actions)" desc="ְ��" title="�������">ְ��</td>
							<td class="td_c center">��ϵ�绰</td>
							<td class="td_c center" sort_name='email' style="cursor:hand" onClick="Td.sort(this, s, actions)" desc="��������" title="�������">��������</td>
							<td class="td_c center" width="1%" nowrap></td>
						</tr>
					</table>
					<div id="idDivTeacherPage"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--
tree.expandAll();
var can_edit_worker =<%=com.juts.logic.system.security.SecurityQuery.promission(ServletUtil.getLoginStaffNo(request), "ARACHIVE_WORKER_EDIT", 2)%>;
function action()
{
   if(tree.getSelected() !=null && tree.getSelected().parentNode!= null)
	{
      var info =tree.getSelected().info;
      var node =info.split(",");
      up_id=node[0];
      id=node[1];
      type=node[3];
		if(type ==1)
			id =id.substring(1);
		onTreeTeacher(id, type);
   }
}
//-->
</SCRIPT>