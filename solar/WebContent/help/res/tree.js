var befEntity,nowEntity

function initialize(xml) {
  var xmlDoc
  var xslDoc

  xmlDoc = new ActiveXObject('Microsoft.XMLDOM')
  xmlDoc.async = false;

  xslDoc = new ActiveXObject('Microsoft.XMLDOM')
  xslDoc.async = false;
  //alert("xml:"+xml);
  //xml = unescape(xml);
  //alert("xml:"+xml);
  xmlDoc.load(xml)
  xslDoc.load("tree.xsl")

  folderTree.innerHTML = xmlDoc.documentElement.transformNode(xslDoc)

}

function clickOnEntity(entity) {
  var parentnode = entity.parentNode
	var childnodes = parentnode.childNodes
    for(var i=0;i<childnodes.length;i++){
		if(childnodes(i)!= entity && childnodes(i).tagName!="TABLE"){
			//alert("tagName:"+childnodes(i).tagName)
			collapse(childnodes(i))
		}
	}
	//alert("at here!")

  if(entity.open == "false") {
    expand(entity, true)
  }
  else if(entity.childNodes.length>1){
    collapse(entity)
  }
  window.event.cancelBubble = true


  //nowEntity = entity
  HighlightEntity(entity)
}

function HighlightEntity(entity) {

  var nowEntity = entity.childNodes(0).childNodes(0).childNodes(0);
  if(befEntity!=null&&nowEntity!=befEntity){
	befEntity.childNodes(2).className = ""
	nowEntity.childNodes(2).className = "bgcolor"
  }
  if(nowEntity!=null){
	nowEntity.childNodes(2).className = "bgcolor"
  }
  befEntity = entity.childNodes(0).childNodes(0).childNodes(0);
}

function expand(entity) {
  var oImage

  oImage = entity.childNodes(0).all["image"]
  oImage.src = entity.imageOpen

  for(i=0; i < entity.childNodes.length; i++) {
    if(entity.childNodes(i).tagName == "DIV") {
      entity.childNodes(i).style.display = "block"
    }
  }
  entity.open = "true"
}

function collapse(entity) {
  var oImage
  var i

  oImage = entity.childNodes(0).all["image"]
  oImage.src = entity.image

  // collapse and hide children
  for(i=0; i < entity.childNodes.length; i++) {
      if(entity.childNodes(i).tagName == "DIV") {
        if(entity.id != "folderTree") entity.childNodes(i).style.display = "none"
        collapse(entity.childNodes(i))
      }
    }
  entity.open = "false"
}

function expandAll(entity) {
  var oImage
  var i

  expand(entity, false)

  // expand children
  for(i=0; i < entity.childNodes.length; i++) {
    if(entity.childNodes(i).tagName == "DIV") {
      expandAll(entity.childNodes(i))
    }
  }
}

function setdirid(entity){

	var dirid = entity.id;
	var hasChild = "false";
	for(var i=0; i < entity.childNodes.length; i++) {
		if(entity.childNodes(i).tagName == "DIV") {
			hasChild = "true";
			break;
		}
	}
 

	if(dirid=="-1"){
		top.mainFrame.location.href="help_m.htm";
		return;
	}
	
	if(dirid.indexOf("HTML")>0){
		top.mainFrame.location.href=dirid+".htm";
		return;
	}
	
	if(hasChild=="true"){

	}else{ 
		window.open(dirid+".xml","mainFrame"); 
	}

	//alert("entity:"+entity);
	//var dirid = entity.id;
	//alert("dirid:"+dirid);
	//parent.dodirid(dirid);
	//parent.doobjects("folder");
}
