<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
	<title>�ļ��ϴ�</title>
	<script type="text/javascript" src="swfupload/swfupload.js"></script>
	<script type="text/javascript" src="js/swfupload.queue.js"></script>
	<script type="text/javascript" src="js/swfupload.speed.js"></script>
	<script type="text/javascript" src="js/handlers.js"></script>
	<script type="text/javascript">
		var swfu;

		window.onload = function() {
			var settings = {
				flash_url : "swfupload/swfupload.swf",
				upload_url: "Uploaded.jsp",
				file_size_limit : "100 MB",
				file_types : "*.*",
				file_types_description : "All Files",
				file_upload_limit : 100,
				file_queue_limit : 0,

				debug: false,

				// Button settings
				button_image_url: "images/XPButtonUploadText_61x22.png",
				button_width: "61",
				button_height: "22",
				button_placeholder_id: "spanButtonPlaceHolder",
				
				moving_average_history_size: 40,
				
				// The event handler functions are defined in handlers.js
				file_queued_handler : fileQueued,
				file_dialog_complete_handler: fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,
				
				custom_settings : {
					tdFilesQueued : document.getElementById("tdFilesQueued"),
					tdFilesUploaded : document.getElementById("tdFilesUploaded"),
					tdErrors : document.getElementById("tdErrors"),
					tdCurrentSpeed : document.getElementById("tdCurrentSpeed"),
					tdAverageSpeed : document.getElementById("tdAverageSpeed"),
					tdTimeRemaining : document.getElementById("tdTimeRemaining"),
					tdTimeElapsed : document.getElementById("tdTimeElapsed"),
					tdPercentUploaded : document.getElementById("tdPercentUploaded"),
					tdSizeUploaded : document.getElementById("tdSizeUploaded")
				}
			};

			swfu = new SWFUpload(settings);
	     };
	</script>
</head>
<body>
<span id="spanButtonPlaceHolder"></span>
<table id="idTbUpload" width="100%" cellpadding="2" cellspacing="1" class="table_c" align=center>
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>�Ŷӣ�</td>
		<td id="tdFilesQueued">&nbsp;</td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>�Ѿ��ϴ���</td>
		<td id="tdFilesUploaded"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>����</td>
		<td id="tdErrors"></td>
	</tr>		
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>��ǰ�ٶȣ�</td>
		<td id="tdCurrentSpeed"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>ƽ���ٶȣ�</td>
		<td id="tdAverageSpeed"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>Moving Average Speed:</td>
		<td id="tdMovingAverageSpeed"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>Ԥ�����ʱ�䣺</td>
		<td id="tdTimeRemaining"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>�Ѿ��ϴ�ʱ�䣺</td>
		<td id="tdTimeElapsed"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>�Ѿ��ϴ���%����</td>
		<td id="tdPercentUploaded"></td>
	</tr>			
	<tr class="tr_c">
		<td align="right" width="1%" nowrap>�Ѿ��ϴ�����С����</td>
		<td id="tdSizeUploaded"></td>
	</tr>			
	
</table>
</body>
</html>
