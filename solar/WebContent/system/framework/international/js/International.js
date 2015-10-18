var sr =null;
var iPagesize =15;
function loadInternational()
{
	loadLanguages();
	loadResItems();
}
//加载语言分类
function loadLanguages()
{
	var s =new Server("getInterLans", "1");
	s.send(s, false, function()
			{
				var oResult =s.getResult("Languages");
				Table.clear(idTbLanguage);
				if(oResult !=null)
				{
					var iRows =oResult.getRows();
					for(var i=1; i<=iRows; i++)
					{
						var oRow =idTbLanguage.insertRow();
						oRow.className ="tr_c";
						var sLanNo =oResult.get(i, "lan_no");
						oRow.lan_no =sLanNo;
						var sLanName =oResult.get(i, "lan_name");
						oRow.lan_name =sLanName;
						var sLanState =oResult.get(i, "lan_state");
						if(sLanState ==1)
						{
							//为有效语言添加Tab按钮
							parent.window.Tabs.add("l-"+sLanNo, sLanName, "EditItemContent.jsp?lan_no="+sLanNo);
							//parent.window.Tabs.write("收文登记", parent.window.document.all.idTabFrame, parent.window.document.all.idTab);
							parent.window.Tabs.reload();
						}
						oRow.lan_state =sLanState;
						oRow.onclick=function(){Table.click();};
						Table.insertCell(oRow, oResult.get(i, "lan_no"), null, "center");
						Table.insertCell(oRow, oResult.get(i, "lan_name"), null, "center");
						Table.insertCell(oRow, sLanState==1?"有效":"无效", null, "center");
						var sh ="";
						if(sLanState ==1)
						{
							sh ="<input type=button value='加载' onClick=onLoadLanItems('"+oResult.get(i, "lan_no")+"')>";
						}
						Table.insertCell(oRow, sh, null, "center");
					}
				}
			}
		);
}
//后台加载语言资源
function onLoadLanItems(sLanNo)
{
	var s =new Server("loadLanResItems");
	s.setParam("lan_no", sLanNo);
	s.send(s, false, function()
	{
		$E.message("加载成功！");
	});
}
//加载条目
function loadResItems()
{
	sr =new Server("getInternationalItems", "1");
	sr.setParam("currentpage", 1);
	sr.setParam("pagesize", iPagesize);
	onAction(sr);
}
function onAction(svr)
{
	svr.send(svr, false, function()
			{
				var oResult =svr.getResult("Items");
				Table.clear(idTbItems);
				if(oResult !=null)
				{
					var iRows =oResult.getRows();
					for(var i=1; i<=iRows; i++)
					{
						var oRow =idTbItems.insertRow();
						oRow.className ="tr_c";
						oRow.res_type =oResult.get(i, "res_type");
						oRow.res_item =oResult.get(i, "res_item");
						oRow.res_position =oResult.get(i, "res_position");
						oRow.onclick=function(){Table.click();};
						var sResType =oResult.get(i, "res_type");
						if(sResType =="1")
							sResType ="文本";
						else if(sResType =="2")
							sResType ="文件";
						Table.insertCell(oRow, sResType, null, "center");
						Table.insertCell(oRow, oResult.get(i, "res_item"));
						Table.insertCell(oRow, oResult.get(i, "res_position"));
					}
				}
				sr.setPage(idDivPage);
				parent.window.setFrameHeight();
			}
		);
}
function toPage(sName, iPage, iPagesize, iSum)
{
	sr.toPage(iPage, onAction);
}
var sLayId =null;
//编辑国际化语言
function onEditLanguage(iType)
{
	switch (iType)
	{
		case 0://新增
			var sSrc =WEB_PATH+"/system/framework/international/EditLanguage.jsp";
			var oLayer =new Layer('语言编辑',sSrc, 2);
			sLayId =oLayer.id;//赋值给全局变量，供后续返回方法调用
			oLayer.submitbind("onSaveLanguage()");//对子窗口的“确定”按钮绑定方法
			oLayer.show();	//展示层
			break;
		case 1://修改
			if(Table.clickRow(idTbLanguage))
			{
				var sLanNo =Table.clickRow(idTbLanguage).lan_no;
				var sLanName =Table.clickRow(idTbLanguage).lan_name;
				var sLanState =Table.clickRow(idTbLanguage).lan_state;
				var sSrc =WEB_PATH+"/system/framework/international/EditLanguage.jsp?lan_no="+sLanNo
					+"&lan_name="+sLanName+"&lan_state="+sLanState;
				var oLayer =new Layer('语言编辑',sSrc, 2);
				sLayId =oLayer.id;//赋值给全局变量，供后续返回方法调用
				oLayer.submitbind("onSaveLanguage()");//对子窗口的“确定”按钮绑定方法
				oLayer.show();	//展示层
			}
			else
			{
				$E.message("请选择相关语言分类！");
			}
			break;
		case 2://删除
			if(Table.clickRow(idTbLanguage))
			{
				var sLanNo =Table.clickRow(idTbLanguage).lan_no;
				if(sLanNo !="undefined")
				{
					var s =new Server("removeLanguage");
					s.setParam("lan_no", sLanNo);
					s.send(s, false, function()
						{
							alert("语言删除成功！");
							loadLanguages();
						}
					);				
				}
			}
			else
			{
				$E.message("请选择要删除的语言选项！");
			}
			break;
		default:
			alert("无效的操作类别["+iType+"]");
	}
}

