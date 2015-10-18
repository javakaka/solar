<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<base target="_self">
<script language='javascript'>
<!--
if (document.all) {
   layerRef='document.all'
   styleRef='.style.'
}
//else if netscape (4.x)
else if (document.layers) {
   layerRef='document.layers'
   styleRef='.'
} 
else{
   alert("你使用的浏览器可能看不到效果。")
}
function tabclick(index)
{
   var i=0;
   for(i=1;i<=6;i++)
   {
      document.all("tab"+i).background="tab2.gif";
      eval(layerRef+'["div'+i+'"]'+styleRef+'visibility="hidden"')    
   }
   document.all("tab"+index).background="tab1.gif";
	eval(layerRef+'["div'+index+'"]'+styleRef+'visibility="visible"') 
}
function onGrant()
{
   var positions ='',sites ='', roles ='', groups ='';
   var staffs ='', auth_levels ='', managers ='';
   var position =document.getElementsByName("position");
   var site =document.getElementsByName("site");
   var role =document.getElementsByName("role");
   var group =document.getElementsByName("group");
   var staff =document.getElementsByName("staff_no");
   var auth_level =document.getElementsByName("auth_level");

	for(i =0; i<position.length; i++)
	{
		if(position[i].checked)
		{
			if(positions =='')
			{
				tmp =position[i].value.split(",");
				positions =tmp[1];
				//positionids =tmp[1];
			}
			else  
			{
				tmp =position[i].value.split(",");
				//positions +=','+tmp[2];
				positions +=','+tmp[1];
			}
		}
	}   
	for(i =0; i<site.length; i++)
	{
		if(site[i].checked)
		{
			if(sites =='')
			{
				tmp =site[i].value.split(",");
				sites =tmp[1];
				//positionids =tmp[1];
			}
			else  
			{
				tmp =site[i].value.split(",");
				//positions +=','+tmp[2];
				sites +=','+tmp[1];
			}
		}
	}   

   for(i =0; i<group.length; i++)
   {
      if(group[i].checked)
      {
         if(groups =='')   groups +=group[i].value
         else  groups +=','+group[i].value
      }
   }   

   for(i =0; i<role.length; i++)
   {
      if(role[i].checked)
      {
         if(roles =='')   roles +=role[i].value
         else  roles +=','+role[i].value
      }
   }   

	for(i =0; i<staff.length; i++)
	{
		if(staff[i].checked)
		{
			if(staffs =='')
			{
				tmp =staff[i].value.split(",");
				staffs =tmp[1].substring(1);
			}
			else  
			{
				tmp =staff[i].value.split(",");
				staffs +=','+tmp[1].substring(1);
			}
		}
	}

   for(i =0; i<auth_level.length; i++)
   {
      if(auth_level[i].checked)
      {
         if(auth_levels =='')   auth_levels +=auth_level[i].value
         else  auth_levels +=','+auth_level[i].value
      }
   }   
   document.all.positions.value =positions;
   document.all.sites.value =sites;
   document.all.roles.value =roles;
   document.all.groups.value =groups;
   document.all.staffs.value =staffs;
   document.all.auth_levels.value =auth_levels;
   document.all.managers.value =managers;

	var s=new Server("doTableGrant");
	s.setFormData();
	$E.disabled();
	//*
	s.send(s, false, function(){
			alert("授权成功！");
			$E.abled();
		}
	);
	
	//document.all.table_grant.submit();
}
function checkall(checkname,state){
   var el_collection=document.getElementsByName(checkname);
   for (c=0;c<el_collection.length;c++)
      el_collection[c].checked=state
}

