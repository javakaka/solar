<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree2.js"></script>
<%
String sCheckBoxType =request.getParameter("checkboxtype")==null?"0":request.getParameter("checkboxtype");
String checkBox ="position";
%>
<$:G title="staff.select" from="4">
<DIV style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 420px">
	<table width="100%"  border="0" cellpadding="0" cellspacing="2" valign="top">
	  <tr>
		<td valign="top">
			<$:A service="getBureauPositions" dynamic="true"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request, "POSITIONS") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request, "POSITIONS");
					%>
					<$:Tree treeData="<%=alTree%>" head="组织机构岗位" pidF="UP_POSI_NO" idF="POSI_NO" pid="0" titleF="POSI_NAME" hiddenF="UP_POSI_NO,POSI_NO,POSI_NAME" icon="pic.gif" checkbox="<%=checkBox%>" checkboxtype="<%=sCheckBoxType%>"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
</DIV>
</$:G>
<div align="right"><input type="button" value='选定' class="btfirst" onClick="onSelectposition('position')"><input type="button" value=<$:I item="html.button.close"/> class="btnofirst" onclick="window.close()"></div>
<script>
var position_nos =$E.getParameter("position_nos");
if(position_nos!="")
{
   var positionnos =position_nos.split(",");
   if(typeof document.all.position.length =='undefined')   
   {
      for(k=0; k<positionnos.length; k++)
      {
         var vposition =document.all.position.value;
         var position =vposition.split(",");
         var position_no =position[1];
         var position_name =position[2];
         if(position_no ==positionnos[k])
            document.all.position.checked =true;
      }
   }
   else
   {
      for(i=0; i<document.all.position.length; i++)
      {
         var vposition =document.all.position[i].value;
         var position =vposition.split(",");
         var position_no =position[1];
         var position_name =position[2];
         for(k=0; k<positionnos.length; k++)
         {
            if(position_no ==positionnos[k])
            {
               document.all.position[i].checked =true;
            }
         }
      }
   }
}
function action()
{
	return false;
}
function onSelectposition(handlename)
{
	var handle =document.getElementsByName(handlename);
	var position_nos ="";
	var position_names ="";
	for(i=0; i<handle.length; i++)
	{
		if(handle[i].checked)
		{
			value =handle[i].value;
			savalue =value.split(",");
			if(position_nos =="")
			{
				position_nos =savalue[1];
				position_names =savalue[2];
			}
			else
			{
				position_nos +=","+savalue[1];
				position_names +=","+savalue[2];
			}
		}
	}
	window.returnValue =position_nos+"."+position_names;
	window.close();
}
</script>