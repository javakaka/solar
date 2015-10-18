<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
Identity oUser=(Identity)session.getAttribute("user");
if(oUser !=null)
{
	String sOffStaffNo =oUser.get("staff-no").toString();
	//清除在线人员信息
	com.juts.web.status.OnlineUsers.removeUser(sOffStaffNo);
}
session.removeAttribute("user");
%>
<script>
window.close();
</script>
