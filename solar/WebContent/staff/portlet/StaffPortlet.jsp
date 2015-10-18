<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="res/css/demo_globe.css" />
<link rel="stylesheet" type="text/css" href="res/css/demo_default.css" id="demo_theme" />
<script type="text/javascript" src="res/jsvm2/jsre.js" classpath="<%=GlobalUtil._WEB_PATH%>/staff/portlet/res/js/demo_lib_110.js"></script>
<SCRIPT language=javascript  src='<%=GlobalUtil._WEB_PATH%>/oa/msg/AsMsn.js' type=text/javascript></SCRIPT>
<script type="text/javascript">
//<![CDATA[
_import("com.bluepower.ui.DemoPage");
/**
* Ĭ��ģ����У����� A1,A2,A3|B1,B2,B3|...
* �������֧���ĸ����� AAA|BBB|CCC|DDD
*/
var saTitle =new Array();
var sPartTitle ="";
var dp = new DemoPage();
var sDefault ="";

var oMsgTimer =null;
var bInit =false;
window.onload = function(){
	var sCookie =getWebpart();
	if(sCookie !="")
	{
		sDefault =sCookie;
		dp.init(sCookie);
	}
	createAllPartSelect();
}

//����WEBPART
function createAllPartSelect()
{
	try
	{
		var aWebpartNos =new Array();
		var aWebpartTitles =new Array();
		for(i=0; i<saTitle.length; i++)
		{
			if(typeof(saTitle[i]) !="undefined")
			{
				aWebpartNos[aWebpartNos.length] =i;
				aWebpartTitles[aWebpartTitles.length] =saTitle[i];
			}
		}
		var iRow =aWebpartNos.length %4;
		for(i=0; i<iRow; i++)
		{
			oRow =tb_set_moudule.insertRow();
			oCell =oRow.insertCell();
			sTitle =aWebpartTitles[i*4].split('|');
			checked ="";
			if(sTitle[0] =="1")
				checked ="checked";
			oCell.innerHTML ="<input type=checkbox id='_"+aWebpartNos[i*4]+"' "+checked+" value='"+aWebpartNos[i*4]+"'/><label for='_"+aWebpartNos[i*4]+"' style='cursor:hand'>"+sTitle[1]+"</label>";
			if(aWebpartTitles.length <=(i*4+1))
				break;
			oCell =oRow.insertCell();
			sTitle =aWebpartTitles[i*4+1].split('|');
			checked ="";
			if(sTitle[0] =="1")
				checked ="checked";
			oCell.innerHTML ="<input type=checkbox id='_"+aWebpartNos[i*4+1]+"' "+checked+" value='"+aWebpartNos[i*4+1]+"'/><label for='_"+aWebpartNos[i*4+1]+"' style='cursor:hand'>"+sTitle[1]+"</label>";
			if(aWebpartTitles.length <=(i*4+2))
				break;
			oCell =oRow.insertCell();
			sTitle =aWebpartTitles[i*4+2].split('|');
			checked ="";
			if(sTitle[0] =="1")
				checked ="checked";
			oCell.innerHTML ="<input type=checkbox id='_"+aWebpartNos[i*4+2]+"' "+checked+" value='"+aWebpartNos[i*4+2]+"'/><label for='_"+aWebpartNos[i*4+2]+"' style='cursor:hand'>"+sTitle[1]+"</label>";
			if(aWebpartTitles.length <=(i*4+3))
				break;
			oCell =oRow.insertCell();
			sTitle =aWebpartTitles[i*4+3].split('|');
			checked ="";
			if(sTitle[0] =="1")
				checked ="checked";
			oCell.innerHTML ="<input type=checkbox id='_"+aWebpartNos[i*4+3]+"' "+checked+" value='"+aWebpartNos[i*4+3]+"'/><label for='_"+aWebpartNos[i*4+3]+"' style='cursor:hand'>"+sTitle[1]+"</label>";
		}
		if(iRow *4 <aWebpartNos.length)
		{
			oRow =tb_set_moudule.insertRow();
			for(i =iRow*4; i<aWebpartNos.length; i++)
			{
				oCell =oRow.insertCell();
				sTitle =aWebpartTitles[i].split('|');
				checked ="";
				if(sTitle[0] =="1")
					checked ="checked";
				oCell.innerHTML ="<input type=checkbox id='_"+aWebpartNos[i]+"' "+checked+" value='"+aWebpartNos[i]+"'/><label for='_"+aWebpartNos[i]+"' style='cursor:hand'>"+sTitle[1]+"</label>";
			}
		}
	}
	catch(e){$E.message(e);};
}

