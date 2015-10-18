function $$(a) 
{
	if (typeof (a) == "string") 
	{
		a = document.getElementById(a);
		if (!a) 
		{
			return null
		}
	}
	return a
}
function $$V(b) {
    var a = b;
    b = $$(b);
    if (!b) {
        alert("表单元素不存在:" + a);
        return null
    }
    switch (b.type.toLowerCase()) {
        case "submit": case "hidden": case "password": case "textarea": case "file": case "image": case "select-one": case "text": return b.value;
        case "checkbox": case "radio": if (b.checked) {
                return b.value
            }
            else {
                return null
            }
        default: return ""
    }

}

function $$S(c, b) 
{
	var a = c;
	c = $$(c);
	if (!b && b != 0) 
	{
		b = ""
	}
	if (!c) 
	{
		alert("表单元素不存在:" + a);
		return
	}
	switch (c.type.toLowerCase()) 
	{
		case "submit": case "hidden": case "password": case "textarea": case "button": case "file": case "image": case "select-one": case "text": 
			c.value = b;
			break;
		case "checkbox": case "radio": 
			if (c.value == "" + b) 
			{
				c.checked = true
			}
			else 
			{
				c.checked = false
			}
			break
	}
};
var $$E=
{
}
;
/*聚焦*/
$$E.focus =function(a)
{
	a =$$(a);
	if(a)
		a.focus();
}
;
/*重新加载*/
$$E.reload =function()
{
	document.location.reload();
}
/*两端去空格*/
$$E.trim =function(text) 
{
	return (text || "").replace(/^\s+|\s+$$/g, "");
};

$$E.able =function(a)
{
	a =$$(a);
	if(a)
		a.disabled =false;
}
;
$$E.disable =function(a)
{
	a =$$(a);
	if(a)
		a.disabled =true;
}
;
/**
*提示消息
*@param msg 消息内容
*@param display true一直显示
*/
$$E.message =function(msg, display)
{
	try
	{
		_popMessage(msg);
	}
	catch (e)
	{
		alert(msg);
	}
}

/*获取具有指定ClassName的元素集合
*/
$$E.getElementsByClassName =function(clsName,htmltag)
{
	var arr = new Array();    
	var elems = document.getElementsByTagName(htmltag);   
	for( var cls, i = 0; ( elem = elems[i] ); i++ )
	{   
		if ( elem.className == clsName )
		{ //只能取到className完全相等的情况，为考虑有多个class的情况   
			arr[arr.length] = elem;   
		}   
	}   
	return arr;   
} 
/*获取页面链接参数串
*/
$$E.getQueryString =function()
{
	var url=location.href;
	if(url.indexOf("?") !=-1)
		return url.substr(url.indexOf("?")+1);
	else
		return "";
}

/*将日期转为如2009年02月09日*/

$$E.toCnDate =function(sDate)
{
	var sYear=sDate.substring(0,4);
	var sMonth=sDate.substring(5,7);
	var sDay=sDate.substring(8,11);
	var sRDate;
	if(sDate=="")
	{
		sRDate='    年    月    日';
	}
	else
	{ 
		sRDate=sYear+'年'+sMonth+'月'+sDay+'日';
	}
	return sRDate;
}
/*获取URL传过来的参数值
*/
$$E.getParameter =function(sParaName, sDefaultValue)
{
	var sParameterVar ="";
	var url=location.href;
	var parameters=url.substr(url.indexOf("?")+1);
	var parameterItems=parameters.split("&");
	var parameterName;
	var parameterVar;
	for(i in parameterItems)
	{
		parameterName=parameterItems[i].split("=")[0];
		parameterVar=parameterItems[i].split("=")[1];
		if(parameterName==sParaName)
		{
			sParameterVar =parameterVar;
			break;
		}
	}
	for(i in parameterItems)
	{
		parameterName=parameterItems[i].split("=")[0];
		parameterVar=parameterItems[i].split("=")[1];
		if(parameterName.toUpperCase()==sParaName.toUpperCase())
		{
			sParameterVar =parameterVar;
			break;
		}
	}
	if(sParameterVar =="" && sDefaultValue)
		sParameterVar =sDefaultValue;
	if(sParameterVar !="" && sParameterVar !=null)
	{
		if(sParameterVar.substring(sParameterVar.length-1) =="#")
		{//当为href 添加onclick事件时，自动在href url 后附加#
			sParameterVar =sParameterVar.substring(0, sParameterVar.length-1);
		}
	}
	return sParameterVar;
}
;

