<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<logic:present parameter="op">
	<logic:equal parameter="op" value="1">
      <$:A service="SYS_001" dynamic="false">
				<$:P name="staff_nos" from="request"/>
				<$:P name="table" from="request"/>
				<$:P name="posi_no" from="request"/>
      </$:A>
	</logic:equal>
</logic:present>
<base target="_self">
<body>
<link type="text/css" rel="stylesheet" href="<%=GlobalUtil._WEB_PATH%>/res/css/xtree.css">
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/xtree.js"></script>
<%
String sCheckBoxType =ServletUtil.get(request,"checkboxtype", "0");
String checkBox ="[2,STAFF_NO]";
if(sCheckBoxType.equals("1"))
	checkBox +="[0,SITE_NO]";
%>
<$:G title="staff.select" from="4">
<DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 420px">
	<table width="100%"  border="0" cellpadding="0" cellspacing="2" valign="top">
	  <tr>
		<td valign="top">
			<$:A service="getDeptStaffTree" dynamic="false"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "DEPTSTAFF") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "DEPTSTAFF");
					%>
					<$:Tree treeData="<%=alTree%>" head="部门人员树" pidF="UP_ID" idF="ID" pid="0" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif" checkbox="<%=checkBox%>" checkboxtype="<%=sCheckBoxType%>"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
</DIV>
</$:G>
<div align="right">
 <input type="button" value='选定' class="btfirst" onClick="onSelectStaff('STAFF_NO')"><input type="button" value=<$:I item="html.button.close"/>  onclick="window.close()">
</div>
<script>
var staff_nos ='<%=ServletUtil.get(request,"staff_nos")==null?"":ServletUtil.get(request,"staff_nos")%>';
if(staff_nos!="")
{
   var staffnos =staff_nos.split(",");
   if(typeof document.all.STAFF_NO.length =='undefined')   
   {
      for(k=0; k<staffnos.length; k++)
      {
         var vstaff =document.all.STAFF_NO.value;
         var staff =vstaff.split(",");
         var staff_no =staff[0];
         var staff_name =staff[1];
         if(staff_no ==staffnos[k])
            document.all.STAFF_NO.checked =true;
      }
   }
   else
   {
      for(i=0; i<document.all.STAFF_NO.length; i++)
      {
         var vstaff =document.all.STAFF_NO[i].value;
         var staff =vstaff.split(",");
         var staff_no =staff[1];
         var staff_name =staff[2];
         for(k=0; k<staffnos.length; k++)
         {
            if(staff_no ==staffnos[k])
            {
               document.all.STAFF_NO[i].checked =true;
            }
         }
      }
   }
}function onAttendCheck(handle)
{

}
function action()
{
	return;
}
function onSelectStaff(handlename)
{
	var handle =$(handlename);
	var staff_nos ="";
	var staff_names ="";
	for(i=0; i<handle.length; i++)
	{
		if(handle[i].checked)
		{
			value =handle[i].value;
			savalue =value.split(",");
			if(staff_nos =="")
			{
				staff_nos =savalue[1];
				staff_names =savalue[2];
			}
			else
			{
				staff_nos +=","+savalue[1];
				staff_names +=","+savalue[2];
			}
		}
	}
	window.returnValue =staff_nos+"."+staff_names;
	window.close();
}
</script>
</body>
