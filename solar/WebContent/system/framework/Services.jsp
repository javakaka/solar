<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="<%=GlobalUtil._WEB_PATH%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=GlobalUtil._WEB_PATH%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onLoad="initTab()">
<div id="idTab">
</div>
<div align=center>
<$:I item="fm_services.service_name"/>&raquo;&nbsp;<input type=text name="service_name" value='<$:W name="service_name" from="request" default=""/>' size="20"><$:I item="fm_services.service_desc"/><input type=text name="service_desc" value='<$:W name="service_desc" from="request" default=""/>'size="20"><input type="button" value=<$:I item="html.button.query"/>  onClick="onQueryService()">
<table width=100%>
	<tr>
	<td width=70%>
		<iframe id="idTabFrame" width="100%" frameborder="0" src="" height="400"></iframe>
	</td>
	<td width=30% valign=top>
		<table width=100%>
			<tr>
				<td>	
					<FIELDSET>
						<LEGEND>
						已选择服务：
						</LEGEND>
						<table height=370>
							<tr><td id="idTdSelectService" valign=top>
							</td></tr>
						</table>
					</FIELDSET>
				</td>
			</tr>
		</table>
	</td>
	</tr>
	<tr>
		<td colspan=2 align=right>
		<!-- <input type="button" value="不绑定服务"  onClick="onCloseWindow(2)"> --><input type="button" value=<$:I item="html.button.ok"/> onClick="onBind()" ><input type="button" value=<$:I item="html.button.close"/> onClick="window.close()" >
		</td>
	</tr>
</table>
</div>
</BODY>
</HTML>
<script>
var oBindServices =new Array();
var oBindDynaServices =new Array();
function initTab()
{
	Tabs.add("Service", "服务", "Service.jsp");
	Tabs.add("DynaAction", "动态服务", "DynaService.jsp");
	Tabs.write("业务逻辑服务", idTabFrame, idTab);
	Tabs.select("Service");
}

function onQueryService()
{
	Tabs.changeurl("Service", "Service.jsp?service_name="+$V("service_name") +"&service_desc="+$V("service_desc"));
	Tabs.changeurl("DynaAction", "DynaService.jsp?service_name="+$V("service_name") +"&service_desc="+$V("service_desc"));
	Tabs.select("Service");
}

//设置已选择服务
function viewBindServices()
{
	var sHtml ="";
	for(i=0; i<oBindServices.length; i++)
	{
		var oService =oBindServices[i];
		sHtml +="<input type=checkbox name='service' checked value="+oService.join(",")+">"+oService[1]+"<br>&nbsp;&nbsp;&nbsp;&nbsp;"+oService[2]+"<br>";
	}
	for(i=0; i<oBindDynaServices.length; i++)
	{
		var oService =oBindDynaServices[i];
		sHtml +="<input type=checkbox name='service' checked value="+oService.join(",")+">[<FONT COLOR='#0000FF'>动态</FONT>]"+oService[1]+"<br>&nbsp;&nbsp;&nbsp;&nbsp;"+oService[2]+"<br>";
	}
	idTdSelectService.innerHTML =sHtml;
}

//绑定服务
function onBind()
{
   var handle =document.getElementsByName("service");
	var desc ="",name ="", type ="";
   for(i=0; i<handle.length; i++)
   {
	   if(handle[i].checked)
      {
         tmp =handle[i].value.split(",");
			if(name =="")
			{
				name =tmp[1];
				type =tmp[0];
				desc ="■"+tmp[2];
			}
			else
			{
				name +=","+tmp[1];
				type +=","+tmp[0];
				desc +=",\n■"+tmp[2];
			}
      }
   }
	if(name !='')
	{
		var cc =name+"."+type+"."+desc;
		parent.window.returnValue =cc.split(".");
		parent.window.close();
		return true;
	}
	else
		$E.message("请选择一条绑定记录！");
   return false;
}
</script>