//�õ���������
function getWebpart()
{
	var sParts ="";
	var s =new Server("getStaffPortlet");
	if(s.send(s, true))
	{
		sParts =s.getDefaultParamValue("part_serial");
		var oData =s.getDataSet("WebParts");
		if(oData !=null)
		{
			var o$D =new $D(oData);
			var rows =o$D.getRows();
			for(i =1; i<=rows; i++)
			{
				//saTitle[0] ="123";
				saTitle[o$D.get(i, "WEBPART_NO")] =o$D.get(i, "MUST_SELECTED")+"|"+o$D.get(i, "WEBPART_TITLE");
				sPartTitle +="|"+o$D.get(i, "WEBPART_TITLE");
			}		
		}
	}
	return sParts;
}
//���ø�������
function setStaffPortlet(sSerialPart)
{
	var s =new Server("setStaffPortlet");
	s.setParamValue("default", "part_serial", sSerialPart);
	if(s.send(s, true))
	{
		//$E.message("���óɹ���");
	}
}

//ѡ���û�ѡ��Webpart
function checkPart()
{
	for(i=0; i<document.body.all.tags("div").length; i++)
	{
		div =document.body.all.tags("div")[i];
		if(div.className =="cB p2")
		{
			ck =document.getElementById("_"+div.id);
			if(ck !=null)
				ck.checked =true;
		}
	}
}

//]]>
</script>
</head>

<body>
  <noscript>
    <ul class="noScript">
	  <li>����Ҫ����JavaScript��</li>
	  <li>�������Cookie��</li>
	</ul>
  </noscript>

  <!-- START Navigation Bar -->
  <div id="nav_area" class="cB navBar">
    <span class="fR">
	  [&nbsp;<a href="javascript:dp.swapDisplay('set_module_area');checkPart()" title="���ɾ��ģ��">��ɾģ��</a>&nbsp;] 
	  <a href="javascript:dp.setColumn(1)" title="1��:::Column1">1��</a> 
	  <a href="javascript:dp.setColumn(2)" title="2��:::Column2">2��</a> 
	  <a href="javascript:dp.setColumn(3)" title="3��:::Column3">3��</a> 
	  <a href="javascript:dp.setColumn(4)" title="4��:::Column4">4��</a> 
	  <a href="javascript:dp.setTheme('default')" title="����1:::Theme1">����1</a> 
	  <!--
	  <a href="javascript:dp.setTheme('blue')" title="����2:::Theme2">����2</a>
	  <a href="javascript:dp.setTheme('xmas')" title="����3:::Theme3">����3</a>
	  -->
	</span>
  </div>
  <!-- END Navigation Bar -->

  <!-- START Notice Bar -->
  <div id="notice_area" class="cB noticeBar" style="display: none">
    <table class="cB fC">
	 <tr>
	   <td>ͨ���϶����ر���������Portal��ҳ�����Զ��塣���ϷžͿ�����������ģ�飬��ҪӦ�ø��ġ��뵥��&quot;<strong>����</strong>&quot;��ť��</td>
	   <td><input type="button" value="&nbsp;&nbsp;��&nbsp;��&nbsp;&nbsp;" onclick="dp.saveSetting()" /></td>
	   <td>&nbsp;</td>
	   <td><input type="button" value="&nbsp;&nbsp;ȡ&nbsp;��&nbsp;&nbsp;" onclick="dp.hideEl('notice_area')" /></td>
	 </tr>
	</table>
  </div>
  <!-- END Notice Bar -->

  <!-- START Set Module Area -->
  <div id="set_module_area" class="cB setModuleArea" style="display: none">
    <table id="tb_set_moudule" name="tb_set_moudule" cellspacing="6" class="cB fC bcS" align=center>
	 <tr>
	   <td colspan="4" class="f1">��ע��������Ĭ��ģ�鲻��ɾ����������ģ���ֱ�Ӽӵ����һ��...</td>
	 </tr>
	</table>
	<table class="cB fC" align=center>
	 <tr>
	   <td><input type="button" value="&nbsp;&nbsp;ȷ&nbsp;��&nbsp;&nbsp;" onclick="dp.setModule()" /></td>
	   <td>&nbsp;</td>
	   <td><input type="button" value="&nbsp;&nbsp;ȡ&nbsp;��&nbsp;&nbsp;" onclick="dp.hideEl('set_module_area')" /></td>
	 </tr>
	</table>
  </div>
</body>
</html>