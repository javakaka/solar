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

//��ȡԶ��ҳ��HTML Code
function getPageHtmlCode(oXmp, sUrl)
{
	var preUrl =location.href.substring(0,location.href.indexOf(WEB_PATH));
	if(sUrl =="") return;
	else
		sUrl =preUrl +WEB_PATH+sUrl;
	oXmp.innerText ="<iframe height='192' id='_idFrame"+oXmp.id+"' src='"+sUrl+"' style='width:100%' frameborder=0>";
/*
	ͨ���˷�ʽ����Ajax��ִ�����
	var xmlHttp =null;
	//�����IE����activexobject
	if (window.ActiveXObject)
	{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if (window.XMLHttpRequest)
	{
		//����������������XMLHttpRequest
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.open("POST", sUrl, false);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
	xmlHttp.send(null);
	if(xmlHttp.status !=200) 
	{
		//$E.message(oXmlHttp.responseText);
		//$E.message("���������⣬����ѯϵͳ����Ա");
		//throw new Error(0,"���������⣬����ѯϵͳ����Ա");
		return false;
	}
	oXmp.innerText =xmlHttp.responseText;
	*/
}
</script>