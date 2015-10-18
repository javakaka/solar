<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree2.js"></script>
<%
String sCheckBoxType =ServletUtil.get(request,"checkboxtype").equals("")?"0":ServletUtil.get(request,"checkboxtype");
String checkBox ="site";
%>
<$:G title="选择部门">
<DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 420px">
	<table width="100%"  border="0" cellpadding="0" cellspacing="2" valign="top">
	  <tr>
		<td valign="top">
			<$:A service="getBureauSites" dynamic="true"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request,"SITES") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request,"SITES");
					%>
					<$:Tree treeData="<%=alTree%>" head="组织机构部门" pidF="UP_SITE_NO" idF="SITE_NO" pid="0" titleF="SITE_NAME" hiddenF="UP_SITE_NO,SITE_NO,SITE_NAME" icon="pic.gif" checkbox="<%=checkBox%>" checkboxtype="<%=sCheckBoxType%>"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
</DIV>
</$:G>
<div align="right"><input type="button" value='选定'  onClick="onSelectSite('site')"><input type="button" value=<$:I item="html.button.close"/>  onclick="window.close()"></div>
<script>
var site_nos ='<$:W name="site_nos" from="request" default=""/>';
if(site_nos!="")
{
   var sitenos =site_nos.split(",");
   if(typeof document.all.site.length =='undefined')   
   {
      for(k=0; k<sitenos.length; k++)
      {
         var vsite =document.all.site.value;
         var site =vsite.split(",");
         var site_no =site[1];
         var site_name =site[2];
         if(site_no ==sitenos[k])
            document.all.site.checked =true;
      }
   }
   else
   {
      for(i=0; i<document.all.site.length; i++)
      {
         var vsite =document.all.site[i].value;
         var site =vsite.split(",");
         var site_no =site[1];
         var site_name =site[2];
         for(k=0; k<sitenos.length; k++)
         {
            if(site_no ==sitenos[k])
            {
               document.all.site[i].checked =true;
            }
         }
      }
   }
}
function action()
{
	return false;
}
function onSelectSite(handlename)
{
	var handle =document.getElementsByName(handlename);
	var site_nos ="";
	var site_names ="";
	for(i=0; i<handle.length; i++)
	{
		if(handle[i].checked)
		{
			value =handle[i].value;
			savalue =value.split(",");
			if(site_nos =="")
			{
				site_nos =savalue[1];
				site_names =savalue[2];
			}
			else
			{
				site_nos +=","+savalue[1];
				site_names +=","+savalue[2];
			}
		}
	}
	window.returnValue =site_nos+"."+site_names;
	window.close();
}
</script>
