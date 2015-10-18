function onDelUpload(handle)
{
	
}

function addMoreUpload()
{
	initUploadRows();
}
function onUploadFiles()
{
	var file_name =document.getElementsByName("file_name");
	var attachfile =document.getElementsByName("attachfile");
	var sFileNames ="";
	for(var i=0; i<file_name.length; i++)
	{
		if(file_name[i].value !='' && attachfile[i].value =='')
		{
			$E.message("请选择指定上传的本地文件！");
			attachfile[i].focus();
			return false;
		}
		if(file_name[i].value =='' && attachfile[i].value !='')
		{
			$E.message("请指定上传的本地文件的别名！");
			file_name[i].focus();
			return false;
		}
		if(file_name[i].value !="")
		{
			if(sFileNames !="")
				sFileNames +=",";
			sFileNames +=file_name[i].value
		}
	}
	var sUploadUrl ="Upload.jsp?file_names="+sFileNames+"&"+$E.getQueryString()+"&randcode="+sRandCode;
	filesform.action =sUploadUrl;
	filesform.submit();
}
function initUploadRows(bInit)
{
	if($E.getParameter("edit") !=1 && $E.getParameter("edit") !=2)
		return;
	bInit =bInit?true:false;
	if(bInit)
		Table.clear(idTbAttach);
	var iInitRows =3;
	if($E.getParameter("rows") !="")
		iInitRows =$E.getParameter("rows");
	for(var i=0; i<iInitRows; i++)
	{
		var oRows =idTbAttach.insertRow();
		oRows.className ="tr_c";
		oRows.insertCell().innerHTML ='<input type=text name="file_name" style="width:100%">';
		oRows.insertCell().innerHTML ='<input type="file" size=40 name="attachfile" onChange="onChangeFile(this)"><input type=button value="删除" onClick="onDelUpload(this)">';
	}
	try
	{
		parent.setFrameHeight();
	}
	catch (e){}
	abcd();
}

function onChangeFile(handle)
{

	var src = handle.value;
	src = src.substring(src.lastIndexOf('\\')+1);
	src =src.substring(0,src.lastIndexOf('.'));
	var file_name =document.getElementsByName("file_name");
	var attachfile =document.getElementsByName("attachfile");
	for(var i=0; i<attachfile.length; i++)
	{
		if(attachfile[i] ==handle)
		{
			file_name[i].value =src;
			break;
		}
	}
}
function initFileUpload()
{
	//获取已经上传文件列表
	var s=new Server("getAttachmentsList");
	s.setParam("deal_type", $E.getParameter("deal_type"));
	s.setParam("deal_code", $E.getParameter("deal_code"));
	s.setParam("type", $E.getParameter("type"));
	s.setParam("sub_type", $E.getParameter("sub_type"));
	s.send(s, false, function()
		{
			Table.clear(idTbAttachList);
			var oResult =s.getResult("AttachList");
			if(oResult !=null)
			{
				var iRows =oResult.getRows();
				for(var j=1; j<=iRows; j++)
				{
					var oRow =idTbAttachList.insertRow();
					oRow.onclick=function(){Table.click();};
					oRow.file_code =oResult.get(j, "file_code");
					oRow.deal_code =oResult.get(j, "deal_code");
					oRow.deal_type =oResult.get(j, "deal_type");
					oRow.file_title =oResult.get(j, "file_title");
					oRow.file_type =oResult.get(j, "file_type");
					oRow.className ="tr_c";
					Table.insertCell(oRow, oResult.get(j, "file_title"), null, "center");
					Table.insertCell(oRow, oResult.get(j, "file_type"), null, "center");
					Table.insertCell(oRow, oResult.get(j, "upload_user_name"), null, "center");
					Table.insertCell(oRow, oResult.get(j, "upload_date"), null, "center");
					var iFileSize =oResult.get(j, "file_size");
					iFileSize =Math.round(iFileSize /1000)+"KB";
					Table.insertCell(oRow, iFileSize, null, "center");
					var oCell =oRow.insertCell()
					var sHtml ="<input type=button value='下载' onClick='onDownloadFile(this)'>";
					if($E.getParameter("edit") =="1")
					{
						sHtml +="<input type=button value='删除' onClick='onDropUploadFile(this)'>";
					}
					oCell.innerHTML ="<center>"+sHtml+"</center>";
				}
			}
			try
			{
				parent.setFrameHeight();
			}
			catch (e){}
		}
	);

}

//下载文件
function onDownloadFile(handle)
{
	var oRow =handle.parentElement.parentElement.parentElement;
	window.open("Download.jsp?file_code="+oRow.file_code+"&file_title="+oRow.file_title+"&file_type="+oRow.file_type+"&deal_code="+oRow.deal_code+"&deal_type="+oRow.deal_type);
}

//删除文件
function onDropUploadFile(handle)
{
	if(!confirm("确定删除此文件？"))
		return;
	var oRow =handle.parentElement.parentElement.parentElement;
	var sFileCode =oRow.file_code;
	var s=new Server("delUploadFile");
	s.setParam("file_code", sFileCode);
	s.send(s, false, function()
		{
			$E.message("文件删除成功！");
			initFileUpload(true);
		}
	);
}