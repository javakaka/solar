var from_user =request("from_user");
var goods_id =request("goods_id");
$(function(){
 		$minus_btn =$("#minus_btn");
 		$plus_btn =$("#plus_btn");
 		$price =$("#price");
 		$current_price =$("#current_price");
 		$bid_price_btn =$("#bid_price_btn");
 		$clockBtn =$("#clockBtn");
 		$requestBtn =$("#requestBtn");
 		var current_price_value =Number($current_price.html());
 		$minus_btn.click(function(){
 			var price_value =$price.val();
 			var result =Math.round((Number(price_value)-1)*100)/100;
 			if(result <current_price_value){
 				alert('出价不能低于当前价');
 				result =current_price_value;
 			}
 			if(result <0){
 				result =0;
 			}
 			$price.val(result);
 		});
 		$plus_btn.click(function(){
 			var price_value =$price.val();
 			var result =Math.round((Number(price_value)+1)*100)/100;
 			$price.val(result);
 		});
 		
 		$bid_price_btn.click(function(){
 			var price_value =$price.val();
 			if(price_value <= current_price_value){
 				showMsg('出价不能低于当前价',2);
 				$price.val(current_price_value)
 				return;
 			}
 			showConfirmLayer();
 		});
 		$clockBtn.click(function(){
 			showClockSettingLayer();
 		});
 		$price.change(function(){
 			var price_value =$price.val();
 			if(price_value <= current_price_value){
 				showMsg('出价不能低于当前价',2);
 				$price.val(current_price_value)
 			}
 		});
 		
 		//goods state over
 		if(goods_state == 0)
 		{
 			$clockBtn.removeClass("no-remind");
 			$clockBtn.addClass("had-remind");
 			$requestBtn.addClass("had-remind-request");
 			$requestBtn.removeClass("no-remind-request");
 			$("#intrust_pay_page").attr("href","javascript:void(0)");
 		}
 		else
 		{
 			// not remind
 			if(is_remind == 0)
			{
				$clockBtn.addClass("no-remind");
				$clockBtn.removeClass("had-remind");
				$clockBtn.click(function(){
					showClockSettingLayer();
				});
			}
			// had remind
			else if(is_remind == 1)
			{
				$clockBtn.removeClass("no-remind");
				$clockBtn.addClass("had-remind");
			}
			//not intrust pay
			if(is_entrust == 0)
			{
				$requestBtn.removeClass("had-remind-request");
				$requestBtn.addClass("no-remind-request");
			}
			else if(is_entrust == 1)
			{
				$requestBtn.addClass("had-remind-request");
				$requestBtn.removeClass("no-remind-request");
				$("#intrust_pay_page").attr("href","javascript:void(0)");
			}
 		}
 	});
 	
 /**
 * 弹出出价确认界面
 */
function showConfirmLayer()
{
	if(typeof goods_id == "undefined" || goods_id == "" )
	{
		showMsg("请选择拍品",2);
		return;
	}
	if(typeof from_user == "undefined" || from_user == "" )
	{
		showMsg("请先关注公众账号",2);	
		return;
	}
	var current_price =$("#price").val();
	if(typeof current_price == "undefined" || current_price == "" )
	{
		showMsg("请填写竞拍价格",2);
		return;
	}
	var url ="index-confirm-bid.jsp";
	url +="?goods_id="+goods_id;
	url +="&from_user="+from_user;
	url +="&price="+current_price;
	var w="80%";
	var h="150px";
	var title="确认出价";
	openLayer(url,w,h,title);
}

function showClockSettingLayer()
{
	var url =SITE_PATH+"/paimaipage/site/index-clock-setting.do?from_user="+request("from_user")+"&goods_id="+request("goods_id");
	var w="80%";
	var h="180px";
	var title="提醒方式";
	openLayer(url,w,h,title);
}

function openLayer(url,w,h,title)
{
	$.layer({
	    type: 2,
	    shade: [0.5, '#f1f1f1'],
	    shadeClose: true,
	    border: [2, 0.3, '#000'],
	    fix: false,
	    title: title,
	    maxmin: false,
	    iframe: {src : url},
	    area: [w , h],
	    close: function(index){
	    }
	});
}