$$E.hide=function(a)
{
	if(a)
		a.style.display ="none";
}
/*具有Asscii格式的字符串(用逗号隔开)转换成String*/
$$E.assciiToString =function(s)
{
	var st ="";
	var sa =s.split(",");
	for(var i=0; i<sa.length; i++)
	{
		t =parseInt(sa[i]);
		st +=String.fromCharCode(t);
	}
	return st;
}
$$E.show=function(a)
{
	if(a)
		a.style.display=(a.displayBak)?a.displayBak:""
};
/*置为只读*/

$$E.setRead=function(a)
{
	a =$$(a);
	if(a)
		a.readOnly =true;
}
$$E.setWrite=function(a)
{
	a =$$(a);
	if(a)
		a.readOnly =false;
}

/*得到页面元件的所有状态（abled/disabled)*/
var _PAGE_COMPONENT_STATE =[];
$$E.savePageComponentState=function()
{
	for(i=0; i<document.all.length; i++)
	{
		if(document.all[i].disabled)
			_PAGE_COMPONENT_STATE.push([document.all[i], 1]);
		else
			_PAGE_COMPONENT_STATE.push([document.all[i], 0]);
	}
}

$$E.disabled=function()
{
	this.savePageComponentState();
	for(i=0; i<document.all.length; i++)
	{
		type =document.all[i].type;
		if(type =="button"
			|| type =="reset"
			|| type =="submit")
		{
			document.all[i].disabled =true;
		}
	}
}
$$E.replaceAll =function(s1, s2, s3)
{
	while(s1.indexOf(s2) !=-1)
	{
		s1 =s1.replace(s2, s3);
	}
	return s1;
}
/*将换行字元(\r\n)替換成html的换行(<br />)*/
$$E.replaceBr =function(s1)
{
	s1 = s1.replace(/\n/g,"<br/>");
	return s1;
}

/*把特殊符号替换成HTML特殊符号
*/
$$E.html =function(str)
{
	var s =/\n/g;
	str =str.replace(s, "<br/>");
	s =/ /g;
	str =str.replace(s, "&nbsp;");
	return str;
}
$$E.abled=function()
{
	this.resetPageComponentState();
}
/*恢复页面元件的状态*/

$$E.resetPageComponentState=function()
{
	for(i=0; i<_PAGE_COMPONENT_STATE.length; i++)
	{
		if(_PAGE_COMPONENT_STATE[i][1] ==1)
			_PAGE_COMPONENT_STATE[i][0].disabled =true;
		else
			_PAGE_COMPONENT_STATE[i][0].disabled =false;
	}
	_PAGE_COMPONENT_STATE =[];
}

/*获得Form中的数据集合*/

