var __intTimeStep=10;
var __isIe=(window.ActiveXObject)?true:false;
var __intAlphaStep=(__isIe)?5:0.05;
var __curSObj=null;
var __curOpacity=null;
var __stopTime=0;
var __popDiv ="__objDiv__";
function __startObjMessage(objId)
{
	__curSObj=document.getElementById(objId);
	__setMessage();
}
function __setMessage()
{
	if(__isIe)
	{
		__curSObj.filters.alpha.opacity=0;
	}
	else
	{
		__curOpacity=0;__curSObj.style.opacity=0
	}
	__curSObj.style.display='';
	__setMessageShow();
}
function __setMessageShow()
{
	if(__isIe)
	{
		__curSObj.filters.alpha.opacity+=__intAlphaStep;
		if (__curSObj.filters.alpha.opacity<100) 
		{
			setTimeout('__setMessageShow()',__intTimeStep);
		}
		else
		{
			__stopTime+=10;
			if(__stopTime<500)
			{
				setTimeout('__setMessageShow()',__intTimeStep);
			}
			else
			{
				__stopTime=0;__setMessageClose();
			}
		}
	}
	else
	{
		__curOpacity +=__intAlphaStep;
		__curSObj.style.opacity =__curOpacity;
		if (__curOpacity<1) 
		{
			setTimeout('__setMessageShow()',__intTimeStep);
		}
		else
		{
			__stopTime+=10;if(__stopTime<200)
			{
				setTimeout('__setMessageShow()',__intTimeStep);
			}
			else
			{
				__stopTime=0;__setMessageClose();
			}
		}
	}
}
function __setMessageClose()
{
	if(__isIe)
	{
		__curSObj.filters.alpha.opacity -= __intAlphaStep;
		if (__curSObj.filters.alpha.opacity>0) 
		{
			setTimeout('__setMessageClose()',__intTimeStep);
		}
		else 
		{
			__curSObj.style.display='none';
		}
	}
	else
	{
		__curOpacity-=__intAlphaStep;
		if (__curOpacity>0) 
		{
			__curSObj.style.opacity =__curOpacity;
			setTimeout('__setMessageClose()',__intTimeStep);
		}
		else 
		{
			__curSObj.style.display='none';
		}
	}
}

function _popMessage(msg)
{
	var div =document.getElementById(__popDiv);
	if(div)
		;
	else
	{
		div =document.createElement("div");
		div.id =__popDiv;
		if(__isIe)
		{
			div.style.cssText="border:1px solid #dddddd; background:#ffffff; text-align:center; top:"+ clickTop+"; left:"+clickLeft+"; position:absolute;DISPLAY: none; Z-INDEX: 1; FILTER: alpha(opacity=0);";
		}
		div.style.position="absolute"; 
		document.body.appendChild(div);
	}
	div.innerHTML ='<table class="table_c"><tr class="tr_c"><td><span class="Text_red">&nbsp;&nbsp;'+msg+'&nbsp;&nbsp;</span></td></tr></table>';
	__startObjMessage(__popDiv);
}