function onSelectAll(handle)
{
   for(i=1;i<=6;i++)
   {
      if(document.all("tab"+i).background =='tab1.gif')
      {
         if(i ==1)
            checkall("position", handle.checked);            
         else if(i ==2)
            checkall("site", handle.checked);            
         else if(i ==3)
            checkall("role", handle.checked);            
         else if(i ==4)
            checkall("group", handle.checked);            
         else if(i ==5)
            checkall("staff", handle.checked);            
      }
   }
}
//-->
</script>
<body>
<link type="text/css" rel="stylesheet" href="<%=GlobalUtil._WEB_PATH%>/res/css/xtree.css">
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree2.js"></script>
<table width="100%" height="425" border="1" bordercolor="3B87D1" bordercolorlight="#FFFFFF" cellpadding="0" cellspacing="0">
   <tr bgcolor="A4B9D7" height="20">
      <td valign=top>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr align="center">
         <td colspan="6" height=1><img src="c.gif" width="485" height="1"></td>
         </tr>
         <tr align="center">
         <td width="82" height="20" background="tab2.gif" id=tab1 onclick="javascript:tabclick(1);" style="cursor=hand">岗位</td>

         <td width="82" height="20" background="tab2.gif" id=tab2 onclick="javascript:tabclick(2);" style="cursor=hand">部门</td>

         <td width="82" height="20" background="tab2.gif" id=tab3 onclick="javascript:tabclick(3);" style="cursor=hand">角色</td>
         <td width="82" height="20" background="tab2.gif" id=tab4 onclick="javascript:tabclick(4);" style="cursor=hand">群组</td>
         <td width="82" height="20" background="tab2.gif" id=tab5 onclick="javascript:tabclick(5);" style="cursor=hand">人员</td>
         <td width="82" height="20" background="tab2.gif" id=tab6 onclick="javascript:tabclick(6);" style="cursor=hand">权限等级</td>
         </tr>
         </table>
         </td>
         <td width=100%>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td height="1"></td>
            </tr>
         </table>
      </td>
   </tr>
   <tr>
      <$:A service="getZonesStaff" dynamic="false"/>
      <$:M dtype="1"/>
      <td valign=top>
         <div id="div1" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
				<$:A service="getPositionTree" dynamic="true"/>
				<$:M dtype="1"/>
				<%
					if(ServletUtil.getResult(request,"POSITIONTREE") !=null)
					{
						DataSet alTree =(DataSet)ServletUtil.getResult(request,"POSITIONTREE");
						%>
						<$:Tree treeData="<%=alTree%>" head="组织机构岗位" pidF="UP_POSI_NO" idF="POSI_NO" pid="0" titleF="POSI_NAME" hiddenF="UP_POSI_NO,POSI_NO,POSI_NAME" icon="pic.gif" checkbox="position" checkboxtype="1"/>
						<%
					}
				%>
            </DIV>  
         </div>       
         <div id="div2" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
				<$:A service="getSysSites" dynamic="true"/>
				<$:M dtype="1"/>
				<%
					if(ServletUtil.getResult(request,"Sites") !=null)
					{
						DataSet alTree =(DataSet)ServletUtil.getResult(request,"Sites");
						%>
						<$:Tree treeData="<%=alTree%>" head="组织机构部门" pidF="UP_SITE_NO" idF="SITE_NO" pid="0" titleF="SITE_NAME" hiddenF="UP_SITE_NO,SITE_NO,SITE_NAME" icon="pic.gif" checkbox="site" checkboxtype="1"/>
						<%
					}
				%>
            </DIV>
         </div>
         <div id="div3" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" width="100%" border=0>	
               <tr>
                  <td bgColor="silver" width=1% nowrap colspan=2><$:I item="sm_role.role_name"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type=checkbox onClick='onSelectAll(this)' class='radio' id="allRole"><label for="allRole" style='cursor:hand'>全选</label></td>
               </tr>
