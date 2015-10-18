<!--
function PurvItem(name, value, subItem, superItem) {
  this.name = name;
  this.value = value;
  this.subItem = subItem;
  this.superItem = superItem;
  this.level = 0;

  this.isExist = isExist;
  this.hasSuperItem = hasSuperItem;
  this.hasSubItem = hasSubItem;
  this.addItem = addItem;
  this.getTree = getTree;
  this.getLevel = getLevel;
  this.moveItem = moveItem;
  this.moveSubItem = moveSubItem;
  this.moveSuperItem = moveSuperItem;
  this.getItemByValue = getItemByValue;
  this.removeSubItem = removeSubItem;
  this.removeItemByValue = removeItemByValue;
  this.moveUp = moveUp;
  this.moveUpByValue = moveUpByValue;
  this.moveDown = moveDown;
  this.moveDownByValue = moveDownByValue;
  this.getUpItem = getUpItem;
  this.getDownItem = getDownItem;
}

function hasSuperItem() {
  var flag = false;
  if(this.superItem != null) {
    flag = true;
  }
  return(flag);
}

function hasSubItem() {
  var flag = false;
  if(this.subItem != null) {
    flag = true;
  }
  return(flag);
}

function isExist(value) {
  var flag = false;
  if(this.value == value) {
    flag = true;
  } else {
    if(this.hasSubItem()) {
      for(var i = 0; i < this.subItem.length; i ++) {
        if(this.subItem[i] != null) {
          if(this.subItem[i].isExist(value)) {
            flag = true;
            break;
          }
        }
      }
    } else {
      flag = false;
    }
  }
  return(flag);
}

function addItem(item) {
  var length = 0;
  if(!this.hasSubItem()) {
    for(var i = 0; i < item.length; i ++) {
      item[i].superItem = this;
    }
    this.subItem = item;
  } else {
    length = this.subItem.length;
    for(var i = 0; i < item.length; i ++) {
      item[i].superItem = this;
      this.subItem[length + i] = item[i];
    }
  }
  return(true);
}

function moveSuperItem(tagItem) {
  var item = null;
  var objItem = null;
  var retItem = null;
  if(!tagItem.isExist(this.value)) {
    if(this.hasSuperItem()) {
      retItem = this.superItem.moveSuperItem(tagItem);
    } else {
      return(tagItem);
    }
  } else {
    retItem = tagItem.getItemByValue(this.value);
    return(retItem);
  }
  item = new Array();
  item[0] = new PurvItem(this.name, this.value);
  retItem.addItem(item);
  retItem = item[0];
  return(retItem);
}

function moveSubItem(tagItem) {
  var tag = null;
  var objItem = null;
  if(this.hasSubItem()) {
    if(!tagItem.isExist(this.value)) {
      objItem = new Array();
      objItem[0] = new PurvItem(this.name, this.value);
      tagItem.addItem(objItem);
      tag = tagItem.getItemByValue(this.value);
    } else {
      tag = tagItem.getItemByValue(this.value);
    }
    for(var i = 0; i < this.subItem.length; i ++) {
      this.subItem[i].moveSubItem(tag);
    }
  } else {
    if(!tagItem.isExist(this.value)) {
      objItem = new Array();
      objItem[0] = new PurvItem(this.name, this.value);
      tagItem.addItem(objItem);
    }
  }
  return(true);
}

function moveItem(tagItem) {
  if(!tagItem.isExist(this.value)) {
    this.moveSuperItem(tagItem);
  }
  this.moveSubItem(tagItem);

  return(true);
}

function getItemByValue(value) {
  var item = null;
  if(this.value == value) {
    item = this;
  }
  else {
    if(this.hasSubItem()) {
      for(var i = 0; i < this.subItem.length; i ++) {
        if(this.subItem[i] != null) {
          item = this.subItem[i].getItemByValue(value);
          if(item != null) {
            break;
          }
        }
      }
    }
  }
  return(item);
}

function removeSubItem() {
  var length = 0;
  if(this.hasSubItem()) {
    for(var i = 0; i < this.subItem.length; i ++) {
      if(this.subItem[i] != null) {
        this.subItem[i].removeSubItem();
      }
    }
  }
  this.subItem =null;
  return(true);
}

