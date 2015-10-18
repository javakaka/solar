var icos =new Array();
icos.push("□");
icos.push("■");
icos.push("◇");
icos.push("◆");
icos.push("◎");
var Tabs = new TabObjs();
/*********************************************
 *
 *  TAB页集合的实现 
 *
 ********************************************/
function TabObjs()
{
   var Tabas = new Array();
	//this.FrameHandle =null;
	var FrameHandle =null;
	var sTitle =null;
	var idDiv =null;
	//name名称title标题url打开链接abled是否有效
	this.add =function(name, title, url, abled)
	{
		//需要判断name是否存在，如果存在则覆盖
		var Tab =new TabObj(Tabas.length, name, title, url, abled);
		var tabExist =false;
		for(i=0; i<Tabas.length; i++)
		{
			if(Tabas[i].Name ==name)
			{
				Tabas[i] =Tab;
				tabExist =true;
			}
		}
		if(!tabExist)
		{
			Tabas.push(Tab);
		}
	}
	;
	this.reload =function()
	{//重新加载Tabs标签，一般在页面已经形成标签组，但因为业务的需要，在页面需动态增加标签，可以先调用add方法，然后调用此方法实现
		for(i=idDiv.children.length-1; i>=0; i--)
		{
			idDiv.removeChild(idDiv.children(i));
		}

		//写第一个层
		var head =document.createElement("<div>");
		head.className ="tabtitle";
		head.innerText =this.sTitle;
		idDiv.appendChild(head);
		for(i=0; i<Tabas.length; i++)
		{
			idDiv.appendChild(Tabas[i].oTab);
		}
	}
	;
	this.write =function(title, frame, div)
	{
		if(frame)
			FrameHandle =frame;
		else
		{
			alert("请指定帧！");
			return ;
		}
		this.sTitle =title;
		if(!div)
		{
			alert("请指定层！");
			return ;
		}
		else
		{
			div.className ="tabDIV";
		}
		idDiv =div;
		//写第一个层
		var head =document.createElement("div");
		head.className ="tabtitle";
		head.innerText =title;
		div.appendChild(head);
		for(i=0; i<Tabas.length; i++)
		{
			div.appendChild(Tabas[i].oTab);
		}
	}
	//修改Tab标题
	this.changetitle =function(name, newTitle)
	{
		for(i=0; i<Tabas.length; i++)
		{
			if(Tabas[i].Name ==name)
			{
				Tabas[i].oTab.innerText =newTitle;
			}
		}
	}
	//修改Tab 链接
	this.changeurl =function(name, newUrl)
	{
		for(i=0; i<Tabas.length; i++)
		{
			if(Tabas[i].Name ==name)
			{
				Tabas[i].Src =newUrl;
			}
		}
	}
	this.remove=function(name)
	{
		try
		{
			for(i=0; i<Tabas.length; i++)
			{
				if(Tabas[i].Name ==name)
				{
					var oParentElement =Tabas[i].oTab.parentElement;
					oParentElement.removeChild(Tabas[i].oTab);
					this.select(Tabas[i-1].Name);
				}
			}
		}
		catch(e)
		{
			//alert(e);
		}
	}
	this.abled =function(name)
	{
		for(ii=0; ii<Tabas.length; ii++)
		{
			if(Tabas[ii].Name ==name)
			{
				Tabas[ii].abled =true;
				document.getElementsByName("span"+name)[0].innerHTML="<font color='#0000CC' style='font-size: 14px;line-height: 26px'>"+Tabas[ii].Title+"</font>";
				//document.getElementById("span"+name).innerHTML="<font color='#0000CC' style='font-size: 14px;line-height: 26px'>"+Tabas[ii].Title+"</font>";
				break;
			}
		}
	}
	this.select =function(name)
	{
		//判断是否有效
		var ii =0;
		var tabAbled =false;
		for(; ii<Tabas.length; ii++)
		{
			if(Tabas[ii].Name ==name)
			{
				if(Tabas[ii].abled)
					tabAbled =true;
				break;
			}
		}
		if(tabAbled)
		{
			for(ii=0; ii<Tabas.length; ii++)
			{
				if(Tabas[ii].Name ==name)
				{
					Tabas[ii].oTab.className ="tabselect";
					if(Tabas[ii].Src.toLowerCase().indexOf("javascript:") ==0)
					{//调用页面JS方法
						onDo(Tabas[ii].Src.substr(11));
					}
					else
					{
						if(navigator.userAgent.indexOf("Chrome") > -1)
						{
							FrameHandle.src =Tabas[ii].Src;
						}
						else if(navigator.userAgent.indexOf("Safari") > -1)
						{
							FrameHandle.location.href =Tabas[ii].Src;
						}
						else if(navigator.userAgent.indexOf("MSIE") > -1)
						{
							FrameHandle.location.href =Tabas[ii].Src;
						}
						else
						{
							FrameHandle.src =Tabas[ii].Src;
						}
						//FrameHandle.location =Tabas[ii].Src;
						
						//dynIframeSize(FrameHandle);
					}
				}
				else
				{
					Tabas[ii].oTab.className ="tabnoselect";
				}
			}
		}
	}
}
/*********************************************
 *
 *  TAB页的实现 
 *
 ********************************************/
 function TabObj(iSeq, sTabName, sTabTitle, sTabSrc, abled)
{
	var sTabId = "tab"+sTabName+"Div";
	this.Name=sTabName;
	this.Title=icos[iSeq>4?0:iSeq]+sTabTitle;
	this.Src=sTabSrc;
	if(typeof(abled) =='undefined')
		abled =true;
	this.abled =abled;
	/*this.oTab = document.createElement("<div id='"+sTabId+"'>");*/
	this.oTab = document.createElement("div");
	this.oTab.id= sTabId;
	this.oTab.className ="tabnoselect";
	if(!this.abled)
		this.oTab.innerHTML ="<span id='span"+sTabName+"' name='span"+sTabName+"'><font color='#747474' style='font-size: 14px;line-height: 26px;'>"+this.Title+"</font></span>";
	else
		this.oTab.innerHTML ="<span id='span"+sTabName+"' name='span"+sTabName+"'><font color='#0000CC' style='font-size: 14px;line-height: 26px;'>"+this.Title+"</font></span>";
	this.oTab.onclick= function()
	{
		Tabs.select(sTabName);
	};
}