<%
   if(ServletUtil.getResult(request,"ROLE") !=null)
   {
      DataSet alRole =(DataSet)ServletUtil.getResult(request,"ROLE");
      StringBuffer html =new StringBuffer();
            int j=0;
            if(alRole !=null)
               for(int k=0; k<alRole.size(); k++)
               {
                  Row hmRole =(Row)alRole.get(k);
                  if(j>0 && j%2 ==0)
                     html.append("\n</td>\n</tr>");
                  else
                     html.append("\n</td>");
                  if(j%2 ==0)
                     html.append("\n<tr>\n<td nowrap>");
                  else
                     html.append("\n<td nowrap>");
                  html.append("&nbsp;&nbsp;<input class='radio' type=checkbox name=\"role\"  value='"+hmRole.get("ROLE_ID").toString()+"' id='r"+hmRole.get("ROLE_ID").toString()+"' class='radio'><label for='r"+hmRole.get("ROLE_ID").toString()+"'  style='cursor:hand'>"+hmRole.get("ROLE_NAME").toString()+"</label>");
                  j++;
               }
      out.println(html.toString());
   }
%>
            </table>
            </DIV>
         </div>
         <div id="div4" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" width="100%" border=0>	
               <tr>
                  <td bgColor="silver" width=1% nowrap colspan=3><$:I item="sm_group.group_name"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type=checkbox onClick='onSelectAll(this)' class='radio' id="allGroup"><label for="allGroup" style='cursor:hand'>全选</label></td>
               </tr>
<%
   if(ServletUtil.getResult(request,"GROUP") !=null)
   {
      DataSet alGroup =(DataSet)ServletUtil.getResult(request,"GROUP");
      StringBuffer html =new StringBuffer();
            int j=0;
            if(alGroup !=null)
               for(int k=0; k<alGroup.size(); k++)
               {
                  Row hmGroup =(Row)alGroup.get(k);
                  if(j>0 && j%3 ==0)
                     html.append("\n</td>\n</tr>");
                  else
                     html.append("\n</td>");
                  if(j%3 ==0)
                     html.append("\n<tr>\n<td nowrap>");
                  else
                     html.append("\n<td nowrap>");
                  html.append("&nbsp;&nbsp;<input class='radio' type=checkbox name=\"group\"  value='"+hmGroup.get("GROUP_ID").toString()+"' id='g"+hmGroup.get("GROUP_ID").toString()+"' class='radio'><label for='g"+hmGroup.get("GROUP_ID").toString()+"'  style='cursor:hand'>"+hmGroup.get("GROUP_NAME").toString()+"</label>");
                  j++;
               }
      out.println(html.toString());
   }
%>

            </table>
            </DIV>
         </div>
         <div id="div5" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
				<$:A service="getDeptStaffTree" dynamic="false"/>
				<$:M dtype="1"/>
				<%
					if(ServletUtil.getResult(request,"DEPTSTAFF") !=null)
					{
						DataSet alTree =(DataSet)ServletUtil.getResult(request,"DEPTSTAFF");
						%>
						<$:Tree treeData="<%=alTree%>" head="部门人员树" pidF="UP_ID" idF="ID" pid="0" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif" checkbox="[0,site_no][2,staff_no]" checkboxtype="1" jsMethod="onSelectStaff"/>
						<%
					}
				%>
            </DIV>
         </div>
         <div id="div6" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" width="100%" border=0>	
				<$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="AUTH_LEVEL"/>
			 </$:A> <$:M dtype="1"/>
               <tr>
                 <td bgColor="silver" width=1% nowrap colspan=3>权限等级：</td>
               </tr>
<%
   if(ServletUtil.getResult(request,"AUTH_LEVEL") !=null)
   {
      DataSet alPremision =(DataSet)ServletUtil.getResult(request,"AUTH_LEVEL");
      StringBuffer html =new StringBuffer();
            int j=0;
            if(alPremision !=null)
               for(int k=0; k<alPremision.size(); k++)
               {
                  Row hmPrem =(Row)alPremision.get(k);
                  if(j>0 && j%3 ==0)
                     html.append("\n</td>\n</tr>");
                  else
                     html.append("\n</td>");
                  if(j%3 ==0)
                     html.append("\n<tr>\n<td nowrap>");
                  else
                     html.append("\n<td nowrap>");
                  html.append("&nbsp;&nbsp;<input class='radio' type=checkbox name=\"auth_level\"  value='"+hmPrem.get("USED_VIEW").toString()+"' id='a"+hmPrem.get("USED_VIEW").toString()+"' class='radio'><label for='a"+hmPrem.get("USED_VIEW").toString()+"'  style='cursor:hand'>"+hmPrem.get("DISP_VIEW").toString()+"</label>");
                  j++;
               }
      out.println(html.toString());
   }
