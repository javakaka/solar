var sr =null;
var iPagesize =15;
function loadInternational()
{
	loadLanguages();
	loadResItems();
}
//�������Է���
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
							//Ϊ��Ч�������Tab��ť
							parent.window.Tabs.add("l-"+sLanNo, sLanName, "EditItemContent.jsp?lan_no="+sLanNo);
							//parent.window.Tabs.write("���ĵǼ�", parent.window.document.all.idTabFrame, parent.window.document.all.idTab);
							parent.window.Tabs.reload();
						}
						oRow.lan_state =sLanState;
						oRow.onclick=function(){Table.click();};
						Table.insertCell(oRow, oResult.get(i, "lan_no"), null, "center");
						Table.insertCell(oRow, oResult.get(i, "lan_name"), null, "center");
						Table.insertCell(oRow, sLanState==1?"��Ч":"��Ч", null, "center");
						var sh ="";
						if(sLanState ==1)
						{
							sh ="<input type=button value='����' onClick=onLoadLanItems('"+oResult.get(i, "lan_no")+"')>";
						}
						Table.insertCell(oRow, sh, null, "center");
					}
				}
			}
		);
}
//��̨����������Դ
function onLoadLanItems(sLanNo)
{
	var s =new Server("loadLanResItems");
	s.setParam("lan_no", sLanNo);
	s.send(s, false, function()
	{
		$E.message("���سɹ���");
	});
}
//������Ŀ
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
							sResType ="�ı�";
						else if(sResType =="2")
							sResType ="�ļ�";
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
//�༭���ʻ�����
function onEditLanguage(iType)
{
	switch (iType)
	{
		case 0://����
			var sSrc =WEB_PATH+"/system/framework/international/EditLanguage.jsp";
			var oLayer =new Layer('���Ա༭',sSrc, 2);
			sLayId =oLayer.id;//��ֵ��ȫ�ֱ��������������ط�������
			oLayer.submitbind("onSaveLanguage()");//���Ӵ��ڵġ�ȷ������ť�󶨷���
			oLayer.show();	//չʾ��
			break;
		case 1://�޸�
			if(Table.clickRow(idTbLanguage))
			{
				var sLanNo =Table.clickRow(idTbLanguage).lan_no;
				var sLanName =Table.clickRow(idTbLanguage).lan_name;
				var sLanState =Table.clickRow(idTbLanguage).lan_state;
				var sSrc =WEB_PATH+"/system/framework/international/EditLanguage.jsp?lan_no="+sLanNo
					+"&lan_name="+sLanName+"&lan_state="+sLanState;
				var oLayer =new Layer('���Ա༭',sSrc, 2);
				sLayId =oLayer.id;//��ֵ��ȫ�ֱ��������������ط�������
				oLayer.submitbind("onSaveLanguage()");//���Ӵ��ڵġ�ȷ������ť�󶨷���
				oLayer.show();	//չʾ��
			}
			else
			{
				$E.message("��ѡ��������Է��࣡");
			}
			break;
		case 2://ɾ��
			if(Table.clickRow(idTbLanguage))
			{
				var sLanNo =Table.clickRow(idTbLanguage).lan_no;
				if(sLanNo !="undefined")
				{
					var s =new Server("removeLanguage");
					s.setParam("lan_no", sLanNo);
					s.send(s, false, function()
						{
							alert("����ɾ���ɹ���");
							loadLanguages();
						}
					);				
				}
			}
			else
			{
				$E.message("��ѡ��Ҫɾ��������ѡ�");
			}
			break;
		default:
			alert("��Ч�Ĳ������["+iType+"]");
	}
}

//�༭���ʻ�������Դ��Ŀ
function onEditItem(iType)
{
	switch (iType)
	{
		case 0://����
			var sSrc =WEB_PATH+"/system/framework/international/EditItem.jsp";
			var oLayer =new Layer('��Ŀ�༭',sSrc, 2);
			sLayId =oLayer.id;//��ֵ��ȫ�ֱ��������������ط�������
			oLayer.submitbind("onSaveItem()");//���Ӵ��ڵġ�ȷ������ť�󶨷���
			oLayer.show();	//չʾ��
			break;
		case 1://�޸�
			if(Table.clickRow(idTbItems))
			{
				var sResItem =Table.clickRow(idTbItems).res_item;
				var sResType =Table.clickRow(idTbItems).res_type;
				var sResPosition =Table.clickRow(idTbItems).res_position;
				var sSrc =WEB_PATH+"/system/framework/international/EditItem.jsp?res_item="+sResItem
					+"&res_type="+sResType+"&res_position="+sResPosition;
				var oLayer =new Layer('��Ŀ�༭',sSrc, 2);
				sLayId =oLayer.id;//��ֵ��ȫ�ֱ��������������ط�������
				oLayer.submitbind("onSaveItem()");//���Ӵ��ڵġ�ȷ������ť�󶨷���
				oLayer.show();	//չʾ��
			}
			else
			{
				$E.message("��ѡ�������Դ��Ŀ��");
			}

			break;
		case 2://ɾ��
			if(Table.clickRow(idTbItems))
			{
				var sResItem =Table.clickRow(idTbItems).res_item;
				if(sResItem !="undefined")
				{
					var s =new Server("removeResItem");
					s.setParam("res_item", sResItem);
					s.send(s, false, function()
						{
							alert("��Ŀɾ���ɹ���");
							loadResItems();
						}
					);				
				}
			}
			else
			{
				$E.message("��ѡ��Ҫɾ������Ŀѡ�");
			}
			break;
		default:
			alert("��Ч�Ĳ������["+iType+"]");
	}
}
//������ʻ�����
function onSaveLanguage()
{
	var oLay =document.frames[sLayId+"frame"];//����ȫ�ֲ�ID��ȡ�Ӵ���
	if(oLay.document !=null)
	{//�������
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
			$E.message("���ܵõ�ҳ��Document��");
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
					alert("���Ա༭�ɹ���");
					odoc.all.hlan_no.value =odoc.all.lan_no.value;
					loadLanguages();
					closeLayer();
				}
			);
		}
	}
	else
	{
		alert("��ȡ���ڳ���");
	}
}

//������Ŀ
function onSaveItem()
{
	var oLay =document.frames[sLayId+"frame"];//����ȫ�ֲ�ID��ȡ�Ӵ���
	if(oLay.document !=null)
	{//�������
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
			$E.message("���ܵõ�ҳ��Document��");
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
					alert("��Ŀ�༭�ɹ���");
					odoc.all.hres_item.value =odoc.all.res_item.value;
					loadResItems();
					closeLayer();
				}
			);
		}
	}
	else
	{
		alert("��ȡ���ڳ���");
	}
}

//��λ��Ŀ
function onQueryResItem()
{
	sr.reset();
	sr.setParamValue("default","res_item", $V("res_item"));
	onAction(sr);
}