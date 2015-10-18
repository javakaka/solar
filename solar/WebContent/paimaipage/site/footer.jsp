<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%
String from_user =request.getParameter("from_user");
if(from_user == null || from_user.replace(" ", "").length() == 0)
{
	from_user ="";
}
%>
<div id="footer_bottom">
    <!-- S 底部固定菜单 -->
    <div class="flight-footer" style="z-index:100000;">
        <ul>
            <li id="flightSearch" class="ft1" onclick="location.href = 'index.do?from_user=<%=from_user%>'">进入会场</li>
            <li id="flightHelper" class="ft2 current" onclick="location.href = 'index-hot.do?from_user=<%=from_user%>'">热拍单品</li>
            <li id="flightSchedule" class="ft3" onclick="location.href = 'index-user-home.do?from_user=<%=from_user%>'">我的</li>
        </ul>
    </div>
    <!-- E 底部固定菜单 -->
</div>