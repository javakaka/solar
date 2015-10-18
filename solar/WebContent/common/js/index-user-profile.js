$(function(){
 		$submitBtn =$("#submitBtn");
 		$form =$("#form");
 		$submitBtn.click(function(){
 			$form.submit();
 		});
 		
 		KindEditor.ready(function(K) {
 			$("div[id^='uploadButton_']").each(function(i,v){
 				var obj = this;
 				var index=i;
 				var uploadbutton = K.uploadbutton({
 					button : obj,
 					fieldName : 'file',
 					url : SITE_PATH + "/upload/file/upload.do",
 					afterUpload : function(data) {
 						var m_type =data.message.type;
 						var m_content =data.message.content;
 						if (m_type =="success") {
 							var url = K.formatUrl(data.url, 'absolute');
 							if(index == 0)
 							{
 								K('#id_card_upper_url').val(url);
 								$("#upperImg").attr("src",url);
 							}
 							else if(index == 1)
 							{
 								K('#id_card_bellow_url').val(url);
 								$("#downImg").attr("src",url);
 							}
 							else if(index == 2)
 							{
 								K('#avatar').val(url);
 								$("#userAvatar").attr("src",url);
 							}
 						} else {
 							$.message(m_type,m_content);
 						}
 					},
 					afterError : function(str) {
 						$.message("error","上传图片出错:"+ str);
 					}
 				});
 				uploadbutton.fileBox.change(function(e) {
 					uploadbutton.submit();
 				});
 			});
 		});
 	});