$$E.getFormData=function(a)
{
	var oParams =[];
	var b =null;
	if(a)
		b=$$(a);
	else
		b=document;
	var oInputs =b.all.tags("INPUT");
	for(i=0; i<oInputs.length; i++)
	{
		if(!oInputs[i].name || oInputs[i].name.length ==0)
		{
			continue;
		}
		switch(oInputs[i].type.toLowerCase())
		{
			case 'text':
			case 'hidden':
			case 'password':
				oParams.push(new Param(oInputs[i].name, oInputs[i].value));
				break;
			case 'radio':
				var bb =false;
				for(k=0; k<oParams.length; k++)
				{
					var aa =oParams[k];
					if(aa.getName() ==oInputs[i].name)
					{
						bb =true;
						if(oInputs[i].checked)
							oParams[k] =new Param(oInputs[i].name, oInputs[i].value);
						break;
					}
				}
				if(!bb)
				{
					if(oInputs[i].checked)
						oParams.push(new Param(oInputs[i].name, oInputs[i].value));
				}
				break;
			case 'checkbox':
				var bb =false;
				for(k=0; k<oParams.length; k++)
				{
					var aa =oParams[k];
					if(aa.getName() ==oInputs[i].name)
					{
						bb =true;
						if(oInputs[i].checked)
							oParams[k] =new Param(oInputs[i].name, aa.getValue()+","+oInputs[i].value);
						break;
					}
				}
				if(!bb)
				{
					if(oInputs[i].checked)
						oParams.push(new Param(oInputs[i].name, oInputs[i].value));
				}
				break;
		}
	}
	var oTextArea =b.all.tags("TEXTAREA");
	for(i=0; i<oTextArea.length; i++)
	{
		if(!oTextArea[i].name || oTextArea[i].name.length ==0)
			continue;

		oParams.push(new Param(oTextArea[i].name, oTextArea[i].value));
	}
	var oSelect =document.all.tags("SELECT")
	for(i=0; i<oSelect.length; i++)
	{
		if(!oSelect[i].name || oSelect[i].name.length ==0)
			continue;
		oParams.push(new Param(oSelect[i].name, oSelect[i].value));
	}
	return oParams;
}
/*打开全屏窗口
*/
$$E.openFullWin =function(sUrl)
{
	var nw =window.open(sUrl,"", "scrollbars");
	nw.moveTo(0,0);
	nw.resizeTo(screen.availWidth, screen.availHeight);
}
$$E.runOpen =function(GetURL, IsModal, GetWidth, GetHeight)
{
	sTmpUrlArgs = GetURL;
	if (typeof(GetWidth)	!= 'number' || GetWidth < 0)  GetWidth	= screen.availWidth/2;
	if (typeof(GetHeight)	!= 'number' || GetHeight < 0) GetHeight	= screen.availHeight/2;
	var sFeatures = 'dialogHeight	=' + GetHeight + 'px;' +
					'dialogWidth	=' + GetWidth + 'px;' +
					'help: no;' +
					'status: no;';
	var oRetrun =null;
	if (typeof(IsModal) == 'boolean' && IsModal == false)
	{ 
		oRetrun =window.showModelessDialog(GetURL,window,sFeatures);
	}
	else
	{
		oRetrun =window.showModalDialog(GetURL,window,sFeatures);
	}
	return oRetrun;
}


/*随机函数*/

$$E.randomChar =function(l)  
{
	var  x="0123456789qwertyuioplkjhgfdsazxcvbnm";
	var  tmp="";
	for(var  i=0;i<l;i++)
	{
		tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
	}
	return  tmp;
}
/*跳转页面
*/
$$E.loca =function(url)
{
	if(url)
		document.location.href =url;
	else
		$$E.message("请提供跳转链接地址！");
}

/*新开页面
*/
$$E.open =function(url)
{
	if(url)
		window.open(url);
	else
		$$E.message("请提供跳转链接地址！");
}
var Table=
{
}
;
Table.runRowInsert=function(TableHandle, GetCells, RowIndex)
{
	var oRow = null;
	var oCel = null;

	if (typeof(GetCells) != 'object' || GetCells.length == 0){
		alert('������Ϣ:\n* û���κ����������!');
	}else{
		if (typeof(RowIndex) != 'number'|| RowIndex < 0){
			oRow = TableHandle.insertRow();

		}else{
			if (RowIndex < TableHandle.length){
				oRow = TableHandle.insertRow(RowIndex);
			}else{
				oRow = TableHandle.insertRow();
			}
		}
		for (var i = 0; i < GetCells.length; i++){
			oCel = oRow.insertCell();
			oCel.innerHTML = GetCells[i];
		}
	}
	return oRow;
}
/*
*表格清除
*/
Table.clear =function(TableHandle, deleteAll)
{
	if (TableHandle == null) return;
	if(typeof deleteAll !="undefined" && deleteAll)
		for (var i = TableHandle.rows.length; i > 0; i--)
			TableHandle.deleteRow(i-1);
	else
		for (var i = TableHandle.rows.length; i > 1; i--)
			TableHandle.deleteRow();
}
Table.clickRow =function(a)
{
	a =$$(a);
	var b = null;
	for (i = 1; i < a.rows.length; i++){
		if  (a.rows(i).className == 'rowOver'){
			b = a.rows(i);
			break;
		}
	}
	return b;
}

/*选中某行*/

