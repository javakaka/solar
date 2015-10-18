var closemehtod =null;
var submitmethod =null;
var divinnerhtml ="";

function openLayer(conId)
{
	var oDocument =document;
	//if(false)
	//	oDocument =self.parent.window.document;
	//oDocument.getElementById('__BG').style.display='block';
	var arrayPageSize   = getPageSize();
	var arrayPageScroll = getPageScroll();
    var sWidth,sHeight; 
    sWidth=document.body.offsetWidth;
    sHeight=document.body.offsetHeight;

	var objBgAddr =oDocument.getElementById("popupBgAddr");
	if (objBgAddr ==null)
	{
		 objBgAddr =document.createElement( "div ");
		 // <div   id= "bgDiv "   style= "position:absolute;   top:0;   background-color:#777;   filter:progid:DXImagesTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75);   opacity:0.6;   left:0;   width:918px;   height:768px;   z-index:10000; "> </div> 
		 objBgAddr.setAttribute( 'id', 'popupBgAddr'); 
		 objBgAddr.style.position="absolute"; 
		 objBgAddr.style.top= "0"; 
		 objBgAddr.style.background= "#ffffff"; 
		 objBgAddr.style.filter= "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75 "; 
		 objBgAddr.style.opacity= "0.6"; 
		 objBgAddr.style.left= "0"; 
		 objBgAddr.style.width=sWidth   +   "px"; 
		 objBgAddr.style.height=sHeight   +   "px"; 

		 document.body.appendChild(objBgAddr);
	}
	objBgAddr.style.zIndex =10000;
	objBgAddr.style.display = "";


	var popupDiv=oDocument.getElementById("popupAddr")
	if (popupDiv ==null)
	{
		popupDiv = oDocument.createElement("div");
		popupDiv.setAttribute("id","popupAddr")
		popupDiv.style.position = "absolute";
		popupDiv.style.border = "1px solid #4babe3";
		popupDiv.style.background = "#fff";        
		
		popupDiv.setAttribute("divid", conId);
		oDocument.body.appendChild(popupDiv);
	}
	shtml =$E.replaceAll(divinnerhtml , conId+"src", "src")
	shtml =$E.replaceAll(shtml , conId+"iframe", "iframe")
	popupDiv.innerHTML = shtml

	var frame =document.getElementById(conId+"frame");
	//dynIframeSize(frame);

	popupDiv.style.zIndex =10001;
	popupDiv.style.display = "";

	var arrayConSize=getConSize(conId)
	//alert("popupDiv.offsetWidth="+popupDiv.offsetWidth);
	//alert("popupDiv.offsetHeight="+popupDiv.offsetHeight);
	//alert("document.body.clientWidth="+document.body.clientWidth);
	//alert("window.screen.availWidth="+window.screen.availWidth);
	//alert("document.body.clientHeight="+document.body.clientHeight);
	//alert(document.body.clientHeight);
	var iPopDivTop =0;
	if(parseInt(popupDiv.offsetHeight) <parseInt(document.body.clientHeight))
		iPopDivTop =(parseInt(document.body.clientHeight) -parseInt(popupDiv.offsetHeight))/2;

	//popupDiv.style.top  = arrayPageScroll[1] + (arrayPageSize[2] - arrayConSize[1]) / 16-1 + 'px';
	//alert(iPopDivTop);
	popupDiv.style.top  = iPopDivTop;
	//popupDiv.style.left = (arrayPageSize[2] - arrayConSize[1]) / 6 -2 + 'px';
	popupDiv.style.left = (document.body.clientWidth -popupDiv.offsetWidth)/2;
	//alert(popupDiv.style.top);
	//alert(popupDiv.style.left);
}


function getConSize(conId)
{
	var oDocument =document;
	var conObj=oDocument.getElementById(conId)
	conObj.style.position = "absolute";
	conObj.style.left=-1000+"px";
	conObj.style.display="";
	var arrayConSize=[conObj.offsetWidth,conObj.offsetHeight]
	conObj.style.display="none";
	return arrayConSize;
}
function ieTrueBody(doc)
{
	return (doc.compatMode && doc.compatMode!="BackCompat")? doc.documentElement : doc.body;
}


function getPageScroll()
{
	var oDocument =document;
	if(false)
		oDocument =self.parent.window.document;
	var yScroll;
	if (self.pageYOffset) 
	{
		yScroll = self.pageYOffset;
	} 
	else if (oDocument.oDocumentElement && oDocument.oDocumentElement.scrollTop)
	{
		yScroll = oDocument.oDocumentElement.scrollTop;
	} 
	else if (oDocument.body) 
	{
		var w3c=(document.getElementById)? true: false;
		var agt=navigator.userAgent.toLowerCase();
		var ie = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1) && (agt.indexOf("omniweb") == -1));
		var yScroll =0;
		var w =self;
		while(w !=w.parent)
		{
			yScroll += ie ? ieTrueBody(w.document).scrollTop : w.pageYOffset;
			w =w.parent;
		}
		
	}
	arrayPageScroll = new Array('',yScroll)
	return arrayPageScroll;
}

