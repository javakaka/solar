
/**
*获取请求参数
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

/**
 * 锁屏
 * @param progressImgName
 */
function lockScreen(progressImgName) 
{ 
  var msgw,msgh,bordercolor; 
  msgw=400;// 
  msgh=100;// 
  titleheight=25 // 
  bordercolor="#336699";// 
  titlecolor="#99CCFF";// 
  var sWidth,sHeight; 
  sWidth=document.body.offsetWidth;// 
  sHeight=screen.height;// 
  var bgObj=document.createElement("div");// 
  bgObj.setAttribute('id','bgDiv'); 
  bgObj.style.position="absolute"; 
  bgObj.style.top="0"; 
  bgObj.style.background="#777"; 
  bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
  bgObj.style.opacity="0.6"; 
  bgObj.style.left="0"; 
  bgObj.style.width=sWidth + "px"; 
  bgObj.style.height=sHeight + "px"; 
  bgObj.style.zIndex = "10000"; 
  document.body.appendChild(bgObj);// 
  var msgObj=document.createElement('div');// 
  msgObj.setAttribute("id","msgDiv"); 
  msgObj.setAttribute("align","center"); 
  msgObj.style.background="white"; 
  msgObj.style.border="1px solid " + bordercolor; 
  msgObj.style.position = "absolute"; 
  msgObj.style.left = "50%"; 
  msgObj.style.top = "50%"; 
  msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif"; 
  msgObj.style.marginLeft = "-225px" ; 
  msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px"; 
  msgObj.style.width = msgw+"px"; 
  msgObj.style.height = msgh+"px"; 
  msgObj.style.textAlign = "center"; 
  msgObj.style.lineHeight ="25px"; 
  msgObj.style.zIndex = "10001";
  document.body.appendChild(msgObj); 
  var progress =document.createElement("img");
  progress.setAttribute("id","msgImg");
  progress.src="../res/js/images/"+progressImgName;
  document.getElementById("msgDiv").appendChild(progress); 
  } 

/**
 * 弹出层
 * @param progressImgName
 */
function lockScreen(url,frameId) 
{ 
  var msgw,msgh,bordercolor; 
  msgw=400;// 
  msgh=100;// 
  titleheight=25 // 
  bordercolor="#336699";// 
  titlecolor="#99CCFF";// 
  var sWidth,sHeight; 
  sWidth=document.body.offsetWidth;// 
  sHeight=screen.height;// 
  var bgObj=document.createElement("div");// 
  bgObj.setAttribute('id','bgDiv'); 
  bgObj.style.position="absolute"; 
  bgObj.style.top="0"; 
  bgObj.style.background="#777"; 
  bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
  bgObj.style.opacity="0.6"; 
  bgObj.style.left="0"; 
  bgObj.style.width=sWidth + "px"; 
  bgObj.style.height=sHeight + "px"; 
  bgObj.style.zIndex = "10000"; 
  document.body.appendChild(bgObj);// 
  var msgObj=document.createElement('div');// 
  msgObj.setAttribute("id","msgDiv"); 
  msgObj.setAttribute("align","center"); 
  msgObj.style.background="white"; 
  msgObj.style.border="1px solid " + bordercolor; 
  msgObj.style.position = "absolute"; 
  msgObj.style.left = "50%"; 
  msgObj.style.top = "50%"; 
  msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif"; 
  msgObj.style.marginLeft = "-225px" ; 
  msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px"; 
  msgObj.style.width = msgw+"px"; 
  msgObj.style.height = msgh+"px"; 
  msgObj.style.textAlign = "center"; 
  msgObj.style.lineHeight ="25px"; 
  msgObj.style.zIndex = "10001";
  document.body.appendChild(msgObj);

  var frameName ="iframe";
  if(typeof frameId == "undefined" || frameId == "")
  {
	  frameName ="iframe0"; 
  }
  else
  {
	  frameName ="iframe"+frameId;
  }
  var progress =document.createElement("iframe");
  progress.setAttribute("id",frameName);
  progress.src="../res/js/images/"+progressImgName;
  document.getElementById("msgDiv").appendChild(progress);
  } 

function unLockScreen()
{
  	var bgObj =document.getElementById("bgDiv");
  	var msgObj =document.getElementById("msgDiv");
  	document.body.removeChild(bgObj);// 
  	document.body.removeChild(msgObj);// 
  }

