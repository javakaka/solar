var icos =new Array();
icos.push("1");
icos.push("2");
icos.push("3");
icos.push("4");
icos.push("5");
icos.push("6");
icos.push("7");
icos.push("8");
icos.push("9");
icos.push("10");
var Tabs = new TabObjs();
/*********************************************
 *
 *  TABҳ���ϵ�ʵ�� 
 *
 ********************************************/
function TabObjs()
{
   var Tabas = new Array();
	this.FrameHandle =null;
	var sTitle =null;
	var idDiv =null;
	//name����title����url������abled�Ƿ���Ч
	this.add =function(name, title, url, abled)
	{
		//��Ҫ�ж�name�Ƿ���ڣ���������򸲸�
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
	{//���¼���Tabs��ǩ��һ����ҳ���Ѿ��γɱ�ǩ�飬����Ϊҵ�����Ҫ����ҳ���趯̬���ӱ�ǩ�������ȵ���add������Ȼ����ô˷���ʵ��
		for(i=idDiv.children.length-1; i>=0; i--)
		{
			idDiv.removeChild(idDiv.children(i));
		}

		//д��һ����
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
			this.FrameHandle =frame;
		else
		{
			$E.message("��ָ��֡��");
			return ;
		}
		this.sTitle =title;
		if(!div)
		{
			$E.message("��ָ���㣡");
			return ;
		}
		else
		{
			div.className ="tabDIV";
		}
		idDiv =div;
		//д��һ����
		var head =document.createElement("<div>");
		head.className ="tabtitle";
		head.innerText =title;
		div.appendChild(head);
		for(i=0; i<Tabas.length; i++)
		{
			div.appendChild(Tabas[i].oTab);
		}
	}
	//�޸�Tab����
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
	//�޸�Tab ����
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
				document.getElementsByName("span"+name)[0].innerHTML="<font color='#0000CC'>"+Tabas[ii].Title+"</font>";
				break;
			}
		}
	}
	this.select =function(name)
	{
		//�ж��Ƿ���Ч
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
					{//����ҳ��JS����
						onDo(Tabas[ii].Src.substr(11));
					}
					else
					{
						this.FrameHandle.location =Tabas[ii].Src;
						//dynIframeSize(this.FrameHandle);
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
 *  TABҳ��ʵ�� 
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
	this.oTab = document.createElement("<div id='"+sTabId+"'>");
	this.oTab.className ="tabnoselect";
	if(!this.abled)
		this.oTab.innerHTML ="<span id='span"+sTabName+"'><font color='#747474'>"+this.Title+"</font></span>";
	else
		this.oTab.innerHTML ="<span id='span"+sTabName+"'><font color='#0000CC'>"+this.Title+"</font></span>";
	this.oTab.onclick= function()
	{
		Tabs.select(sTabName);
	};
}