function removeItemByValue(value) {
  var length = 0;
  var objItem = this.getItemByValue(value);
  objItem.removeSubItem();
  for(var i = 0; i < objItem.superItem.subItem.length; i ++) {
    if(objItem.superItem.subItem[i] == objItem) {
      objItem.superItem.subItem[i] = null;
    }
  }
  objItem == null;
  return(true);
}

function getLevel() {
  var level = 0;
  var obj = this;
  while(obj.hasSuperItem()) {
    level ++;
    obj = obj.superItem;
  }
  return(level);
}

function getUpItem(item) {
  var objItem = null;
  var index = 0;
  for(var i = 0; i < item.superItem.subItem.length; i ++) {
    if(item.superItem.subItem[i] == item) {
      index = i;
      break;
    }
  }
  for(var i = index - 1; i >= 0; i --) {
    if(item.superItem.subItem[i] != null) {
      objItem = item.superItem.subItem[i];
      break;
    }
  }
  return(objItem);
}

function getDownItem(item) {
  var objItem = null;
  var index = 0;
  for(var i = 0; i < item.superItem.subItem.length; i ++) {
    if(item.superItem.subItem[i] == item) {
      index = i;
      break;
    }
  }
  for(var i = index + 1; i < item.superItem.subItem.length; i ++) {
    if(item.superItem.subItem[i] != null) {
      objItem = item.superItem.subItem[i];
      break;
    }
  }
  return(objItem);
}

function moveUp(item) {
  var index1 = 0;
  var index2 = 0;
  var item1 = null;
  var item2 = null;
  var upperItem = item.getUpItem(item);
  if(!item.hasSuperItem()) {
    return(false);
  }
  else if(upperItem == null) {
    return(false);
  }
  else {
    for(var i = 0; i < item.superItem.subItem.length; i ++) {
      if(item.superItem.subItem[i] == item) {
        index1 = i;
        break;
      }
    }
    for(var i = 0; i < upperItem.superItem.subItem.length; i ++) {
      if(upperItem.superItem.subItem[i] == upperItem) {
        index2 = i;
        break;
      }
    }
  }
  item1 = upperItem;
  item2 = item;
  item = item1;
  item.superItem.subItem[index1] = item1;
  upperItem = item2;
  item.superItem.subItem[index2] = item2;
  return(true);
}

function moveDown(item) {
  var index1 = 0;
  var index2 = 0;
  var item1 = null;
  var item2 = null;
  var downItem = item.getDownItem(item);
  if(!item.hasSuperItem()) {
    return(false);
  }
  else if(downItem == null) {
    return(false);
  }
  else {
    for(var i = 0; i < item.superItem.subItem.length; i ++) {
      if(item.superItem.subItem[i] == item) {
        index1 = i;
        break;
      }
    }
    for(var i = 0; i < downItem.superItem.subItem.length; i ++) {
      if(downItem.superItem.subItem[i] == downItem) {
        index2 = i;
        break;
      }
    }
  }
  item1 = downItem;
  item2 = item;
  item = item1;
  item.superItem.subItem[index1] = item1;
  downItem = item2;
  item.superItem.subItem[index2] = item2;
  return(true);
}

function moveUpByValue(value) {
  this.moveUp(this.getItemByValue(value));
  return(true);
}

function moveDownByValue(value) {
  this.moveDown(this.getItemByValue(value));
  return(true);
}

function getTree(objSelect) {
  var length = 0;
  var level = 0;
  var strTemp = "";
  var strPrefix = "";
  if(this.hasSubItem()) {
    for(var i = 0; i < this.subItem.length; i ++) {
      strPrefix = "";
      if(this.subItem[i] != null) {
        for(var j = 1; j < this.subItem[i].getLevel(); j ++) {
          strPrefix += "  ";
        }
        length = objSelect.length;
        objSelect.options[length] =
          new Option(this.subItem[i].name, this.subItem[i].value);
        objSelect.options[length].innerText =
          strPrefix + objSelect.options[length].innerText;
        this.subItem[i].getTree(objSelect);
      }
    }
  }
  return(true);
}
//-->