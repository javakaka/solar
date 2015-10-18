
//显示隐藏div，该函数应用于checkbox与div动态关联
//用户选中checkbox后div显示，取消选中时div隐藏
//输入参数：checkbox表单元素，div元素
function linkdisplay(checkbox,divID)
{
  if(checkbox.checked)
  {
    divID.style.display="block";
  }
  else
    divID.style.display="none";
}

function exchangeImg(elm,pic1,pic2){
   if(elm.src == "pic1"){
   	elm.src = pic2;   	
   }else{
   	elm.src = pic1;
   }
}

//获得select元素当前选中的值
//输入参数：select表单元素
//返回：字符串
//get the value from select that selected
function getSelectValue(selobj)
{
  if(selobj.options.length == 0 || selobj.selectedIndex==-1)
    return null;
  var str;
  str = selobj.options[selobj.selectedIndex].value;
  return str;
}
//获得select元素当前选中的文本
//输入参数：select表单元素
//返回：字符串
//get the text from select that selected
function getSelectText(selobj)
{
  if(selobj.options.length == 0|| selobj.selectedIndex==-1)
    return null;
  var str;
  str = selobj.options[selobj.selectedIndex].text;
  return str;
}

function getSelectValueArray(selobj)
{
  var selNums = 0;
  for(var i=0;i<selobj.options.length;i++)
    if(selobj.options[i].selected) selNums++;
  var options = new Array(selNums);
  var n = 0;
  for(var i=0;i<selobj.options.length;i++)
    if(selobj.options[i].selected) options[n++]=selobj.options[i].value;
  return options;
}
//选中select指定选项，如果不存在不做处理
function selectedOne(selobj, value)
{
  var len = selobj.options.length;
  if(len == 0)
    return false;
  for(i=0;i<len;i++){
    if(selobj.options[i].value == value)
      selobj.options[i].selected = true;
  }
  return true;
}


//显示/隐藏div元素
//输入参数：div元素
function display(selobj)
{
  if(selobj.length==null)
    selobj.style.display = "block";
  else for (var i=0;i<selobj.length;i++)
    selobj[i].style.display = "block";
}

function hidden(selobj)
{
  if(selobj.length==null)
    selobj.style.display = "none";
  else for (var i=0;i<selobj.length;i++)
    selobj[i].style.display = "none";
}

//在fmain页面上显示帮助页面
//系统在设计中提供在线帮助，在线帮助为一可以移动的div，在fmain页面上，显示帮助的联接在funcmenu页面上，
//用户点击funcmenu页面上的联接，从而显示fmain页面上的div
//输入参数：frame页面名称，帮助页面
//show help
function showhelp(framename,htmlpage)
{
  window.parent.frames[framename].document.all["helpiframe"].src="/oa/help/" + htmlpage;
  window.parent.frames[framename].show();
  return false;
}
//鼠标移动经过tr时变色
var rowbgcolor = '#ffffff';
function mouseover(sel)
{
 rowbgcolor = sel.style.backgroundColor;
 sel.style.backgroundColor='#dddddd';
}
function mouseout(sel)
{
 sel.style.backgroundColor=rowbgcolor;
}


//转换回车输入为Tab输入，转向下一个元素
function keyDown(DnEvents){
  var k = window.event.keyCode;
  if(k == 13){
    element = window.event.srcElement;
    type = element.type;
    if(type == 'text' || type == 'select-one' || type == 'select-multiple'
      || type == 'checkbox' || type == 'radio' || type == 'password' || type == 'file'){
    	if(typeof element.form == 'object'){
    	   sel = element.form[(getIndex(element)+1)%element.form.length];
    	   while(sel.type == 'hidden' || (sel.offsetWidth == 0 && sel.offsetHeight == 0) || sel.name.indexOf('seltext_')==0)
    	    sel = sel.form[(getIndex(sel)+1)%element.form.length];
 	   try{sel.focus();}catch(e){}
	   return false;
    	}
    }
  }
}

document.onkeydown = keyDown;
function getIndex(element){
   var index=-1,i=0,found=false;
   while(i<element.form.length && index == -1)
      if(element.form[i] == element)
      	index = i;
      else
      	i++;
   return index;
}


//4舍5入后取i位小数
function selectedPoint(value,i)
{
  return parseInt(value * Math.pow(10, i)+0.5 ) / Math.pow(10, i) ;
}

function trim(str){
  if(str==null) return "";
  return str.replace(/(^\s*)|(\s*$)/g, "");
}
//亲子鉴定，elm2是不是elm的长辈
function isChild(elm,elm2){
  if(elm==null||elm2==null) return false;
  while(elm.parentElement!=null){
    elm=elm.parentElement;
    if(elm==elm2) return true;
  }
  return false;
}

function trim(str) //去掉一个字符串前后的空格
{
	 return rtrim(ltrim(str));
}

function ltrim(str) //去掉一个字符串前面的空格
{
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	var j=0, i = s.length;

        while (j < i && whitespace.indexOf(s.charAt(j)) != -1){
		j++;
	}
	s = s.substring(j, i);
	return s;
}

function rtrim(str) //去掉一个字符串后面的空格
{
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	var i = s.length - 1;

        while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1){
		i--;
	}
	s = s.substring(0, i+1);
	return s;
}