function getPageSize()
{
	var oDocument =document;
	if(false)
		oDocument =self.parent.window.document;
	var xScroll,yScroll;
	if (window.innerHeight && window.scrollMaxY)
	{
		xScroll = oDocument.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} 
	else if (oDocument.body.scrollHeight > oDocument.body.offsetHeight)
	{
		sScroll = oDocument.body.scrollWidth;
		yScroll = oDocument.body.scrollHeight;
	} 
	else 
	{
		xScroll = oDocument.body.offsetWidth;
		yScroll = oDocument.body.offsetHeight;
	}
	var windowWidth,windowHeight;
	//var pageHeight,pageWidth;
	if (self.innerHeight) 
	{
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} 
	else if (oDocument.oDocumentElement && oDocument.oDocumentElement.clientHeight) 
	{
		windowWidth = oDocument.oDocumentElement.clientWidth;
		windowHeight = oDocument.oDocumentElement.clientHeight;
	} 
	else if (oDocument.body) 
	{
		windowWidth = oDocument.body.clientWidth;
		windowHeight = oDocument.body.clientHeight;
	}
	var pageWidth,pageHeight
	if(yScroll < windowHeight)
	{
		pageHeight = windowHeight;
	} 
	else 
	{
		pageHeight = yScroll;
	}
	if(xScroll < windowWidth) 
	{
		pageWidth = windowWidth;
	} 
	else
	{
		pageWidth = xScroll;
	}
	arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight)
	return arrayPageSize;
}

function closeLayer()
{
	if(closemehtod)
		eval(closemehtod);
	var oDocument =document;
	var sDivId =oDocument.getElementById("popupAddr").divid;
	oDivId =oDocument.getElementById(sDivId);
	if(oDivId !=null)
	{

		var p =oDivId.parentNode;   
      p.removeChild(oDivId);  
	}
	oDocument.getElementById("popupAddr").innerHTML ="";
	oDocument.getElementById("popupAddr").style.display = "none";

	oDocument.getElementById("popupBgAddr").innerHTML ="";
	oDocument.getElementById("popupBgAddr").style.display = "none";

	//oDocument.getElementById('__BG').style.display='none';
}





var move=false,oldcolor,_X,_Y;
function StartDrag(obj)
{  
	var oDocument =document;
	if(false)
		oDocument =self.parent.window.document;
	
	obj.setCapture(); 
	oldcolor=obj.style.backgroundColor;
	//obj.style.background="url(images/topbg.gif)";
	move=true;
	
	var parentwin=oDocument.getElementById("popupAddr");
	_X=parentwin.offsetLeft-event.clientX
	_Y=parentwin.offsetTop-event.clientY
}
function Drag(obj)
{
	var oDocument =document;
	if(false)
		oDocument =self.parent.window.document;

	if(move)
	{
		var parentwin=oDocument.getElementById("popupAddr");
		parentwin.style.left=event.clientX+_X;
		parentwin.style.top=event.clientY+_Y;
	}
}
function StopDrag(obj)
{   
	var oDocument =document;
	if(false)
		oDocument =self.parent.window.document;
	//obj.style.background=oldcolor;
	obj.releaseCapture(); 
	move=false;
}


function createDiv(sId, sTitle, sUrl, iButtons, iHeight, iWidth)
{
	iHeight =iHeight?iHeight:0;

	var oDocument =document;
	//if(false)
	//	oDocument =self.parent.window.document;
	//var oBgDiv =oDocument.getElementById("__BG");
	/*
	if(oBgDiv ==null)
	{
		oBgDiv = oDocument.createElement('div'); 
		oDocument.body.appendChild(oBgDiv); 
		oBgDiv.id = "__BG"; 
		oBgDiv.className ="bg";
		oBgDiv.style.display ="none";
	}
	*/
	var newElement =oDocument.getElementById(sId);
	if(newElement ==null)
	{
		newElement = oDocument.createElement('div'); 
		oDocument.body.appendChild(newElement);
		newElement.id = sId; 
		newElement.style.textAlign="center";
		newElement.style.display ="none";
		newElement.title="包含弹出层的内容的容器";
	}
	if(sUrl.toUpperCase().indexOf("HTTP://") ==-1 && sUrl.toUpperCase().indexOf(WEB_PATH.toUpperCase()) ==-1)
		sUrl =WEB_PATH+sUrl;
	var sWidth ="";
	if(iWidth)
		sWidth =" width='"+iWidth+"'";
	var innerHTML ="<table cellpadding=\"0\" "+sWidth+" cellspacing=\"0\" border=\"0\" class=\"div_table\" align=\"center\">		<tr>			<td  class=\"div_table_top_left\" valign=\"top\" width=\"90%\"><font id=\"tabtop-L3\" onmousedown=\"StartDrag(this)\" onmouseup=\"StopDrag(this)\" onmousemove=\"Drag(this)\" style=\" cursor:move; padding-right:120px;\">"+sTitle+"</font></td>			<td class=\"div_table_top_right\" valign=\"middle\" width=10% align='right'><a href=\"#\"  onclick=\"closeLayer(); return false;\" class=\"close\"></a></td></tr>		";
	if(iButtons)
	{
		if(iButtons ==1)
			innerHTML +="<tr><td colspan=2 align=right><input type=button value='关闭' onClick='closeLayer()'></td></tr>";
		else if(iButtons ==2)
			innerHTML +="<tr><td colspan=2 align=right><input type=button value='确定' name='popdivbtsubmit' onClick='onPopDivSubmit()'><input type=button value='关闭' onClick='closeLayer()'></td></tr>";
	}
	innerHTML +="<tr>			<td colspan=\"2\">				<div id='"+sId+"SubDiv'><"+sId+"iframe id=\""+sId+"frame\" frameborder='0' scrolling='no' onload='dynIframeSize(this,30)' width='100%'";
	if(iHeight !=0)
		innerHTML +=" height="+iHeight;
	innerHTML +=" "+sId+"src='"+sUrl+"'/></div>			</td>		</tr>";
	innerHTML +="</table>";
	divinnerhtml =innerHTML;
	//newElement.innerHTML =innerHTML;
	return sId;
	//document.appendChild(oDiv);
}

