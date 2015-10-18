<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
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
      document.all("tab"+i).background="<%=GlobalUtil._WEB_PATH%>/res/images/tab2.gif";
      eval(layerRef+'["div'+i+'"]'+styleRef+'visibility="hidden"')    
   }
   document.all("tab"+index).background="<%=GlobalUtil._WEB_PATH%>/res/images/tab1.gif";
	eval(layerRef+'["div'+index+'"]'+styleRef+'visibility="visible"') 
}
function onGrant()
{
   var positions ='',sites ='', roles ='', groups ='', rela_comm_posis ='', abs_comm_posis ='';
   var positionids ='',siteids ='', roleids ='', groupids ='', rela_comm_posiids ='', abs_comm_posiids ='';
   
	var staffs ='', auth_levels ='', workflows ='',fpu_staffs ='', rela_level_posis='', abs_level_posis ='';
   var staffids ='', auth_levelids ='', workflowids ='', fpu_staffids ='', rela_level_posiids='', rela_level_posiids ='';

	var position =document.getElementsByName("position");
   var site =document.getElementsByName("site");
   var role =document.getElementsByName("role");
   var group =document.getElementsByName("group");
   var staff =document.getElementsByName("staff_no");
   var auth_level =document.getElementsByName("auth_level");
	
	/*
	var abs_comm_posi =document.getElementsByName("abs_comm_posi");
	var abs_comm_posi_id =document.getElementsByName("abs_comm_posi_id");
	var abs_level_posi =document.getElementsByName("abs_level_posi");
	*/
	var text, id;
	for(i =0; i<position.length; i++)
	{
		if(position[i].checked)
		{
			if(positions =='')
			{
				tmp =position[i].value.split(",");
				positions =tmp[2];
				positionids =tmp[1];
			}
			else  
			{
				tmp =position[i].value.split(",");
				positions +='.'+tmp[2];
				positionids +='.'+tmp[1];
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
				sites =tmp[2];
				siteids =tmp[1];
			}
			else  
			{
				tmp =site[i].value.split(",");
				sites +='.'+tmp[2];
				siteids +='.'+tmp[1];
			}
      }
   }   
   for(i =0; i<role.length; i++)
   {
      if(role[i].checked)
      {
			if(roles =='')
			{
				tmp =role[i].value.split(",");
				roles =tmp[1];
				roleids =tmp[0];
			}
			else  
			{
				tmp =role[i].value.split(",");
				roles +='.'+tmp[1];
				roleids +='.'+tmp[0];
			}
      }
   }   
   for(i =0; i<group.length; i++)
   {
      if(group[i].checked)
      {
			if(groups =='')
			{
				tmp =group[i].value.split(",");
				groups =tmp[1];
				groupids =tmp[0];
			}
			else  
			{
				tmp =group[i].value.split(",");
				groups +='.'+tmp[1];
				groupids +='.'+tmp[0];
			}
      }
   }   
   for(i =0; i<staff.length; i++)
   {
      if(staff[i].checked)
      {
			if(staffs =='')
			{
				tmp =staff[i].value.split(",");
				staffs =tmp[2];
				staffids =tmp[1].substring(1);
			}
			else  
			{
				tmp =staff[i].value.split(",");
				staffs +='.'+tmp[2];
				staffids +='.'+tmp[1].substring(1);
			}
      }
   }
   for(i =0; i<auth_level.length; i++)
   {
      if(auth_level[i].checked)
      {
			if(auth_levels =='')
			{
				tmp =auth_level[i].value.split(",");
				auth_levels =tmp[1];
				auth_levelids =tmp[0];
			}
			else  
			{
				tmp =auth_level[i].value.split(",");
				auth_levels +='.'+tmp[1];
				auth_levelids +='.'+tmp[0];
			}
      }
   }
	/*
	for(i =0; i<comm_posi.length; i++)
	{
		if(comm_posi[i].checked && !comm_posi_id[i].disabled)
		{
			var comm_posiid =comm_posi[i].value.split("=")[0];
			var comm_posi_text =comm_posi[i].value.split("=")[1];
			var posi_level_id =comm_posi_id[i].value;
			var posi_level_text =comm_posi_id[i].options[comm_posi_id[i].selectedIndex].text;
			if(posi_level_id !="")
			{
				if(comm_posis =="")
				{
					comm_posiids =posi_level_id+"="+comm_posiid;
					comm_posis =posi_level_text+comm_posi_text;
				}
				else
				{
					comm_posiids +=','+posi_level_id+"="+comm_posiid;
					comm_posis +=','+posi_level_text+comm_posi_text;
				}
			}
		}
	}
	for(i=0; i<document.all.level_posi.length; i++)
	{
		if(document.all.level_posi.options[i].selected)
		{
			if(document.all.level_posi.options[i].value =="")
				continue;
			if(level_posis =='')
			{
				level_posis =document.all.level_posi[i].text;
				level_posiids =document.all.level_posi.options[i].value;
			}
			else  
			{
				level_posis +=','+document.all.level_posi[i].text;
				level_posiids +=','+document.all.level_posi.options[i].value;
			}
		}
	}
	*/

	var text ="", id ="";
	if(positions !='')
	{
		text +="■岗位["+positions+"]\n";
		id +=",position:"+positionids;
	}
	if(sites !='')
	{
		text +="■部门["+sites+"]\n";
		id +=",site:"+siteids;
	}
	if(roles !='')
	{
		text +="■角色["+roles+"]\n";
		id +=",role:"+roleids;
	}
	if(groups !='')
	{
		text +="■群组["+groups+"]\n";
		id +=",group:"+groupids;
	}
	if(staffs !='')
	{
		text +="■人员["+staffs+"]\n";
		id +=",staff:"+staffids;
	}
	if(auth_levels !='')
	{
		text +="■权限等级["+auth_levels+"]\n";
		id +=",auth_level:"+auth_levelids;
	}

	if(id.length >0)
		id =id.substring(1);
	//alert(id);
	//alert(text);
	window.returnValue =text+"|"+id;
	window.close();

	/*
	document.all.positions.value =positions;
   document.all.sites.value =sites;
   document.all.roles.value =roles;
   document.all.groups.value =groups;
   document.all.staffs.value =staffs;
   document.all.auth_levels.value =auth_levels;
   document.all.managers.value =managers;
	*/
   //alert(document.all.table_grant.table_ename.value);
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
      if(document.all("tab"+i).background =='<%=GlobalUtil._WEB_PATH%>/images/tab1.gif')
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
			{
     			checkall("site_no", handle.checked);  
            checkall("staff_no", handle.checked);	
			}
      }
   }
}
function onInit()
{
	<%if(request.getParameter("ids") !=null){%>
	var position =document.all.position;
   var site =document.all.site;
   var role =document.all.role;
   var group =document.all.group;
   var staff =document.getElementsByName("staff_no");
   var auth_level =document.all.auth_level;

	var id ='<%=request.getParameter("ids")%>';
	var ids =id.split(",");
	for(i=0; i<ids.length; i++)
	{
		if(ids[i].indexOf("position:") ==0)
		{
			iids =ids[i].substring("position:".length);
			iid =iids.split(".");
			for(k=0; k<iid.length; k++)
			{
				for(j=0; j<position.length; j++)
				{
					tmp =position[j].value.split(",");
					if(tmp[1] ==iid[k])
					{
						position[j].checked =true;
						break;
					}
				}
			}
		}
		else if(ids[i].indexOf("site:") ==0)
		{
			iids =ids[i].substring("site:".length);
			iid =iids.split(".");
			for(k=0; k<iid.length; k++)
			{
				for(j=0; j<site.length; j++)
				{
					tmp =site[j].value.split(",");
					if(tmp[1] ==iid[k])
					{
						site[j].checked =true;
						break;
					}
				}
			}
		}
		else if(ids[i].indexOf("role:") ==0)
		{
			iids =ids[i].substring("role:".length);
			iid =iids.split(".");
			for(k=0; k<iid.length; k++)
			{
				for(j=0; j<role.length; j++)
				{
					tmp =role[j].value.split(",");
					if(tmp[0] ==iid[k])
					{
						role[j].checked =true;
						break;
					}
				}
			}
		}
		else if(ids[i].indexOf("group:") ==0)
		{
			iids =ids[i].substring("group:".length);
			iid =iids.split(".");
			for(k=0; k<iid.length; k++)
			{
				for(j=0; j<group.length; j++)
				{
					tmp =group[j].value.split(",");
					if(tmp[0] ==iid[k])
					{
						group[j].checked =true;
						break;
					}
				}
			}
		}
		else if(ids[i].indexOf("staff:") ==0)
		{
			iids =ids[i].substring("staff:".length);
			iid =iids.split(".");
			for(k=0; k<iid.length; k++)
			{
				for(j=0; j<staff.length; j++)
				{
					tmp =staff[j].value.split(",");
					if(tmp[1] ==("S"+iid[k]))
					{
						staff[j].checked =true;
						break;
					}
				}
			}
		}
		else if(ids[i].indexOf("auth_level:") ==0)
		{
			iids =ids[i].substring("auth_level:".length);
			iid =iids.split(".");
			for(k=0; k<iid.length; k++)
			{
				for(j=0; j<auth_level.length; j++)
				{
					tmp =auth_level[j].value.split(",");
					if(tmp[0] ==iid[k])
					{
						auth_level[j].checked =true;
						break;
					}
				}
			}
		}
	}
	<%}%>
}
//-->
</script>
<body onLoad="onInit()">
<link type="text/css" rel="stylesheet" href="<%=GlobalUtil._WEB_PATH%>/res/css/xtree.css">
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree2.js"></script>
<table width="100%" height="450" border="1" cellpadding="0" cellspacing="0">
   <tr bgcolor="A4B9D7" height="20">
      <td valign=top>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr align="center">
         <td colspan="6" height=1><img src="c.gif" width="485" height="1"></td>
         </tr>
         <tr align="center">
         <td width="82" height="20" background="<%=GlobalUtil._WEB_PATH%>/images/tab2.gif" id=tab1 onclick="javascript:tabclick(1);" style="cursor=hand">岗位</td>
         <td width="82" height="20" background="<%=GlobalUtil._WEB_PATH%>/images/tab2.gif" id=tab2 onclick="javascript:tabclick(2);" style="cursor=hand">部门</td>
         <td width="82" height="20" background="<%=GlobalUtil._WEB_PATH%>/images/tab2.gif" id=tab3 onclick="javascript:tabclick(3);" style="cursor=hand">角色</td>
         <td width="82" height="20" background="<%=GlobalUtil._WEB_PATH%>/images/tab2.gif" id=tab4 onclick="javascript:tabclick(4);" style="cursor=hand">群组</td>
         <td width="82" height="20" background="<%=GlobalUtil._WEB_PATH%>/images/tab2.gif" id=tab5 onclick="javascript:tabclick(5);" style="cursor=hand">人员</td>
         <td width="82" height="20" background="<%=GlobalUtil._WEB_PATH%>/images/tab2.gif" id=tab6 onclick="javascript:tabclick(6);" style="cursor=hand">权限等级</td>
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
            <DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" border=0>	
					<tr>
						<td>
	<table width="100%"  border="0" cellpadding="0" cellspacing="2" valign="top">
	  <tr>
		<td valign="top">
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
		</td>
	  </tr>
	</table>

						</td>
					</tr>
				</table>
            </DIV>  
         </div>       
         <div id="div2" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" width="100%" border=0>	
					<tr>
						<td>
						<DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 320px">
							<table width="100%"  border="0" cellpadding="0" cellspacing="2" valign="top">
							  <tr>
								<td valign="top">
									<$:A service="getBureauTree" dynamic="false"/>
									<$:M dtype="1"/>
									<%
										if(ServletUtil.getResult(request,"SITES") !=null)
										{
											DataSet alTree =(DataSet)ServletUtil.getResult(request,"SITES");
											%>
											<$:Tree treeData="<%=alTree%>" head="组织机构部门" pidF="UP_SITE_NO" idF="SITE_NO" pid="-1" titleF="SITE_NAME" hiddenF="UP_SITE_NO,SITE_NO,SITE_NAME" icon="pic.gif" checkbox="site" checkboxtype="1"/>
											<%
										}
									%>
								</td>
							  </tr>
							</table>
						</DIV>
						</td>
					</tr>
            </table>
            </DIV>
         </div>
         <div id="div3" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
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
                  html.append("&nbsp;&nbsp;<input class='radio' type=checkbox name=\"role\"  value='"+hmRole.get("ROLE_ID").toString()+","+hmRole.get("ROLE_NAME").toString()+"' id='r"+hmRole.get("ROLE_ID").toString()+"' class='bt'><label for='r"+hmRole.get("ROLE_ID").toString()+"'  style='cursor:hand'>"+hmRole.get("ROLE_NAME").toString()+"</label>");
                  j++;
               }
      out.println(html.toString());
   }
