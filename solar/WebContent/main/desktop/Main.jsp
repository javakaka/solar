<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<style>
html {
overflow-x: hidden;
overflow-y: auto;
} </style>

<head>
<title>工作桌面</title>
<link href="res/Main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/Http.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="res/Main.js"></script>
 <script type="text/javascript">
 var WEB_PATH="<%=basePath%>";
 if (!window.showModalDialog) {
     window.showModalDialog = function (url, window, features) {

    	var GetWidth =null;
    	var GetHeight =null;
    	if (typeof(GetWidth)	!= 'number' || GetWidth < 0)  GetWidth	= screen.availWidth/2;
   		if (typeof(GetHeight)	!= 'number' || GetHeight < 0) GetHeight	= screen.availHeight/2;
        var w;
        var h;
        var resizable = "no";
        var scroll = "no";
        var status = "no";

        // get the modal specs
        var mdattrs = features.split(";");
        for (i = 0; i < mdattrs.length; i++) {
           var mdattr = mdattrs[i].split(":");

           var n = mdattr[0];
           var v = mdattr[1];
           if (n) { n = n.trim().toLowerCase(); }
           if (v) { v = v.trim().toLowerCase(); }

           if (n == "dialogheight") {
              h = v.replace("px", "");
           } else if (n == "dialogwidth") {
              w = v.replace("px", "");
           } else if (n == "resizable") {
              resizable = v;
           } else if (n == "scroll") {
              scroll = v;
           } else if (n == "status") {
              status = v;
           }
        }

        var left = window.screenX + (window.outerWidth / 2) - (GetWidth / 2);
        var top = window.screenY + (window.outerHeight / 2) - (GetHeight / 2);
        var targetWin = window.open(url, url, 'toolbar=no, location=no, directories=no, status=' + status + ', menubar=no, scrollbars=' + scroll + ', resizable=' + resizable + ', copyhistory=no, width=' + GetWidth + ', height=' + GetHeight + ', top=' + top + ', left=' + left);
        targetWin.focus();
     };
  }
   </script>
</head>
<body background="res/bg_01.gif" oncontextmenu="onSetDesktop();return false;">
<div id="idDivSave" style="display:none"><input type=button value="保存桌面配置" onCliCk="onSaveDesktopConfig()"></div>
<div class="move" id="root_row"><div class="title"><div class="title_close"><img src='<%=basePath%>/images/ico_close.gif'></div><!-- <div class="title_edit">编辑</div> --><div class="title_lock">锁定</div><div class="title_reduce"><!-- <img src='<%=basePath%>/images/ico_min_max.gif'> --></div><div class="title_a"></div></div><div class="content"></div></div>
<div class="root">
	<div class="cell_left left" id="m_1">
		<div class="line">　</div>
	</div>
	
	<div class="left r_nbsp">　</div>
	
	<div class="cell_center left" id="m_2">
		<div class="line">　</div>
	</div>
	
	<div class="left r_nbsp">　</div>
	
	<div class="cell_right left" id="m_3">
		<div class="line">　</div>
	</div>
</div>
</body>
</html>
<script language="javascript">
<!--
/*设置桌面*/

var sConfigs ="";
function onSetDesktop()
{
	var src ="<%=basePath%>/staff/portlet/WebPart.jsp";
	$$E.runOpen(src, true);
}

function onAfterChildWindowSetDesktop(cf_ids)
{
	sConfigs =cf_ids;
	if(sConfigs)
	{
		//*
		var sa =sConfigs.split(",");
		var sLeft ="";
		var sCenter ="";
		var sRight ="";
		/*
		alert(sConfig);
		var sca =sConfig.split("|");
		sLeft =sca[0];
		sCenter =sca[1];
		sRight =sca[2];
		*/
		var ss ="";
		for(var i=0; i<sa.length; i++)
		{
			if(i %3==0)
			{
				if(sLeft.length >0)
					sLeft +=",";
				sLeft +=sa[i];
			}
			else if(i %3==1)
			{
				if(sCenter.length >0)
					sCenter +=",";
				sCenter +=sa[i];
			}
			else if(i %3==2)
			{
				if(sRight.length >0)
					sRight +=",";
				sRight +=sa[i];
			}
		}
		ss =sLeft +"|"+sCenter+"|" +sRight;
		//*/
		var ssConfig =ss;
		var oTc =$$E.getElementsByClassName("title_close", "div");//关闭层
		var oTa =$$E.getElementsByClassName("title_a", "div");//标题层

		if(oTc.length ==oTa.length)
		{
			for(var i=0; i<oTc.length; i++)
			{
				if(oTa[i].innerHTML !="")
					oTc[i].click();
			}
		}
		//sConfig =ssConfig+","+sConfigs;
		sConfig =ssConfig;
		//sConfig =cf_ids;
		//onSaveDesktopConfig();
		viewDesktop(sConfig);
		onViewSaveDiv(true);
	}
}

/*保存桌面配置*/
function onSaveDesktopConfig()
{

	var url =WEB_PATH+"/staff/portlet/setStaffPortlet.do";
	var params={part_serial:sConfig};
	$.ajax({
		url: url,
		type: "POST",
		data: params,
		dataType: "json",
		cache: false,
		beforeSend: function (XMLHttpRequest){
		},
		success: function(ovo, textStatus) {
			var code =ovo.code;
			if(code >=0)
			{
				$.message("success","桌面设置成功！");
				$("#idDivSave").css("display","none");
			}
			else
			{
				$.message("error","处理出错");
			}
		},
		complete: function (XMLHttpRequest, textStatus){
		},
		error: function (){
			$.message("error","处理出错");
		}
	});
}

/*显示配置保存层*/
function onViewSaveDiv(tag)
{
	$("#idDivSave").css("display",(tag?"":"none"));
}

//-->
</script>