Table.selectedRow =function(TableHandle, RowIndexs)
{
	if (typeof(RowIndexs) != 'object' ||
		RowIndexs.length == 0) return;
	for (var i = 0; i < RowIndexs.length; i++){
		TableHandle.rows(RowIndexs[i]).className = 'rowOver';
		var oChk = TableHandle.rows(RowIndexs[i]).cells(0).children(0);
		if (oChk != null && oChk.checked != null){
			oChk.checked = true;
		}
	}
}

/*得到选中的多行*/

Table.clickMultipleRow=function(TableHandle){
	var oMultiple = new Array();
	var e = null;
	var iLoop = 0;
	for (i = 1; i < TableHandle.rows.length; i++){
		e = TableHandle.rows(i)
		if  (e.className == 'rowOver'){
			oMultiple[iLoop] = e;
			iLoop++;
		}
	}
	return oMultiple;
}

Table.multipleClick =function (){
	var e = event.srcElement;
//	if (e.tagName != 'TD') return;
	while (e.tagName != 'TR') e = e.parentElement;
	if (e.rowIndex == 0 ||
		e.className == 'itemDisabled') return;
	if  (e.className != 'rowOver'){
		e.className = 'rowOver';
	}else{
		e.className = 'rowOut';
	}
}



Table.click =function()
{
	var e = event.srcElement;
	if(typeof(e.tagName)=='undefined') return;
	if (e.tagName == 'TABLE' || e.tagName == 'TR' || e.tagName == 'TBODY')
		return;
	while (e.tagName != 'TR')
		e = e.parentElement;
	if (e.rowIndex == 0 || e.className == 'itemDisabled')
		return;
	var el = e;
	while (el.tagName != 'TABLE') 
		el = el.parentElement;
	
	for (var i = 0; i < el.rows.length; i++)
	{
		if (el.rows(i).className == 'rowOver' && el.rows(i) !=e)
		{
			el.rows(i).className = 'rowOut';
			break;
		}
	}
	 e.className ='rowOver';
}
Table.fixRow =function(RowIndex)
{
	var e = event.srcElement;
	if (e.tagName != 'DIV') return;
	var oTab = e.children(0);
	var iTop = e.scrollTop;
	var iBor =0;
	if(oTab.border =="")
		iBor =0;
	else
		iBor = parseInt(oTab.border);
	if (RowIndex == null || RowIndex < 0) RowIndex = 0;
	with (oTab.rows(RowIndex).style){
		//if (position != 'absolute') position	= 'absolute';
		left	= -iBor;
		top		= iTop-iBor;
	}
}
/*
*删除指定行
*/
Table.del =function(RowHandle, oTable)
{
	var bDeleted =false;
	oTable =oTable? oTable:RowHandle.parentElement;
	for (i = 0; i < oTable.rows.length; i++){
		if  (oTable.rows(i) ==RowHandle)
		{
			oTable.deleteRow(i);
			bDeleted =true;
			break;
		}
	}
	return bDeleted;//是否进行删除
}
/*插入空行 oTableHandle 表格 iCells列数目 iRowIndex 起始行*/

Table.insertEmptyRow =function(oTableHandle, iCells, iRowIndex)
{
	var iRowPosition =iRowIndex?iRowIndex:oTableHandle.rows.length;
	oRow =oTableHandle.insertRow(iRowIndex)
	for(j=0; j<iCells; j++)
	{
		oRow.insertCell().innerHTML ="&nbsp;";
	}
	return oRow;
}
Table.insertCell =function(oRowHandle, sInnerHtml, sClassName, sAlign)
{
	var oCell =oRowHandle.insertCell();
	oCell.innerHTML =sInnerHtml;
	if(sClassName && sClassName !=null)
		oCell.className =sClassName;
	if(sAlign && sAlign !=null)
		oCell.style.textAlign=sAlign;
	return oCell;
}

/*OPTION 操作，包括Select/radio/checkbox*/
var Options=
{
}
;
/*创建 handle 容器句柄 type 类型 name 名称 option 选择项 selectvalue 默认选择值 props 属性*/