function onPopDivSubmit()
{
	if(submitmethod)
		eval(submitmethod);
}



function Layer(sTitle, sUrl, iButtons, iHeight, iWidth)
{
	this.title =sTitle;
	this.url =sUrl;
	this.buttons =iButtons;
	this.id =$E.randomChar(12);
	this.height =iHeight;
	this.width =iWidth;
	submitmethod =null;
	closemehtod =null;
}
Layer.prototype.submitbind =function(method)
{
	if(this.buttons ==2)
	{
		submitmethod =method;
	}
}
Layer.prototype.closebind =function(method)
{
	closemehtod =method;
}
Layer.prototype.show =function()
{
	createDiv(this.id, this.title, this.url, this.buttons, this.height, this.width);
	openLayer(this.id);
}

Layer.prototype.set =function(sHandleName, sHandleValue)
{
	var oLay =document.frames[this.id+"frame"];
	if(oLay.document !=null)
	{
		var odoc =oLay.document;
		if(!odoc)
		{
			if(oLay.contentDocument)
			{ // For NS6
				odoc = oLay.contentDocument;
			}
			else if(oLay.contentWindow)
			{// For IE5.5 and IE6
				odoc = oLay.contentWindow.document;
			}
		}
		
		var n = 0;
		var t = setInterval(function()
		{
			var c = true;
			n++;
			if(odoc.all.length !=0)
			{
				c = false;
				if(!c) 
				{ 
					var oHandle =odoc.getElementsByName(sHandleName);
					if(oHandle.length !=0)
					{
						$S(oHandle[0], sHandleValue);
					}
					clearInterval(t); 
				}
			}
			if(n >= 60)
			{
				clearInterval(t);
			}
		}, 250);
	}
}

function correctPNG(imgid) 
{ 
	var arVersion = navigator.appVersion.split("MSIE") ;
	var version = parseFloat(arVersion[1]) ;
	if ((version >= 5.5) && (document.body.filters)) ;
	{ 
		if(imgid)
		{
			img =imgid;
			var imgName = img.src.toUpperCase() ;
			if (imgName.substring(imgName.length-3, imgName.length) == "PNG"
				|| imgName.substring(imgName.length-3, imgName.length) == "png") 
			{
				var imgID = (img.id) ? "id='" + img.id + "' " : "" ;
				var imgClass = (img.className) ? "class='" + img.className + "' " : "" ;
				var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' " ;
				var imgStyle = "display:inline-block;" + img.style.cssText ;
				if (img.align == "left") imgStyle = "float:left;" + imgStyle; 
				if (img.align == "right") imgStyle = "float:right;" + imgStyle; 
				if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle; 
				var strNewHTML = "<span " + imgID + imgClass + imgTitle 
				+ " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";" 
				+ "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader" 
				+ "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" ;
				img.outerHTML = strNewHTML ;
				j = j-1 ;
			} 
		}
		else
		{
			for(var j=0; j<document.images.length; j++) 
			{ 
				var img = document.images[j] ;
				var imgName = img.src.toUpperCase() ;
				if (imgName.substring(imgName.length-3, imgName.length) == "PNG"
					|| imgName.substring(imgName.length-3, imgName.length) == "png") 
				{
					var imgID = (img.id) ? "id='" + img.id + "' " : "" ;
					var imgClass = (img.className) ? "class='" + img.className + "' " : "" ;
					var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' " ;
					var imgStyle = "display:inline-block;" + img.style.cssText ;
					if (img.align == "left") imgStyle = "float:left;" + imgStyle; 
					if (img.align == "right") imgStyle = "float:right;" + imgStyle; 
					if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle; 
					var strNewHTML = "<span " + imgID + imgClass + imgTitle 
					+ " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";" 
					+ "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader" 
					+ "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" ;
					img.outerHTML = strNewHTML ;
					j = j-1 ;
				} 
			} 
		} 
	}
} 