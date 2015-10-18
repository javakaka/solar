<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link href="default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="swfupload/swfupload.js"></script>
<script type="text/javascript" src="js2/swfupload.queue.js"></script>
<script type="text/javascript" src="js2/fileprogress.js"></script>
<script type="text/javascript" src="js2/handlers.js"></script>
<%
/*
*文件上传，用户必须要登录系统，存在登录会话Session
*入参：
deal_code 业务主键
deal_type 业务类型
type 附件大类，例如正文
sub_type 附件小类， 例如正文文本、正文视频
edit 是否可以编辑 1为可上传、删除，2为可上传，默认不可编辑
rows 上传文件初始化行数，默认为3行
cover 是否覆盖 1为覆盖，默认为不覆盖，如果覆盖则删除原有记录，条件为deal_code/deal_type/type/sub_type
*/
String sEdit ="";//ServletUtil.get(request, "edit");
sEdit =request.getParameter("edit");
%>
<script type="text/javascript">
		var upload1;
		var deal_code ='<%=request.getParameter("deal_code")%>';
		var deal_type ='<%=request.getParameter("deal_type")%>';
		var edit ="<%=sEdit%>";
		var type ='<%=request.getParameter("type")%>';
		var sub_type ='<%=request.getParameter("sub_type")%>';
		var rows ='<%=request.getParameter("rows")==null?"3":request.getParameter("rows")%>';
		var cover ='<%=request.getParameter("cover")%>';
		var file_type ='<%=request.getParameter("file_type")%>';
		var max_size ="102400";
		window.onload = function() {
			upload1 = new SWFUpload({
				// Backend Settings
				upload_url: "Uploaded.jsp",
				post_params:{
						"deal_type":deal_type,"deal_code":deal_code,"type":type,
							"sub_type":sub_type,"cover":cover
						},
				// File Upload Settings
				file_size_limit : max_size,	// 100MB
				file_types : file_type,
				file_types_description : "All Files",
				file_upload_limit : rows,
				file_queue_limit : "0",
				use_query_string :true,
				// Event Handler Settings (all my handlers are in the Handler.js file)
				file_dialog_start_handler : fileDialogStart,
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete2,

				// Button Settings
				button_image_url : "XPButtonUploadText_61x22.png",
				button_placeholder_id : "spanButtonPlaceholder1",
				button_width: 61,
				button_height: 22,
				
				// Flash Settings
				flash_url : "swfupload/swfupload.swf",
				

				custom_settings : {
					progressTarget : "fsUploadProgress1",
					cancelButtonId : "btnCancel1"
				},
				
				// Debug Settings
				debug: false
			});
		}
		function uploadComplete2()
		{
			//getFileUpload();
		}
function getFileUpload()
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
	alert(oRow.file_code+oRow.file_title);
	window.open("../Download.jsp?file_code="+oRow.file_code+"&file_title="+oRow.file_title+"&file_type="+oRow.file_type+"&deal_code="+oRow.deal_code+"&deal_type="+oRow.deal_type);
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
			//getFileUpload(true);
			$E.reload();
		}
	);
}
//getFileUpload();
	</script>
</head>
<body>
<center>
<div class="fieldset flash" id="fsUploadProgress1">
	<span class="legend">请选择文件上传：<span id="spanButtonPlaceholder1"></span><input style="display:on" id="btnCancel1" type="button" value="取消上传" onclick="cancelQueue(upload1);" disabled="disabled"/></span>
</div>
</center>
<div style="height:200px">
<table id="idTbAttachList" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td class="td_c" align=center>文件名</td>
		<td class="td_c" align=center>文件类型</td>
		<td class="td_c" align=center>上传用户</td>
		<td class="td_c" align=center>上传时间</td>
		<td class="td_c" align=center>大小</td>
		<td class="td_c" align=center>下载/删除</td>
	</tr>
</table>	
</div>
</body>
</html>
