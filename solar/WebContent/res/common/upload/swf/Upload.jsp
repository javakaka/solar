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
*�ļ��ϴ����û�����Ҫ��¼ϵͳ�����ڵ�¼�ỰSession
*��Σ�
deal_code ҵ������
deal_type ҵ������
type �������࣬��������
sub_type ����С�࣬ ���������ı���������Ƶ
edit �Ƿ���Ա༭ 1Ϊ���ϴ���ɾ����2Ϊ���ϴ���Ĭ�ϲ��ɱ༭
rows �ϴ��ļ���ʼ��������Ĭ��Ϊ3��
cover �Ƿ񸲸� 1Ϊ���ǣ�Ĭ��Ϊ�����ǣ����������ɾ��ԭ�м�¼������Ϊdeal_code/deal_type/type/sub_type
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
	//��ȡ�Ѿ��ϴ��ļ��б�
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
					var sHtml ="<input type=button value='����' onClick='onDownloadFile(this)'>";
					if($E.getParameter("edit") =="1")
					{
						sHtml +="<input type=button value='ɾ��' onClick='onDropUploadFile(this)'>";
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

//�����ļ�
function onDownloadFile(handle)
{
	var oRow =handle.parentElement.parentElement.parentElement;
	alert(oRow.file_code+oRow.file_title);
	window.open("../Download.jsp?file_code="+oRow.file_code+"&file_title="+oRow.file_title+"&file_type="+oRow.file_type+"&deal_code="+oRow.deal_code+"&deal_type="+oRow.deal_type);
}

//ɾ���ļ�
function onDropUploadFile(handle)
{
	if(!confirm("ȷ��ɾ�����ļ���"))
		return;
	var oRow =handle.parentElement.parentElement.parentElement;
	var sFileCode =oRow.file_code;
	var s=new Server("delUploadFile");
	s.setParam("file_code", sFileCode);
	s.send(s, false, function()
		{
			$E.message("�ļ�ɾ���ɹ���");
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
	<span class="legend">��ѡ���ļ��ϴ���<span id="spanButtonPlaceholder1"></span><input style="display:on" id="btnCancel1" type="button" value="ȡ���ϴ�" onclick="cancelQueue(upload1);" disabled="disabled"/></span>
</div>
</center>
<div style="height:200px">
<table id="idTbAttachList" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td class="td_c" align=center>�ļ���</td>
		<td class="td_c" align=center>�ļ�����</td>
		<td class="td_c" align=center>�ϴ��û�</td>
		<td class="td_c" align=center>�ϴ�ʱ��</td>
		<td class="td_c" align=center>��С</td>
		<td class="td_c" align=center>����/ɾ��</td>
	</tr>
</table>	
</div>
</body>
</html>
