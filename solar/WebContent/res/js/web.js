var WEB_PATH ="http://localhost:8080/framework/"

function dynIframeSize(iframe, overheight) 
{
	overheight =overheight?overheight:0;
	var pTar = null;
	if (typeof (iframe) == "string") 
	{
		if (document.getElementById){
			pTar = document.getElementById(iframe);
		}
		else{
			eval('pTar = ' + iframe + ';');
		}
	}
	else if(iframe)
		pTar =iframe;
	if (pTar && !window.opera)
	{
		//begin resizing iframe
		pTar.style.display="block"

		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight)
		{
		//ns6 syntax
			pTar.height = pTar.contentDocument.body.offsetHeight +overheight; 
		}
		else if (pTar.Document && pTar.Document.body.scrollHeight)
		{
		//ie5+ syntax
			pTar.height = pTar.Document.body.scrollHeight +390;
			
		}
	}
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
       return true;
      }
    }
    return false;
}

/*
 * 获得时间差,时间格式为 年-月-日 小时:分钟:秒 或者 年/月/日 小时：分钟：秒
 * 其中，年月日为全格式，例如 ： 2010-10-12 01:00:00
 * 返回精度为：秒，分，小时，天
 */
 function GetDateDiff(startTime, endTime, diffType) 
 {
     //将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式
     startTime = startTime.replace(/\-/g, "/");
     endTime = endTime.replace(/\-/g, "/");
     //将计算间隔类性字符转换为小写
     diffType = diffType.toLowerCase();
     var sTime = new Date(startTime);      //开始时间
     var eTime = new Date(endTime);  //结束时间
     //作为除数的数字
     var divNum = 1;
     switch (diffType) {
         case "second":
             divNum = 1000;
             break;
         case "minute":
             divNum = 1000 * 60;
             break;
         case "hour":
             divNum = 1000 * 3600;
             break;
         case "day":
             divNum = 1000 * 3600 * 24;
             break;
         case "year":
             divNum = 1000 * 3600 * 24*365;
             break;
         default:
             break;
     }
     return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divNum));
}
 
 function getDate(type){
    var gdate=new Date();
    var year=gdate.getFullYear();
    var month=gdate.getMonth();
    var weekNum=gdate.getDay();
    var day=gdate.getDate();
    var hour=gdate.getHours();
    var minute=gdate.getMinutes();
    var second=gdate.getSeconds();
    var week;
    switch(weekNum){
       case 0:
          week="星期天";
          break;
       case 1:
          week="星期一";
          break;
       case 2:
          week="星期二";
          break;
       case 3:
          week="星期三";
          break;
       case 4:
          week="星期四";
          break;
       case 5:
          week="星期五";
          break;
       case 6:
          week="星期六";
          break;
    }
    var getTimes ="";
    if(type == "1")
    {
    	getTimes=year+"年"+getInfo((month+1))+"月"+getInfo(day)+"日"+" "+week+" "+getInfo(hour)+":"+getInfo(minute)+":"+getInfo(second);	
    }
    else if(type == "2")
    {
    	getTimes=year+"-"+getInfo((month+1))+"-"+getInfo(day)+" "+getInfo(hour)+":"+getInfo(minute)+":"+getInfo(second);
    }
    else if(type == "3")
    {
    	getTimes=year+"-"+getInfo((month+1))+"-"+getInfo(day)+" 00:"+"00:00";
    }
    return getTimes;
 }
 
 function getInfo(info)
 {
     var ret;
     if(parseInt(info)<10)
         ret="0"+info;
     else
         ret=""+info;
     return ret;
 }


 /**
*取表格
*/
function getTable(id)
{
	var TableHandle =document.getElementById(id);
	return TableHandle;
}

/*表格清除
*/
function clearTable(TableHandle, deleteAll)
{
	if (TableHandle == null) return;
	if(typeof deleteAll !="undefined" && deleteAll){
		for (var i = TableHandle.rows.length; i > 0; i--)
			TableHandle.deleteRow(i-1);
	}
	else
		for (var i = TableHandle.rows.length; i > 1; i--)
			TableHandle.deleteRow(i-1);
}

/**
*点击表格
*/
function clickTable(a)
{
 var arr =document.all.tags(a.tagName);
 var length=arr.length;
 for(i=0; i<length; i++)
 {
	 var temp=arr[i];
	 var onclick =temp.onclick;
	 if(a==temp)
	 {
		 //选中的标签样式
		 temp.style.background="#E4F1FA";
	  }
	  else
	  {
		 if(onclick == null || typeof onclick == "undefined" || onclick == "" )
		 {
		 }
		 else
		 {
			//恢复原状
			temp.style.background="#FFFFFF";
		 }
	  }
 }
}


function clickTableEvent(a)
{
 var arr =document.all.tags(a.tagName);

 var length=arr.length;
 for(i=0; i<length; i++)
 {
	 var temp=arr[i];
	 var onclick =temp.onclick;
	 if(a==temp)
	 {
		 //选中的标签样式
		 temp.className="tr_bg_over";
	  }
	  else
	  {
		 if(onclick == null || typeof onclick == "undefined" || onclick == "" )
		 {
			 //alert("null");
		 }
		 else
		 {
			//恢复原状
			temp.className="tr_bg_out";
		 }
	  }
 }
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
progress.src="../res/js/images/"+progressImgName;
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
*获取请求参数
*/
  function getRequestParameter(paras)
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
*获取浏览器类型
*/
function isIE(){
    return navigator.appName.indexOf("Microsoft Internet Explorer")!=-1 && document.all;
}

function isIE6() {
    return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 6.0")=="-1"?false:true;
}

function isIE7(){
    return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 7.0")=="-1"?false:true;
}

function isIE8(){
    return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 8.0")=="-1"?false:true;
}

function isNN(){
   return navigator.userAgent.indexOf("Netscape")!=-1;
}

function isOpera(){
    return navigator.appName.indexOf("Opera")!=-1;
}

function isFF(){
    return navigator.userAgent.indexOf("Firefox")!=-1;
}

function isChrome(){
    return navigator.userAgent.indexOf("Chrome") > -1;
}
function isSafari(){
    return navigator.userAgent.indexOf("Safari") > -1;
}