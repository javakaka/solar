<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sStaffNo =((Identity)session.getAttribute("user")).get("staff-no").toString();
%>
<$:A service="getWaitDeploy" dynamic="false"/>
<$:M dtype="1"/>
<body topmargin=0 leftmargin=0 style="BACKGROUND: url(<%=GlobalUtil._WEB_PATH%>/images/daibangongzuo.jpg) fixed no-repeat" >
<%
String sDeployId =ServletUtil.get(request,"deploy_id");
DataSet alAllIssue =new DataSet();
if(ServletUtil.getResult(request, "WAITDEPLOY") !=null)
{
	DataSet al =(DataSet)ServletUtil.getResult(request, "WAITDEPLOY");
	for(int i=0;i<al.size();i++)
	{
			Row hm=(Row)al.get(i);		
			String sDeployName=(String)hm.get("DEPLOY_NAME");
			String sDeployID=(String)hm.get("DEPLOY_ID");
		%>
      <$:A service="getIssue" dynamic="false" pagesize="4">
         <$:P name="deploy_id" value="<%=sDeployID%>"/>
			<$:P name="staff_no" value="<%=sStaffNo%>"/>
      </$:A>
		<$:M dtype="1"/>
		<%
		if(ServletUtil.getResult(request, "WAITISSUE") !=null)
		{
			DataSet alTmp =(DataSet)ServletUtil.getResult(request, "WAITISSUE");
			if(alTmp !=null)
				for(int j=0; j<alTmp.size(); j++)
				{
					Row tmp =(Row)alTmp.get(j);
					tmp.put("DEPLOY_ID",sDeployID);
					tmp.put("DEPLOY_NAME", sDeployName);
					alAllIssue.add(tmp);
				}
		}

		}
%>
	<table id="tabMain" name="tabMain" border=0 cellpadding=0 cellspacing=0 width=100%>	
		<tr>
			<td><table width=100%><tr><td width=55 nowrap><font color=red>□</font>签收:</td><td>
				<MARQUEE scrollAmount=1 scrollDelay=45 align="middle">
				<$:A service="getSignPreparedThing" dynamic="false"/>
				<$:M dtype="1"/>
				<$:T var="sign" name="SIGN_THINGS">
					<a onClick="onSign('<$:C item="sign.WF_NO"/>','<$:C item="sign.CARD"/>','<$:C item="sign.FPU_NO"/>')" style="cursor:hand"><$:C item="sign.WF_NAME"/>[<$:C item="sign.ACTION_NAME"/>]</a>
				</$:T>
				</MARQUEE></td></tr></table>
			</td>
		</tr>
		<tr>
			<td height=1 bgcolor="#C6EBFF"></td>
		</tr>
		<tr>
			<td align=left><table border=0 cellpadding=0 cellspacing=0 width=100%><tr><td>
			<%if(sDeployId !=null)
			{%>
				<a href="issue.jsp">所有待办事项</a>
			<%}%></td><td align=left><%="共有待办[<font color=\"red\"><b>"+alAllIssue.size()+"</font></b>]件待办事项"%>	
</td></tr></table>
			</td>
		</tr>
		<tr>
			<td height=1 bgcolor="#C6EBFF"></td>
		</tr>
		<tr>
			<td>
		<DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"> 
		<table id="tabMain" name="tabMain" cellpadding="1" border="0" width="100%">	
		<%for(int k=0; k<alAllIssue.size(); k++)
		{
			Row hmTmp =(Row)alAllIssue.get(k);
			String sUrl = hmTmp.get("URL")==null?"":hmTmp.get("URL").toString();
			if(sUrl.length() !=0)
			{
				if(sUrl.toUpperCase().indexOf("HTTP://") ==-1)
				{
					if(sUrl.indexOf("///") ==-1)
						sUrl =GlobalUtil._WEB_PATH+sUrl;
					else
						sUrl =sUrl.substring(2);
				}
			}
			%>
			<tr>
				<td>
				[<a href='issue.jsp?deploy_id=<%=hmTmp.get("DEPLOY_ID")%>'><%=hmTmp.get("EVENT_CLASS")%></a>]:<a onclick=javascript:parent.window.document.location='<%=sUrl.trim()%>' style="cursor:hand"><%=hmTmp.get("EVENT_NAME")%></a>
				</td>
			</tr>
			<%
		}%>
		</table>
		</DIV>
			</td>
		</tr>
	</table>
<%}%>
</body>
<script>
function onSign(wf_no, card, fpu_no)
{
	parent.window.document.location.href ="<%=GlobalUtil._WEB_PATH%>/system/card/flow_sign.jsp?WF_NO="+wf_no+"&CARD="+card+"&FPU_NO="+fpu_no;
}
</script>