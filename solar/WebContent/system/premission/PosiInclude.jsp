<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="position.list" from="4">
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree.js"></script>
<table width="100%" cellpadding="2" cellspacing="1" class="table_c">
  <tr class="tr_c"><td valign=top>
		<font color=red>ͼʾ</font>��<IMG SRC="images/0pic.gif">-����,<IMG SRC="images/1pic.gif">-��λ,<IMG SRC="images/4pic.gif">-��Ա
  </td></tr>
			<$:A service="getDeptPostionStaffTree" dynamic="false"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "DEPTPOSITIONSTAFF") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "DEPTPOSITIONSTAFF");
					%>
					<$:Tree treeData="<%=alTree%>" head="���Ÿ�λ��" pidF="UP_ID" idF="ID" pid="-1" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif"/>
					<%
				}
			%>
	<tr class="tr_c">
		<td><br><U><B>�޸�λ��Ա</B></U>
			<DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 200px">          
			<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" onClick="onRow()">	
					<tr class="tr_c">
						<td bgColor="silver" width=1% nowrap>��Ա����</td>
					</tr>
					<$:A service="getSysNoPositionStaff" dynamic="true"/>
					<$:M dtype="1"/>
					<$:T var="staff" name="Staffs" fieldNum="1">
					  <tr class="tr_c" <$:R item="staff.STAFF_NO,REAL_NAME"/>>
						<td nowrap><$:C item="staff.REAL_NAME"/></td>
					  </tr>
					</$:T>
				</table>
			</DIV>
		</td>
	</tr>
</table>
</$:G>
<script>
function action()
{
   if(tree.getSelected().parentNode!= null){
      var info =tree.getSelected().info;
      var node =info.split(",");
      up_id=node[0];
      id=node[1];
      type=node[3];
      if(type =="1")//��λ
      {
         window.parent.role.location ="RoleInclude.jsp?posi_no="+id+"&posi_name="+node[2];
      }
      else if(type =="4")//��Ա
      {
         window.parent.role.location ="RoleInclude.jsp?staff_no="+id.substring(1)+"&staff_name="+node[2];
      }
   }
   else
      window.parent.role.location ="RoleInclude.jsp";
}
function onRow()
{
	Table.click();
	ActiveMenuItem =Table.clickRow("tabMain");
   if(ActiveMenuItem !=null)
   {
      parent.document.all.role.src ="RoleInclude.jsp?staff_no="+ActiveMenuItem.STAFF_NO+"&staff_name="+ActiveMenuItem.REAL_NAME;
   }

}
</script>