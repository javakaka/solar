<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//ActionContext actionContext = ActionContext.getContext();
//Map mysession = actionContext.getSession();
//Users staff=(Users)mysession.getAttribute("staff");
//Users staff=(Users)session.getAttribute("staff");
//if(staff == null){
//response.sendRedirect("../login.jsp");
//}
//String staff_id =staff.getStaff_id();
String staff_id ="";
String deal_type =request.getParameter("deal_type");
String deal_code =request.getParameter("deal_code");
String type =request.getParameter("type");
String sub_type =request.getParameter("sub_type");
String cover =request.getParameter("cover");
String file_type =request.getParameter("file_type");
String callback =request.getParameter("callback");
if(callback == null || callback.equals(""))
{
	callback ="";
}
//out.print("*******"+staff_id+"<hr/>");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="<%=basePath%>sysupload/css/default.css" rel="stylesheet" type="text/css" />
   	<script type="text/javascript" src="<%=basePath%>sysupload/js/swfupload.js"></script>
   	<script type="text/javascript" src="<%=basePath%>sysupload/js/swfupload.queue.js"></script>
    <script type="text/javascript" src="<%=basePath%>sysupload/js/fileprogress.js"></script>
    <script type="text/javascript" src="<%=basePath%>sysupload/js/handlers.js"></script>
	<script type="text/javascript"  src="<%=basePath%>res/js/jquery-1.8.0.min.js"></script>
   	<!-- 初始化swfupload 对象-->
   <script type="text/javascript">
   		var callback="<%=callback%>";
   		var upload_times=0;
		var upload1;
		/*
		var deal_type="product_picture";
		var deal_code ="1";
		var type="test_type";
		var sub_type ="sub_type";
		var cover ="0";
		var file_type="*.jpg;*.gif;*.png;*.rar;*.zip;*.txt;*.doc;*.pdf;*.docx;*.sql";
		*/
		var deal_type='<%=deal_type%>';
		var deal_code ='<%=deal_code%>';
		var type='<%=type%>';
		var sub_type ='<%=sub_type%>';
		var cover ='<%=cover%>';
		var file_type='<%=file_type%>';
		var staff_id ='<%=staff_id%>';
		window.onload = function() {
			upload1 = new SWFUpload({
				// Backend Settings
				upload_url: "<%=basePath%>sysupload/upload.do",
				//post_params: {"picSESSID" : "songhao"},
				post_params:{
						"deal_type":deal_type,"deal_code":deal_code,"type":type,
							"sub_type":sub_type,"cover":cover,"staff_id":staff_id
						},
				file_post_name: "file",
				// File Upload Settings
				file_size_limit : "102400",	// 100MB
				file_types : file_type,
				file_types_description : "All Files",
				file_upload_limit : "10",
				file_queue_limit : "0",

				// Event Handler Settings (all my handlers are in the Handler.js file)
				file_dialog_start_handler : fileDialogStart,
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : getAttachList,

				// Button Settings
				button_image_url : "images/XPButtonUploadText_61x22.png",
				button_placeholder_id : "spanButtonPlaceholder1",
				button_width: 61,
				button_height: 22,
				
				// Flash Settings
				flash_url : "js/swfupload.swf",
				

				custom_settings : {
					progressTarget : "fsUploadProgress1",
					cancelButtonId : "btnCancel1"
				},
				
				// Debug Settings
				debug: false
			});

	     }

		function downloadAttach(pre_path,file_code,deal_code,deal_type,file_name,file_type)
		{
			var url ="./Download.jsp?pre_path="+pre_path;
			url +="&file_name="+file_name;
			url +="&file_code="+file_code;
			url +="&deal_code="+deal_code;
			url +="&deal_type="+deal_type;
			url +="&file_type="+file_type;
			window.open(url);
		}
	    
		function deleteAttach(id)
		{
			var url ="<%=basePath%>sysupload/deleteAttach.do";
			var params ={id:id};
			$.post(url,params,function callback(data){
				if(data.code == "0"){
				window.location.reload();
				}
			},'json');
		}
		
		function getAttachList()
		{
			var url ="<%=basePath%>sysupload/getAttachList.do";
			var params ={
				deal_code:deal_code,
				deal_type:deal_type
					}
			var attach_tab=document.getElementById("attachTabId");
			var rowNum =attach_tab.rows.length;
			for(var i=rowNum -1; i>0; i--)
			{
				attach_tab.deleteRow(i);
			}
			var file_size =0;
			$.post(url,params,function callback(data){
				var list =data.oForm.ATTACH_LIST;
				$.each(list,function (i,item){
				rowNum =attach_tab.rows.length;
				var row	=attach_tab.insertRow(rowNum);
				row.file_id =item.CONTROL_ID;
				var cell =row.insertCell(0);
				//cell.innerHTML =item.FILE_CODE;
				cell.innerHTML =item.FILE_NAME;

				var cell =row.insertCell(1);
				file_size =item.FILE_SIZE;
				if(file_size <1024){
				cell.innerHTML =file_size+"/byte";
				}
				else if(file_size < 1024*1024){
				file_size =file_size/1024 ;
				cell.innerHTML =file_size+"/K";
				}
				else if(file_size < 1024*1024*1024){
				file_size =file_size/1024/1024;
				cell.innerHTML =file_size+"/M";
				}

				var cell =row.insertCell(2);
				cell.innerHTML =item.FILE_TYPE;

				var cell =row.insertCell(3);
				cell.innerHTML =item.USER_NAME;

				var cell =row.insertCell(4);
				//onclick=\"download("+item.FILE_CODE+","+deal_code+","+deal_type+")\"
				cell.innerHTML ="<a href=\""+item.PATH+"\" target=\"blank\"> 查看</a><a href='javascript:void()'  onclick=\"downloadAttach('"+item.PRE_PATH+"','"+item.FILE_CODE+"','"+deal_code+"','"+deal_type+"','"+item.FILE_NAME+"','"+item.FILE_TYPE+"')\"> 下载</a> <a href='javascript:void()'  onclick=\"deleteAttach('"+item.CONTROL_ID+"')\"> 删除</a>";
				});
			},'json');
			upload_times +=1;
			if(callback !="" && upload_times >1)
			{
				window.opener.<%=callback%>();
			}
		}
	//getAttachList(deal_code,deal_type);



	</script>
  </head>

  <body >
  <div id="content">
    <form action="pictureAction" method="post" name="thisform" enctype="multipart/form-data">
		<table border="1">
			<tr valign="top">
				<td>
					<div>
						<div class="fieldset flash" id="fsUploadProgress1">
							<span class="legend"></span>
						</div>
						<div style="padding-left: 5px;">
							<span id="spanButtonPlaceholder1"></span>
							<input id="btnCancel1" type="button" value="Cancel Uploads" onclick="cancelQueue(upload1);" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;" />
							<br />
						</div>
					</div>
				</td>
			</tr>
			<tr >
			<td valign="top" id="list_id">
			<table id="attachTabId" name="attachTabId" width="100%" border="1" cellspacing="0"  cellpadding="0">
			<tr>
			<td>文件名</td>
			<td>文件大小</td>
			<td>类型</td>
			<td>上传者姓名</td>
			<td>操作</td>
			</tr>
			</table>
			</td>
			</tr>
		</table>
    </form>
    </div>
  </body>
</html>
<script type="text/javascript">
 getAttachList();
</script>