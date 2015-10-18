function checkForm(FormHandle)
{
	FormHandle =FormHandle?FormHandle:document;
	var inputs	= FormHandle.all.tags('INPUT');
	var areas	= FormHandle.all.tags('TEXTAREA');
	var sels	= FormHandle.all.tags('SELECT');
	
	if (inputs.length > 0){
		for (var i = 0; i < inputs.length; i++){
			if (!checkControl(inputs[i])) return false;
		}
	}
	if (sels.length > 0){
		for (var i = 0; i < sels.length; i++){
			if (!checkControl(sels[i])) return false;
		}
	}	
	if (areas.length > 0){
		for (var i = 0; i < areas.length; i++){
			if (!checkControl(areas[i])) return false;
		}
	}
	return true;
}

function checkControl(ControlHandle){
	var type_num	= /[-|+]?\d+$/;
	var type_date	= /\d{2,4}[-\/]\d{1,2}[-\/]\d{1,2}$/;
	var type_datetime= /\d{2,4}[-\/]\d{1,2}[-\/]\d{1,2}( \d{1,2}:\d{1,2}:\d{1,2})?$/
	var type_mail	= /\w+([-.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	var type_http	= /http:\/\/[\w-]+(\.[\w-]+)*(\/[\w-]?)*$/;
	
	var desc		= '未知控件';

	if (ControlHandle.desc != null){
		desc = ControlHandle.desc;
	}else if(ControlHandle.id != null){
		desc = ControlHandle.id;
	}else if(ControlHandle.name != null){
		desc = ControlHandle.name;
	}

	if (ControlHandle.style.visibility == 'hidden') return true;

	if(typeof ControlHandle.notnull !='undefined' )
	{
		if (ControlHandle.value	== ''){
			alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能为空!');
			ControlHandle.focus();
			return false;
		}
	}
	else
		if(ControlHandle.value	== '')
			return true;
	if (ControlHandle.datatype  == null) return true;

	var result		= null;
	var max			= null;
	var min			= null;
	
	var datatype	= ControlHandle.datatype;	
	switch (datatype){
		case 'datetime':
		case 'date':
			if (ControlHandle.max != null){
				result	= result[0].replace(/\-/g,'/');
				if (IsValidDateTimeString(result)) max = new Date(result); else max = null;
			}
			if (ControlHandle.min != null){
				result	= result[0].replace(/\-/g,'/');
				if (IsValidDateTimeString(result)) min = new Date(result); else min = null;
			}
			break;
			
		case 'ip':
			if (ControlHandle.max != null) max	= ControlHandle.max;
			if (ControlHandle.min != null) min	= ControlHandle.min;
			break;
			
		default:
			if (ControlHandle.max != null){
				result	= ControlHandle.max.match(type_num);
				if (result != null) max	= parseInt(result[0], 10);
			}
			if (ControlHandle.min != null){
				result	= ControlHandle.min.match(type_num);
				if (result != null) min	= parseInt(result[0], 10);
			}
			break;
	}

	switch (datatype){
		case 'int':
			var iaInt =new Array('0','1','2','3','4','5','6','7','8','9');
			for(i=0; i<ControlHandle.value.length; i++)
			{
				var isInt =false;
				for(j=0; j<iaInt.length; j++)
				{
					if(ControlHandle.value.charAt(i) ==iaInt[j])
					{
						isInt =true;
					}
				}
				if(!isInt)
				{
					alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式错误,输入内容为整数型!\n* 示例: 0123456789');
					ControlHandle.focus();
					return false;
				}
			} 
			if (max != null && ControlHandle.value > max){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能大于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && ControlHandle.value < min){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能小于'+min+'!');
				ControlHandle.focus();
				return false;
			}		

		case 'number':
			result = ControlHandle.value.match(type_num);
			if (result == null){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式错误!\n* 示例: -+0123456789');
				ControlHandle.focus();
				return false;
			}
			if (max != null && parseInt(result[0], 10) > max){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能大于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && parseInt(result[0], 10) < min){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能小于'+min+'!');
				ControlHandle.focus();
				return false;
			}		
		break;
		case 'mail':
			result = ControlHandle.value.match(type_mail);
			if (result == null){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式错误!\n* 示例: xxx@xxx.xxx');
				ControlHandle.focus();
				return false;
			}
			if (max != null && result[0].length > max){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值长度不能多于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && result[0].length < min){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值字节长度不能少于'+min+'!');
				ControlHandle.focus();
				return false;
			}
		break;
		case 'http':
			result = ControlHandle.value.match(type_http);
			if (result == null){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式错误!\n* 示例: http://xxx.xxx.xxx');
				ControlHandle.focus();
				return false;
			}
			if (max != null && result[0].length > max){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值字节长度不能多于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && result[0].length < min){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值字节长度不能少于'+min+'!');
				ControlHandle.focus();
				return false;
			}
		break;
		case 'date':
			result = ControlHandle.value.match(type_date);
			if (result == null || IsValidDateTimeString(result[0]) == false){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式错误!\n* 示例: 1999-12-31');
				ControlHandle.focus();
				return false;
			}
			result = result[0].replace(/\-/g,'/');
			result = new Date(result);
			if (max != null && result > max){
				max = max.getFullYear()+'-'+(max.getMonth()+1)+'-'+max.getDate();
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能大于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && result < min){
				min = min.getFullYear()+'-'+(min.getMonth()+1)+'-'+min.getDate();
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能小于'+min+'!');
				ControlHandle.focus();
				return false;
			}
		break;
		case 'datetime':
			result = ControlHandle.value.match(type_datetime);
			if (result == null || IsValidDateTimeString(result[0]) == false){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式错误!\n* 示例: 1999-12-31 11:59:59');
				ControlHandle.focus();
				return false;
			}
			result = result[0].replace(/\-/g,'/');
			result = new Date(result);
			if (max != null && result > max){
				max = max.getFullYear()+'-'+(max.getMonth()+1)+'-'+max.getDate()+' '+max.getHours()+':'+max.getMinutes()+':'+max.getSeconds();
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能大于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && result < min){
				min = min.getFullYear()+'-'+(min.getMonth()+1)+'-'+min.getDate()+' '+min.getHours()+':'+min.getMinutes()+':'+min.getSeconds();
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能小于'+min+'!');
				ControlHandle.focus();
				return false;
			}
		break;
		case 'ip':
			if (getCheckIPAddress(ControlHandle.value) == false){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值格式或规则错误!\n* 示例: 0.0.0.0 - 255.255.255.255');
				ControlHandle.focus();
				return false;
			}
			if (max != null && getCheckIPAddress(max) == false) max = null;
			if (min != null && getCheckIPAddress(min) == false) min = null;
			
			if (max != null && getMatchIPAddress(ControlHandle.value,max) == true){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能大于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && getMatchIPAddress(ControlHandle.value,min) == false){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值不能小于'+min+'!');
				ControlHandle.focus();
				return false;
			}
		break;
		default:
			result = getByteLength(ControlHandle.value);
			if (max != null && result > max){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值字节长度不能多于'+max+'!');
				ControlHandle.focus();
				return false;
			}
			if (min != null && result < min){
				alert('提示信息\n\n* 说明: '+desc+'\n* 描述: 输入值字节长度不能少于'+min+'!');
				ControlHandle.focus();
				return false;
			}
		break;
	}
	return true;
}

function getCheckIPAddress(IPAddress) {
	var type_ip = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;
	var result = IPAddress.match(type_ip);
	if (result == null
		|| RegExp.$1 > 255 || RegExp.$1 < 0 
		|| RegExp.$2 > 255 || RegExp.$2 < 0 
		|| RegExp.$3 > 255 || RegExp.$3 < 0 
		|| RegExp.$4 > 255 || RegExp.$4 < 0){
		return false;
	}else{
		return true;
	}
}

function getMatchIPAddress(IPAddress1, IPAddress2) {
	var aIP1 = IPAddress1.split('.');
	var aIP2 = IPAddress2.split('.');
	var iIP1 = aIP1[0]*1000000000+aIP1[1]*1000000+aIP1[2]*1000+aIP1[3];
	var iIP2 = aIP2[0]*1000000000+aIP2[1]*1000000+aIP2[2]*1000+aIP2[3];
	if (iIP1 > iIP2) return true; else return false;
}

function getTrimString(GetString){
	//var returnString = this;
	//for(var i = 0; i < returnString.length && returnString.charAt(i) == ' '; i++ );
	//for(var j = returnString.length; j > 0 && returnString.charAt(j-1) == ' '; j--);
	//if (i > j){return '';}else{return returnString.substring(i,j);}
	GetString = getLTrimString(GetString);
	GetString = getRTrimString(GetString);
	return GetString;	
}

function getLTrimString(GetString){
	//var returnString = this;
	//for(var i = 0; i < returnString.length && returnString.charAt(i) == ' '; i++ ) ;
	//return returnString.substring(i,returnString.length);
	return GetString.replace(/^\s+/,'');	
}

function getRTrimString(GetString){
	//var returnString = this;
	//for(var i = returnString.length; i > 0 && returnString.charAt(i-1) == ' '; i--) ;
	//return returnString.substring(0,i);
	return GetString.replace(/\s+$/,'');
}

function getByteLength(GetString){
	var intCount = 0;
	for(var i = 0;i < GetString.length;i++)
	{
		// Ascii码大于255是双字节的字符
		if(GetString.charCodeAt(i) > 255) intCount += 2; else intCount += 1;
	}
	return intCount;
}
function initCtrlStyle(a)
{
	if(!a || a.type =="load")
	{
		for(i=0;i <document.all.length; i++)
		{
			initCtrlStyle(document.all[i]);
		}
		return;
	}
    var b = a.type;
	 if(!b)
		 return;
    switch (b) {
        case "text": case "password": case "": a.className="inputText";
            a.onmouseenter = function() {
                this.style.borderColor = "#00aaee"
            }
			;
            a.onmouseleave = function() {
                this.style.borderColor = ""
            }
				;
				var msg ="";
				if(typeof a.notnull !='undefined')
				{
					msg ="不能为空!";
				}
				if(a.getAttribute("help"))
				{
					msg +=a.getAttribute("help");
				}
            a.onfocus = function(){
					if(msg !="")
					{
						//暂时不显示提示框
						//Tip.show(a, msg);
					}
					 this.style.borderColor = "#ff8800";
					 this.onmouseenter = null;
					 this.onmouseleave = null
            }
				;
            a.onblur = function() {
               this.style.borderColor = "";
                this.onmouseenter = function() {
                    this.style.borderColor = "#00aaee"
                }
					;
                this.onmouseleave = function() {
                    this.style.borderColor = ""
                }

            }
					;
            break;
        case "submit": case "reset": case "button": a.className ="inputButton";
            a.hideFocus = true;
            if (a.parentElement.tagName != "A") {
                a.outerHTML = "<a href='javascript:void(1);' ztype='zInputBtnWrapper' class='zInputBtn' hidefocus='true' tabindex='-1'>" + a.outerHTML + "</a>"
            }
            break;
        case "checkbox": a.className ="inputCheckbox";
            break;
        case "radio": a.className ="inputRadio";
            break;
        case "file": a.className ="inputFile";
            break;
        case "image": a.className ="inputImage";
            break;
		  case "textarea":
		  		var msg ="";
				if(a.getAttribute("NOTNULL"))
				{
					msg ="不能为空!";
				}
				if(a.getAttribute("help"))
				{
					msg +=a.getAttribute("help");
				}
            a.onfocus = function(){
					 //暂时不显示提示框
					 //Tip.show(a, msg);
                this.style.borderColor = "#ff8800";
                this.onmouseenter = null;
                this.onmouseleave = null
            }
            a.onblur = function() {
               this.style.borderColor = "";
                this.onmouseenter = function() {
                    this.style.borderColor = "#00aaee"
                }
					;
                this.onmouseleave = function() {
                    this.style.borderColor = ""
                }

            }
				;
				break;
        default:
    }
}
;
if(document.attachEvent)
	window.attachEvent("onload", initCtrlStyle);
function IsValidDateTimeString(DateTimeString){
	if (typeof(DateTimeString) != 'string') return false;

	var str_m_31	= ',1,3,5,7,8,10,12,';
	var str_m_30	= ',4,6,9,11,';
	var reg_date	= /(\d{2,4})[-\/](\d{1,2})[-\/](\d{1,2})( (\d{1,2}):(\d{1,2}):(\d{1,2}))?$/;
	var arrDate		= reg_date.exec(DateTimeString);
	if (arrDate == null) return false;
	for (var i = 1; i < arrDate.length; i++) if (arrDate[i].toString() == '') arrDate[i] = '0';

	if (parseInt(arrDate[2], 10) < 1 || parseInt(arrDate[2], 10) > 12) return false;
	if (parseInt(arrDate[3], 10) < 1 || parseInt(arrDate[3], 10) > 31) return false;
	if (parseInt(arrDate[4], 10) < 0 || parseInt(arrDate[4], 10) > 59) return false;
	if (parseInt(arrDate[5], 10) < 0 || parseInt(arrDate[5], 10) > 59) return false;
	if (parseInt(arrDate[6], 10) < 0 || parseInt(arrDate[6], 10) > 59) return false;

	if (str_m_31.indexOf(','+parseInt(arrDate[2], 10)+',') == -1){
		if(str_m_30.indexOf(','+parseInt(arrDate[2], 10)+',') == -1){
			if (parseInt(arrDate[1], 10) < 21){
				arrDate[1] = '20' + arrDate[1];
			}else{
				arrDate[1] = '19' + arrDate[1];
			}
			if (parseInt(arrDate[1], 10)%4 == 0){
				if (parseInt(arrDate[3], 10) > 29) return false;
			}else{
				if (parseInt(arrDate[3], 10) > 28) return false;
			}
		}else{
			if (parseInt(arrDate[3], 10) > 30) return false;
		}
	}
	return true;
}

function isInt(ControlHandle)
{
	var iaInt =new Array('0','1','2','3','4','5','6','7','8','9');
	for(i=0; i<ControlHandle.value.length; i++)
	{
		var isInt =false;
		for(j=0; j<iaInt.length; j++)
		{
			if(ControlHandle.value.charAt(i) ==iaInt[j])
			{
				isInt =true;
			}
		}
		if(!isInt)
		{
			alert('提示信息\n\n* 说明: '+ControlHandle.desc+'\n* 描述: 输入值格式错误,输入内容为整数型!\n* 示例: 0123456789');
			ControlHandle.focus();
			return false;
		}
	} 
	return true;
}