%>
            </table>
            </DIV>
         </div>
         <div id="div4" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
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
                  html.append("&nbsp;&nbsp;<input class='radio' type=checkbox name=\"group\"  value='"+hmGroup.get("GROUP_ID").toString()+","+hmGroup.get("GROUP_NAME").toString()+"' id='g"+hmGroup.get("GROUP_ID").toString()+"' class='bt'><label for='g"+hmGroup.get("GROUP_ID").toString()+"'  style='cursor:hand'>"+hmGroup.get("GROUP_NAME").toString()+"</label>");
                  j++;
               }
      out.println(html.toString());
   }
%>

            </table>
            </DIV>
         </div>
         <div id="div5" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" width="100%" border=0>	
<tr>
<td>
	<table width="100%"  border="0" cellpadding="0" cellspacing="2" valign="top">
	  <tr>
		<td valign="top">
			<$:A service="getDeptStaffTree" dynamic="false"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request,"DEPTSTAFF") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request,"DEPTSTAFF");
					%>
					<$:Tree treeData="<%=alTree%>" head="部门人员树" pidF="UP_ID" idF="ID" pid="-1" titleF="NAME" hiddenF="UP_ID,ID,NAME,TYPE" typeF="TYPE" icon="pic.gif" checkbox="[0,site_no][4,staff_no]" checkboxtype="1" jsMethod="onSelectStaff"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
