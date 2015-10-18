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
* 默认模块队列，形如 A1,A2,A3|B1,B2,B3|...
* 本例最多支持四个分栏 AAA|BBB|CCC|DDD
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

//创建WEBPART
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

//得到个人序列
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
//设置个人序列
function setStaffPortlet(sSerialPart)
{
	var s =new Server("setStaffPortlet");
	s.setParamValue("default", "part_serial", sSerialPart);
	if(s.send(s, true))
	{
		//$E.message("设置成功！");
	}
}

//选中用户选择Webpart
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
	  <li>您需要启用JavaScript！</li>
	  <li>请勿禁用Cookie！</li>
	</ul>
  </noscript>

  <!-- START Navigation Bar -->
  <div id="nav_area" class="cB navBar">
    <span class="fR">
	  [&nbsp;<a href="javascript:dp.swapDisplay('set_module_area');checkPart()" title="添加删除模块">增删模块</a>&nbsp;] 
	  <a href="javascript:dp.setColumn(1)" title="1栏:::Column1">1栏</a> 
	  <a href="javascript:dp.setColumn(2)" title="2栏:::Column2">2栏</a> 
	  <a href="javascript:dp.setColumn(3)" title="3栏:::Column3">3栏</a> 
	  <a href="javascript:dp.setColumn(4)" title="4栏:::Column4">4栏</a> 
	  <a href="javascript:dp.setTheme('default')" title="主题1:::Theme1">主题1</a> 
	  <!--
	  <a href="javascript:dp.setTheme('blue')" title="主题2:::Theme2">主题2</a>
	  <a href="javascript:dp.setTheme('xmas')" title="主题3:::Theme3">主题3</a>
	  -->
	</span>
  </div>
  <!-- END Navigation Bar -->

  <!-- START Notice Bar -->
  <div id="notice_area" class="cB noticeBar" style="display: none">
    <table class="cB fC">
	 <tr>
	   <td>通过拖动、关闭来对您的Portal首页进行自定义。简单拖放就可以重新排列模块，若要应用更改、请单击&quot;<strong>保存</strong>&quot;按钮。</td>
	   <td><input type="button" value="&nbsp;&nbsp;保&nbsp;存&nbsp;&nbsp;" onclick="dp.saveSetting()" /></td>
	   <td>&nbsp;</td>
	   <td><input type="button" value="&nbsp;&nbsp;取&nbsp;消&nbsp;&nbsp;" onclick="dp.hideEl('notice_area')" /></td>
	 </tr>
	</table>
  </div>
  <!-- END Notice Bar -->

  <!-- START Set Module Area -->
  <div id="set_module_area" class="cB setModuleArea" style="display: none">
    <table id="tb_set_moudule" name="tb_set_moudule" cellspacing="6" class="cB fC bcS" align=center>
	 <tr>
	   <td colspan="4" class="f1">备注：本例中默认模块不可删除，新增的模块会直接加到最后一列...</td>
	 </tr>
	</table>
	<table class="cB fC" align=center>
	 <tr>
	   <td><input type="button" value="&nbsp;&nbsp;确&nbsp;定&nbsp;&nbsp;" onclick="dp.setModule()" /></td>
	   <td>&nbsp;</td>
	   <td><input type="button" value="&nbsp;&nbsp;取&nbsp;消&nbsp;&nbsp;" onclick="dp.hideEl('set_module_area')" /></td>
	 </tr>
	</table>
  </div>
</body>
</html>