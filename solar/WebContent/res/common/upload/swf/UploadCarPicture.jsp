<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<script type="text/javascript"  src="<%=basePath%>res/js/tab/Tab.js"></script>   
<script type="text/javascript"  src="<%=basePath%>res/js/web.js"></script>   
<link href="<%=basePath%>res/js/tab/Style.css" rel="stylesheet" type="text/css"> 
<script>
/**
*param
*/
function request(paras)
{ 
	var url = location.href; 
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
	var paraObj = {} 
	for (i=0; j=paraString[i]; i++){ 
	paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length); 
	} 
	var returnValue = paraObj[paras.toLowerCase()]; 
	if(typeof(returnValue)=="undefined"){ 
	return ""; 
	}else{ 
	return returnValue; 
	} 
}

var good_id =request("id");
function initTab()
{
	Tabs.add("uploadPage", "上传图片", "Upload.jsp?deal_type=uploadCarPicture&deal_code="+good_id+"&edit=1&rows=8&file_type=*.jpg;*.gif;*.png&cover=0");
	Tabs.write("上传产品图片", idTabFrame, idTab);
	Tabs.select("uploadPage");
}
function setFrameHeight()
{
	dynIframeSize(document.all.idTabFrame);
}
</script>
</head>
  <body onload=initTab()>
  <div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
</body>
</html>