//Native 转换 Unicode
function Native2Unicode(str) {
	var encodeStr='';
	var a_s=str;
	if ('' == a_s) { 
    	alert('请输入Native字符串'); 
    	return; 
	}
	for (var i=0; i<a_s.length; i++)
		//$("#u_source").val($("#u_source").val() + '&#' + a_s.charCodeAt(i) + ';');
		encodeStr +='&#' + a_s.charCodeAt(i) + ';';
	return encodeStr;
	
}

//Unicode 转换 Native
function Unicode2Native(str) { 
	var decodeStr ='';
	var code = str.match(/&#(\d+);/g);
	if (code == null) { 
    	return decodeStr; 
	}
	for (var i=0; i<code.length; i++)
		//$("#a_source").val($("#a_source").val() + String.fromCharCode(code[i].replace(/[&#;]/g, '')));
		decodeStr +=String.fromCharCode(code[i].replace(/[&#;]/g, ''));
	return decodeStr;
}

//计算当前时间和指定时间的差,返回小时，分钟
function getTimeMinusOfHourMinute(end_date) 
{ 
	var now = new Date(); 
	var endDate = new Date(end_date); 
	var leftTime=endDate.getTime()-now.getTime(); 
	var leftsecond = parseInt(leftTime/1000); 
	var day1=Math.floor(leftsecond/(60*60*24)); 
	var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
	var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
	var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
	var result =hour+"小时"+minute+"分";
	return result;
} 

//计算当前时间和指定时间的差,返回小时，分钟,秒
function getTimeMinusOfHourMinuteSecond(end_date) 
{ 
	var now = new Date(); 
	var endDate = new Date(end_date); 
	var leftTime=endDate.getTime()-now.getTime(); 
	var leftsecond = parseInt(leftTime/1000); 
	var day1=Math.floor(leftsecond/(60*60*24)); 
	var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
	var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
	var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
	var cc = document.getElementById(divname); 
	var result =hour+"小时"+minute+"分"+second+"秒";
	return result;
} 

/**
 * 验证数字
 * @param String
 * @return
 */
function checknumber(String)
{ 
   var Letters = "1234567890";
    var i;
    var c;
    for( i = 0; i < String.length; i ++ )
    {
         c = String.charAt( i );
      if (Letters.indexOf( c ) ==-1)
      {
       return false;
      }
    }
    return true;
}

/**
*验证电话号码
*/
function checkPhone(val)
{
	var p1 = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/; 
	var me = false; 
	if (p1.test(val))me=true; 
	if (!me){ 
	return false; 
	}
	else
		return true;
}
/**
*验证手机号码
*/
function checkMobile(val)
{
	var reg0 = /^13\d{5,9}$/; 
	var reg1 = /^153\d{4,8}$/; 
	var reg2 = /^159\d{4,8}$/; 
	var reg3 = /^0\d{10,11}$/; 
	var my = false; 
	if (reg0.test(val))my=true; 
	if (reg1.test(val))my=true; 
	if (reg2.test(val))my=true; 
	if (reg3.test(val))my=true; 
	if (!my){ 
	return false;
	}
	else
		return true;
}
/**
*验证邮箱
*/
function checkEmail(val)
{
	//对电子邮件的验证
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(!myreg.test(val))
	{
	  return false;
	}
	else 
		return true;
}

/**
*锁屏
*/
function lockScreen(progressImgName) 
{ 
var msgw,msgh,bordercolor; 
msgw=400;//提示窗口的宽度 
msgh=100;//提示窗口的高度 
titleheight=25 //提示窗口标题高度 
bordercolor="#336699";//提示窗口的边框颜色 
titlecolor="#99CCFF";//提示窗口的标题颜色 
var sWidth,sHeight; 
sWidth=document.body.offsetWidth;//获取窗口宽度 
sHeight=screen.height;//获取屏幕高度 
var bgObj=document.createElement("div");//关键在这里，原理：在body中创建一个div，并将其宽度与高度设置为覆盖整个窗体，如此一来就无法对其它窗口时行操作 
bgObj.setAttribute('id','bgDiv'); 
bgObj.style.position="absolute"; 
bgObj.style.top="0"; 
bgObj.style.background="#777"; 
bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
bgObj.style.opacity="0.6"; 
bgObj.style.left="0"; 
bgObj.style.width=sWidth + "px"; 
bgObj.style.height=sHeight + "px"; 
bgObj.style.zIndex = "10000"; 
document.body.appendChild(bgObj);//设置完此div后将其显示出来 
var msgObj=document.createElement('div');//创建一个消息窗口 
msgObj.setAttribute("id","msgDiv"); 
msgObj.setAttribute("align","center"); 
msgObj.style.background="white"; 
msgObj.style.border="1px solid " + bordercolor; 
msgObj.style.position = "absolute"; 
msgObj.style.left = "50%"; 
msgObj.style.top = "50%"; 
msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif"; 
msgObj.style.marginLeft = "-225px" ; 
msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px"; 
msgObj.style.width = msgw+"px"; 
msgObj.style.height = msgh+"px"; 
msgObj.style.textAlign = "center"; 
msgObj.style.lineHeight ="25px"; 
msgObj.style.zIndex = "10001";
document.body.appendChild(msgObj); 
var progress =document.createElement("img");
progress.setAttribute("id","msgImg");
if(typeof progressImgName =="undefined" || progressImgName == "" )
{
	progressImgName ="progress.jpg";
}
progress.src=SITE_PATH+"/common/js/images/"+progressImgName;
document.getElementById("msgDiv").appendChild(progress); 
} 

function unLockScreen()
{
	var bgObj =document.getElementById("bgDiv");
	var msgObj =document.getElementById("msgDiv");
	document.body.removeChild(bgObj);//移除覆盖整个窗口的div层 
	document.body.removeChild(msgObj);//移除消息层 
}

/**
*消息提示
*/
function showMsg(msg,seconds) 
{ 
var msgw,msgh,bordercolor; 
msgw=400;//提示窗口的宽度 
msgh=100;//提示窗口的高度 
titleheight=25 //提示窗口标题高度 
bordercolor="#336699";//提示窗口的边框颜色 
titlecolor="#99CCFF";//提示窗口的标题颜色 
var sWidth,sHeight; 
sWidth=document.body.offsetWidth;//获取窗口宽度 
sHeight=screen.height;//获取屏幕高度 
var bgObj=document.createElement("div");//关键在这里，原理：在body中创建一个div，并将其宽度与高度设置为覆盖整个窗体，如此一来就无法对其它窗口时行操作 
bgObj.setAttribute('id','bgDiv'); 
bgObj.style.position="absolute"; 
bgObj.style.top="0"; 
bgObj.style.background="#777"; 
bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
bgObj.style.opacity="0.6"; 
bgObj.style.left="0"; 
bgObj.style.width=sWidth + "px"; 
bgObj.style.height=sHeight + "px"; 
bgObj.style.zIndex = "10000"; 
document.body.appendChild(bgObj);//设置完此div后将其显示出来 
var msgObj=document.createElement('div');//创建一个消息窗口 
msgObj.setAttribute("id","msgDiv"); 
msgObj.setAttribute("align","center"); 
msgObj.style.background="white"; 
msgObj.style.border="1px solid " + bordercolor; 
msgObj.style.position = "absolute"; 
msgObj.style.left = "50%"; 
msgObj.style.top = "50%"; 
msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif"; 
msgObj.style.marginLeft = "-225px" ; 
msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px"; 
msgObj.style.width = msgw+"px"; 
msgObj.style.height = msgh+"px"; 
msgObj.style.textAlign = "center"; 
msgObj.style.lineHeight ="25px"; 
msgObj.style.zIndex = "10001";
document.body.appendChild(msgObj); 
var progress =document.createElement("div");
progress.setAttribute("id","tipDiv");
if(typeof msg =="undefined" || msg == "" )
{
	msg ="success";
}

progress.innerHTML =msg;
progress.style.height = msgh+"px"; 
progress.style.lineHeight = msgh+"px"; 
progress.style.font="14px/"+msgh+"px"+" Verdana, Geneva, Arial, Helvetica, sans-serif"; 
if(typeof seconds =="undefined" || seconds == "" )
{
	seconds ="2";
}
document.getElementById("msgDiv").appendChild(progress); 
unLockMsgScreen(seconds);
}


function unLockMsgScreen(seconds)
{
	seconds--;
	if(seconds == 0 )
	{
		var bgObj =document.getElementById("bgDiv");
		var msgObj =document.getElementById("msgDiv");
		document.body.removeChild(bgObj);//移除覆盖整个窗口的div层 
		document.body.removeChild(msgObj);//移除消息层 
	}
	setTimeout(function(){unLockMsgScreen(seconds);}, 1000);
}