</td>
</tr></table>
            </DIV>
         </div>
         <div id="div6" style="position:absolute; width:100%; height:95%; visibility: hidden"> 
            <DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
            <table id="tabMain" name="tabMain" cellpadding="3" width="100%" border=0>	
               <$:A service="getSysDictoryItems" dynamic="false">
                  <$:P name="item" value="AUTH_LEVEL"/>
               </$:A>
               <$:M dtype="1"/>
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
                  html.append("&nbsp;&nbsp;<input class='radio' type=checkbox name=\"auth_level\"  value='"+hmPrem.get("USED_VIEW").toString()+","+hmPrem.get("DISP_VIEW").toString()+"' id='a"+hmPrem.get("USED_VIEW").toString()+"' class='bt'><label for='a"+hmPrem.get("USED_VIEW").toString()+"'  style='cursor:hand'>"+hmPrem.get("DISP_VIEW").toString()+"</label>");
                  j++;
               }
      out.println(html.toString());
   }
%>
               <tr>
                 <td width=1% nowrap>&nbsp;&nbsp;</td>
               </tr>
            </table>
            </DIV>
         </div>
      </td>
   </tr>
</table>
<div align=center>
<input type="button" value=<$:I item="html.button.save"/> class="btnofirst" onclick="onGrant()"><input type="button" value=<$:I item="html.button.close"/> class="btnofirst" onclick="window.close();">
</div>
<script>
   tabclick(1);   
</script>
</body>
<script>
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