//编辑国际化语言资源条目
function onEditItem(iType)
{
	switch (iType)
	{
		case 0://新增
			var sSrc =WEB_PATH+"/system/framework/international/EditItem.jsp";
			var oLayer =new Layer('条目编辑',sSrc, 2);
			sLayId =oLayer.id;//赋值给全局变量，供后续返回方法调用
			oLayer.submitbind("onSaveItem()");//对子窗口的“确定”按钮绑定方法
			oLayer.show();	//展示层
			break;
		case 1://修改
			if(Table.clickRow(idTbItems))
			{
				var sResItem =Table.clickRow(idTbItems).res_item;
				var sResType =Table.clickRow(idTbItems).res_type;
				var sResPosition =Table.clickRow(idTbItems).res_position;
				var sSrc =WEB_PATH+"/system/framework/international/EditItem.jsp?res_item="+sResItem
					+"&res_type="+sResType+"&res_position="+sResPosition;
				var oLayer =new Layer('条目编辑',sSrc, 2);
				sLayId =oLayer.id;//赋值给全局变量，供后续返回方法调用
				oLayer.submitbind("onSaveItem()");//对子窗口的“确定”按钮绑定方法
				oLayer.show();	//展示层
			}
			else
			{
				$E.message("请选择相关资源条目！");
			}

			break;
		case 2://删除
			if(Table.clickRow(idTbItems))
			{
				var sResItem =Table.clickRow(idTbItems).res_item;
				if(sResItem !="undefined")
				{
					var s =new Server("removeResItem");
					s.setParam("res_item", sResItem);
					s.send(s, false, function()
						{
							alert("条目删除成功！");
							loadResItems();
						}
					);				
				}
			}
			else
			{
				$E.message("请选择要删除的条目选项！");
			}
			break;
		default:
			alert("无效的操作类别["+iType+"]");
	}
}
//保存国际化语言
function onSaveLanguage()
{
	var oLay =document.frames[sLayId+"frame"];//根据全局层ID获取子窗口
	if(oLay.document !=null)
	{//如果存在
		var odoc =oLay.document;
		if(!odoc)
		{
			if(oLay.contentDocument)
			{ // For NS6
				odoc = oLay.contentDocument;
			}
			else if(oLay.contentWindow)
			{// For IE5.5 and IE6
				odoc = oLay.contentWindow.document;
			}
		}
		if(!odoc)
		{
			$E.message("不能得到页面Document！");
		}
		//saveTableData
		if(checkForm(odoc))
		{
			var s =new Server("saveTableData");
			s.setParam("lan_no", odoc.all.lan_no.value);
			s.setParam("lan_name", odoc.all.lan_name.value);
			if(odoc.getElementById("ckLanState").checked)
				s.setParam("lan_state", "1");
			else
				s.setParam("lan_state", "0");
			if(odoc.all.hlan_no.value !="")
			{
				s.setParam("op", "1");
				s.setParam("condition", "lan_no='"+odoc.all.hlan_no.value+"'");
			}
			else
				s.setParam("op", "0");
			s.setParam("card", "fm_international_language");
			s.send(s, false, function()
				{
					alert("语言编辑成功！");
					odoc.all.hlan_no.value =odoc.all.lan_no.value;
					loadLanguages();
					closeLayer();
				}
			);
		}
	}
	else
	{
		alert("获取窗口出错！");
	}
}

//保存条目
function onSaveItem()
{
	var oLay =document.frames[sLayId+"frame"];//根据全局层ID获取子窗口
	if(oLay.document !=null)
	{//如果存在
		var odoc =oLay.document;
		if(!odoc)
		{
			if(oLay.contentDocument)
			{ // For NS6
				odoc = oLay.contentDocument;
			}
			else if(oLay.contentWindow)
			{// For IE5.5 and IE6
				odoc = oLay.contentWindow.document;
			}
		}
		if(!odoc)
		{
			$E.message("不能得到页面Document！");
		}
		//saveTableData
		if(checkForm(odoc))
		{
			var s =new Server("saveTableData");
			s.setParam("res_type", odoc.all.res_type.value);
			s.setParam("res_item", odoc.all.res_item.value);
			s.setParam("res_position", odoc.all.res_position.value);

			if(odoc.all.hres_item.value !="")
			{
				s.setParam("op", "1");
				s.setParam("condition", "res_item='"+odoc.all.hres_item.value+"'");
			}
			else
				s.setParam("op", "0");
			s.setParam("card", "fm_international_res_item");
			s.send(s, false, function()
				{
					alert("条目编辑成功！");
					odoc.all.hres_item.value =odoc.all.res_item.value;
					loadResItems();
					closeLayer();
				}
			);
		}
	}
	else
	{
		alert("获取窗口出错！");
	}
}

//定位条目
function onQueryResItem()
{
	sr.reset();
	sr.setParamValue("default","res_item", $V("res_item"));
	onAction(sr);
}