
//��ʾ����div���ú���Ӧ����checkbox��div��̬����
//�û�ѡ��checkbox��div��ʾ��ȡ��ѡ��ʱdiv����
//���������checkbox��Ԫ�أ�divԪ��
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

//���selectԪ�ص�ǰѡ�е�ֵ
//���������select��Ԫ��
//���أ��ַ���
//get the value from select that selected
function getSelectValue(selobj)
{
  if(selobj.options.length == 0 || selobj.selectedIndex==-1)
    return null;
  var str;
  str = selobj.options[selobj.selectedIndex].value;
  return str;
}
//���selectԪ�ص�ǰѡ�е��ı�
//���������select��Ԫ��
//���أ��ַ���
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
//ѡ��selectָ��ѡ���������ڲ�������
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


//��ʾ/����divԪ��
//���������divԪ��
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

//��fmainҳ������ʾ����ҳ��
//ϵͳ��������ṩ���߰��������߰���Ϊһ�����ƶ���div����fmainҳ���ϣ���ʾ������������funcmenuҳ���ϣ�
//�û����funcmenuҳ���ϵ����ӣ��Ӷ���ʾfmainҳ���ϵ�div
//���������frameҳ�����ƣ�����ҳ��
//show help
function showhelp(framename,htmlpage)
{
  window.parent.frames[framename].document.all["helpiframe"].src="/oa/help/" + htmlpage;
  window.parent.frames[framename].show();
  return false;
}
//����ƶ�����trʱ��ɫ
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


//ת���س�����ΪTab���룬ת����һ��Ԫ��
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


//4��5���ȡiλС��
function selectedPoint(value,i)
{
  return parseInt(value * Math.pow(10, i)+0.5 ) / Math.pow(10, i) ;
}

function trim(str){
  if(str==null) return "";
  return str.replace(/(^\s*)|(\s*$)/g, "");
}
//���Ӽ�����elm2�ǲ���elm�ĳ���
function isChild(elm,elm2){
  if(elm==null||elm2==null) return false;
  while(elm.parentElement!=null){
    elm=elm.parentElement;
    if(elm==elm2) return true;
  }
  return false;
}

function trim(str) //ȥ��һ���ַ���ǰ��Ŀո�
{
	 return rtrim(ltrim(str));
}

function ltrim(str) //ȥ��һ���ַ���ǰ��Ŀո�
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

function rtrim(str) //ȥ��һ���ַ�������Ŀո�
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
