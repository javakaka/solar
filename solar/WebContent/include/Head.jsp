<%@ taglib uri="/$.tld" prefix="$" %>
<%@ page import="java.util.*, com.juts.utility.*,com.juts.web.status.*,com.juts.framework.license.SystemInfo,com.juts.web.utility.ServletUtil,com.juts.framework.vo.*,com.juts.framework.engine.Action"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
%>
<html>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Juts.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Http.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Check.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Server.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Web.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Layer.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Message.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tip.js"></script>
<link href="<%=GlobalUtil._WEB_PATH%>/res/css/Style.css" rel="stylesheet" type="text/css">
<link href="<%=GlobalUtil._WEB_PATH%>/res/css/Tooltip.css" rel="stylesheet" type="text/css">
