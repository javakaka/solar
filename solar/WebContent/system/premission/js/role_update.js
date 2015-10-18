<!--
var src_ItemMain = new PurvItem();
var tag_ItemMain = new PurvItem();

function OnBtnAdd_Click()
{
  var obj = null;
  var strValue = "";
  //遍历源列表框,获取所选中的项目对象
  for(var i = 0; i < document.prem.select_src.length; i ++) {
    if(document.prem.select_src.options[i].selected == true) {
      strValue = document.prem.select_src.options[i].value;
      obj = src_ItemMain.getItemByValue(strValue);
      obj.moveItem(tag_ItemMain);
    }
  }
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //构造并显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  return(true);
}

function OnBtnAddAll_Click()
{
  //清除树对象的所有节点
  tag_ItemMain.removeSubItem();
  //生成树对象
  src_ItemMain.moveSubItem(tag_ItemMain);
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //构造并显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  return(true);
}

function OnBtnRemove_Click()
{
  var strValue = "";
  //获取选中的值
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    if(document.prem.fun_id.options[i].selected == true) {
      strValue = document.prem.fun_id.options[i].value;
      tag_ItemMain.removeItemByValue(strValue);
    }
  }
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //构造并显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  return(true);
}

function OnBtnRemoveAll_Click()
{
  //清除树对象的所有节点
  tag_ItemMain.removeSubItem();
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  return(true);
}

function OnBtnMoveUp_Click()
{
  var value = "";
  for(var i = 0; i < document.prem.fun_id.length; i ++) {
    if(document.prem.fun_id.options[i].selected == true) {
      value = document.prem.fun_id.options[i].value;
      tag_ItemMain.moveUpByValue(value);
      break;
    }
  }
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //构造并显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  for(var i = 0; i < document.prem.fun_id.length; i ++) {
    if(document.prem.fun_id.options[i].value == value) {
      document.prem.fun_id.options[i].selected = true;
      break;
    }
  }
  return(true);
}

function OnBtnMoveDown_Click()
{
  var value = "";
  for(var i = 0; i < document.prem.fun_id.length; i ++) {
    if(document.prem.fun_id.options[i].selected == true) {
      value = document.prem.fun_id.options[i].value;
      tag_ItemMain.moveDownByValue(value);
      break;
    }
  }
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //构造并显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  for(var i = 0; i < document.prem.fun_id.length; i ++) {
    if(document.prem.fun_id.options[i].value == value) {
      document.prem.fun_id.options[i].selected = true;
      break;
    }
  }
  return(true);
}

function OnBtnOK_Click()
{
  for(var i = 0; i < document.prem.fun_id.length; i ++) {
    document.prem.fun_id.options[i].selected = true;
  }
  document.prem.action = "purvmanage_update.jsp?mode=1";
  document.prem.submit();
  return(true);
}

function OnBody_Load()
{
  src_ItemMain.getTree(document.prem.select_src);
  tag_ItemMain.getTree(document.prem.fun_id);
  return(true);
}

function OnListSrc_DblClick()
{
  var strValue = "";
  for(var i = 0; i < document.prem.select_src.length; i ++) {
    if(document.prem.select_src.options[i].selected) {
      strValue = document.prem.select_src.options[i].value;
      obj = src_ItemMain.getItemByValue(strValue);
      obj.moveItem(tag_ItemMain);
      break;
    }
  }
  //清除目标列表框
  for(var i = document.prem.fun_id.length - 1; i >= 0; i --) {
    document.prem.fun_id.options[i] = null;
  }
  //构造并显示树对象
  tag_ItemMain.getTree(document.prem.fun_id);
  return(true);
}

function OnBtnExit_Click()
{
  parent.window.close();
  return(true);
}
-->