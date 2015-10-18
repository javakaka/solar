var from_user =request("from_user");
$(function(){
 		$submitBtn =$("#submitBtn");
 		$submitBtn.click(function(){
 			var goods_id =$("#goods_id").val();
 			var guarentee_money =$("#guarentee_money").val();
 			var price =$("#price").val();
 			var remark =$("#remark").val();
 			if(!checknumber(price)){
 				showMsg("价格应是数字",3);
 				$("#price").focus();
 				return;
 			}
 			if(typeof goods_id == "undefined" || goods_id == "" )
 			{
 				showMsg("请选择商品",3);
 				return;
 			}
 			if(typeof from_user == "undefined" || from_user == "" )
 			{
 				showMsg("请先关注微信公众账号",3);
 				return;
 			}
 			var PageUrl =SITE_PATH+"/paimaipage/site/save-goods-intrust.do";
 			//提交请求，返回订单号
 			var params ={goods_id:goods_id,from_user:from_user,price:price,guarentee_money: guarentee_money, remark: remark};
			$.ajax({
				type:"post",
				url:PageUrl,
				data:params,
				beforeSend: function (XMLHttpRequest){
					$submitBtn.hide();
				},
				success: function (ovo, textStatus){
					var code =ovo.code;
					if(code < 0 )
					{
						showMsg(ovo.msg,3);
						$submitBtn.show();
					}
					else
					{
						showMsg("操作成功",3);
						$submitBtn.hide();
						//打开支付页面
						var user_id =ovo.oForm.USER_ID;
						var order_id =ovo.oForm.ORDER_ID;
						if(typeof user_id =="undefined" || user_id == "" )
						{
							showMsg("订单处理出错，请重试",3);
							$submitBtn.show();
							return;
						}
						if(typeof user_id =="undefined" || user_id == "" )
						{
							showMsg("订单处理出错，请重试",3);
							$submitBtn.show();
							return;
						}
						var EntrustPayPageUrl =SITE_PATH+"/paimaipage/site/pay-entrust-buy.do?user_id="+user_id+"&order_id="+order_id;
						window.location.href =EntrustPayPageUrl;
					}
				},
				complete: function (XMLHttpRequest, textStatus){
		
				},
				error: function (){
					$submitBtn.show();
				}
			});
 	});
});