Options.create =function(handle, type, name, option, selectvalue, props)
{
	if(!handle)
		return;
	props =props?props:"";
	var html ="";
	switch(type.toLowerCase())
	{
		case 'select':
			html +="<select name='"+name+"' "+props+">"
			for(i=0; i<option.length; i++)
			{
				if(selectvalue ==option[i][0])
					html +="<option value='"+option[i][0]+"' selected>"+option[i][1]+"</option>"
				else
					html +="<option value='"+option[i][0]+"'>"+option[i][1]+"</option>"
			}
			html +="</select>";
			break;
		case 'radio':
			for(i=0; i<option.length; i++)
			{
				if(selectvalue ==option[i][0])
					html +="<input name='"+name+"' type=radio id='idrd"+name+i+"' value='"+option[i][0]+"' checked><label style='cursor:hand' for='idrd"+name+i+"' "+props+">"+option[i][1]+"</label>";
				else
					html +="<input name='"+name+"' type=radio id='idrd"+name+i+"' value='"+option[i][0]+"'><label		style='cursor:hand' for='idrd"+name+i+"' "+props+">"+option[i][1]+"</label>";
			}
			break;
		case 'checkbox':
			for(i=0; i<option.length; i++)
			{
				if(selectvalue ==option[i][0])
					html +="<input name='"+name+"' type=checkbox id='idrd"+name+i+"' name='"+name+"' value='"+option[i][0]+"' checked><label style='cursor:hand' for='idrd"+name+i+"' "+props+">"+option[i][1]+"</label>";
				else
					html +="<input name='"+name+"' type=checkbox id='idrd"+name+i+"' name='"+name+"' value='"+option[i][0]+"'><label		style='cursor:hand' for='idrd"+name+i+"' "+props+">"+option[i][1]+"</label>";
			}
			break;
		default:
			$$E.message("错误的控件类型！");
	}
	handle.innerHTML =html;
}
;
Options.checkAll =function(handlename, checked)
{
	var handles =document.getElementsByName(handlename);
	for(var i=0; i<handles.length; i++)
	{
		handles[i].checked =checked;
	}
}
;
var Td=
{
}
;
/*显示排序图片*/

Td.showSortIco =function(oTd)
{
	for(i=0; i<oTd.parentElement.children.length; i++)
	{
		if(oTd.parentElement.children(i) ==oTd)
		{
			if(oTd.sort_name.indexOf("ASC") !=-1)
				oTd.innerHTML =oTd.desc+"<img src='"+WEB_PATH+"/images/asc.gif'>";
			else if(oTd.sort_name.indexOf("DESC") !=-1)
				oTd.innerHTML =oTd.desc+"<img src='"+WEB_PATH+"/images/desc.gif'>";
			else
			{
				oTd.innerHTML =oTd.desc+"<img src='"+WEB_PATH+"/images/asc.gif'>";
				oTd.sort_name=oTd.sort_name+"|ASC";
			}

		}
		else if(oTd.parentElement.children(i).desc)
		{
			oTd.parentElement.children(i).innerHTML =oTd.parentElement.children(i).desc;
		}
	}
}

/*对列表数据排序 oTd 点击列句柄 oServer Ajax调用对象 oCallbakMehtod 回调方法体
*/
Td.sort =function(oTd, oServer, oCallBackMehtod)
{
	if(oServer ==null)
		return;
	if(oTd && oServer && oCallBackMehtod)
	{
		var sFieldName =oTd.sort_name;
		var sOrderBy ="";
		//alert(sFieldName);
		var oFieldName =sFieldName.split("|");
		if(oFieldName.length ==2)
		{
			if(oFieldName[1] =="ASC")
			{
				sFieldName =oFieldName[0]+"|DESC";
				sOrderBy =oFieldName[0]+" DESC";
			}
			else
			{
				sFieldName =oFieldName[0]+"|ASC";
				sOrderBy =oFieldName[0]+" ASC";
			}
		}
		else
		{
			sOrderBy = oFieldName[0]+" ASC";
			sFieldName =oFieldName[0]+"|ASC";
		}
		oTd.sort_name =sFieldName;
		oServer.reset();
		oServer.setParamValue("default","orderby", sOrderBy);
		oCallBackMehtod(oServer);
		this.showSortIco(oTd);
	}
	else
	{
		$E.message("方法调用参数有误！");
	}
}

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
