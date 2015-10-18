<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<link href="<%=basePath%>res/navtab/css/core.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>res/navtab/css/TabPanel.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>res/navtab/css/Toolbar.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>res/navtab/css/WindowPanel.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>res/navtab/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>res/navtab/js/Fader.js"></script>
<script type="text/javascript" src="<%=basePath%>res/navtab/js/TabPanel.js"></script>
<script type="text/javascript" src="<%=basePath%>res/navtab/js/Math.uuid.js"></script>
<script type="text/javascript" src="<%=basePath%>res/navtab/js/Toolbar.js"></script>
<script type="text/javascript" src="<%=basePath%>res/navtab/js/WindowPanel.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>微信管理平台</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 1px;
	margin-right: 0px;
	margin-bottom: 0px;
	/*background-color:#646464;*/
}
html { overflow-x: ; overflow-y: ; border:0;} 
-->
</style>
<script type="text/javascript">
var tabpanel;
var toolbar;
$(document).ready(function(){
	  tabpanel = new TabPanel({
		renderTo:'navTabDiv',
		autoResizable:true,
		border:'none',
		active : 0,
		maxLength : 20,
		items : [{
			id:'toolbarPlugin',
			title:'系统信息',
			icon:'<%=basePath%>res/navtab/image/read-n.gif',
			html:'<iframe id="callIframe" src="<%=basePath%>main/desktop/Main.jsp" width="100%" scrolling="auto" height="100%" frameborder="0"></iframe>',
			closable: false
		}]
	});
});
function addadd(url,tab_title,tabId,tabIcon){
	if(typeof tab_title == "undefined" || tab_title == "")
	{
		tab_title ="功能菜单";
	}
	tabpanel.addTab({id:tabId, title:tab_title, html:'<iframe src="'+url+'" width="100%" height="100%" frameborder="0"></iframe>',icon:tabIcon});
}
</script>
</head>
<body>
<div id="navTabDiv" name="navTabDiv" style="width:100%"></div>
</body>
</html>
