<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<body onLoad="onGetPage()">
</body>
</html>
<script>
function onGetPage()
{
	var s =new Server("getStaffPortlet");
	if(s.send(s, true))
	{
		sPartSerial =s.getDefaultParamValue("part_serial");
		saSerial =sPartSerial.split(",");
		for(i=0; i<saSerial.length; i++)
		{
			saTmp =saSerial[i].split("|");
			for(j=0; j<saTmp.length; j++)
			{
				if(saTmp[j] =='empty')
					continue;

				obj =document.createElement("<xmp id='"+saTmp[j]+"'>");
				document.appendChild(obj);
			}
		}
	}

	var saUrl =new Array();
	var oData =s.getDataSet("WebParts");
	if(oData ==null) return;
	var o$D =new $D(oData);
	var rows =o$D.getRows();
	for(i =1; i<=rows; i++)
	{
		//saTitle[0] ="123";
		saUrl[o$D.get(i, "WEBPART_NO")] =o$D.get(i, "WEBPART_URL");
	}		

	for(i=0; i<document.all.tags("xmp").length; i++)
	{
		getPageHtmlCode(document.all.tags("xmp")[i], saUrl[document.all.tags("xmp")[i].id]);
	}
}

//获取远程页面HTML Code
function getPageHtmlCode(oXmp, sUrl)
{
	var preUrl =location.href.substring(0,location.href.indexOf(WEB_PATH));
	if(sUrl =="") return;
	else
		sUrl =preUrl +WEB_PATH+sUrl;
	oXmp.innerText ="<iframe height='192' id='_idFrame"+oXmp.id+"' src='"+sUrl+"' style='width:100%' frameborder=0>";
/*
	通过此方式出现Ajax不执行情况
	var xmlHttp =null;
	//如果是IE，用activexobject
	if (window.ActiveXObject)
	{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if (window.XMLHttpRequest)
	{
		//如果其它浏览器就用XMLHttpRequest
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.open("POST", sUrl, false);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(null);
	if(xmlHttp.status !=200) 
	{
		//$E.message(oXmlHttp.responseText);
		//$E.message("网络有问题，请咨询系统管理员");
		//throw new Error(0,"网络有问题，请咨询系统管理员");
		return false;
	}
	oXmp.innerText =xmlHttp.responseText;
	*/
}
</script>