%>
            </table>
            </DIV>
         </div>
      </td>
   </tr>
</table>
<div align=center>
<input type="button" value=<$:I item="html.button.save"/>   onclick="onGrant()"><input type="button" value=<$:I item="html.button.close"/>   onclick="window.close();">
</div>
<script>
   tabclick(1);   
</script>
<form name="table_grant">
   <input type=hidden name="positions">
   <input type=hidden name="sites">
   <input type=hidden name="roles">
   <input type=hidden name="groups">
   <input type=hidden name="staffs">
   <input type=hidden name="auth_levels">
   <input type=hidden name="managers">
   <input type=hidden name="table_ename" value ='<$:W name="table_ename" from="request"/>'>
   <input type=hidden name="prem_type" value ='<$:W name="prem_type" from="request"/>'>
</form>
</body>
<$:A service="getTableGrant" dynamic="true">
   <$:P name="table_ename" from="request"/>
   <$:P name="prem_type" from="request"/>
</$:A>
<$:M dtype="1"/>
<script>
var arData =new Array;
var i=0;
<$:T var="grant" name="TableGrant">
   arData[i] ='<$:C item="grant.GRANT_TYPE"/><$:C item="grant.ID"/>';
   i ++;
</$:T>

var position =document.all.position;
var site =document.all.site;
var role =document.all.role;
var group =document.all.group;
var staff =document.all.staff;
var auth_level =document.all.auth_level;
var manager =document.all.manager;

for(j=0; j<arData.length; j++)
{
   type =arData[j].charAt(0);
   value =arData[j].substring(1, arData[j].length);
   if(type ==1)//岗位
   {
      for(k=0; k<position.length; k++)
         if(position[k].value ==value)
            position[k].checked =true;
   }
   else if(type ==2)//部门
   {
      for(k=0; k<site.length; k++)
         if(site[k].value ==value)
            site[k].checked =true;
   }
   else if(type ==3)//角色
   {
      for(k=0; k<role.length; k++)
         if(role[k].value ==value)
            role[k].checked =true;
   }

   else if(type ==4)//群组
   {
      for(k=0; k<group.length; k++)
         if(group[k].value ==value)
            group[k].checked =true;
   }
   else if(type ==5)//人员
   {
      for(k=0; k<staff.length; k++)
         if(staff[k].value ==value)
            staff[k].checked =true;
   }
   else if(type ==6)//权限等级
   {
      for(k=0; k<auth_level.length; k++)
         if(auth_level[k].value ==value)
            auth_level[k].checked =true;
   }
   else if(type ==7)//管理者
   {
      for(k=0; k<manager.length; k++)
         if(manager[k].value ==value)
            manager[k].checked =true;
   }
}
function onDataPremission(swf_no, map_id)
{
   runOpen('<%=GlobalUtil._WEB_PATH%>/system/workflow/DataPremission.jsp?SWF_NO='+swf_no+"&MAP_ID="+map_id,true, 520, 500);
  
}
function onSelectStaff(handle)
{
	var pids =handle.value;
	var pid =pids.split(",")[1];
	var staffs =document.getElementsByName("staff_no");
	var sites =document.getElementsByName("site_no");
	for(var m =0; m<staffs.length; m++)
	{
		svalue =staffs[m].value;
		spid =svalue.split(",")[0];
		if(spid ==pid)
			staffs[m].checked =handle.checked;
	}
	for(var n =0; n<sites.length; n++)
	{
		svalue =sites[n].value;
		spid =svalue.split(",")[0];
		if(spid ==pid)
		{
			sites[n].checked =handle.checked;
			onSelectStaff(sites[n]);
		}
	}
	return false;
}

</script>

