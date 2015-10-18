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
 			var result =Number(price_value)-1;
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
 			var result =Number(price_value)+1;
 			$price.val(result);
 		});
 		
 		$bid_price_btn.click(function(){
 			showConfirmLayer();
 		});
 		$clockBtn.click(function(){
			showClockSettingLayer();
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
 			//计算倒计时时间
 			if(goods_state == 1)
			{
				var end_date =goods_start_time;
				var interval = 1000; 
				window.setInterval(function(){setTime(end_date,'time_tip_value');}, interval); 
			}
			else if(goods_state == 2)
			{
				var end_date =goods_end_time;
				var interval = 1000; 
				window.setInterval(function(){setTime(end_date,'time_tip_value');}, interval); 
			}
 			// not remind
 			if(is_remind == 0)
			{
				$clockBtn.addClass("no-remind");
				$clockBtn.removeClass("had-remind");
				
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
 		//调整图片大小
 		autoAdapterImg("goods_show_div");
 		autoAdapterImg("goods_certificate_info_div");
 		autoAdapterImg("goods_brand_info_div");
 		autoAdapterImg("goods_need_know_div");
 		autoAdapterImg("goods_sale_service_div");
 	});
 	
function setTime(end_date,divname) 
{ 
	var now = new Date(); 
	var endDate = new Date(end_date); 
	var leftTime=endDate.getTime()-now.getTime(); 
	var leftsecond = parseInt(leftTime/1000); 
	var day1=Math.floor(leftsecond/(60*60*24)); 
	var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
	var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
	var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
	var cc = document.getElementById(divname); 
	cc.innerHTML = hour+"小时"+minute+"分"+second+"秒"; 
} 
 /**
 * 弹出出价确认界面
 */
function showConfirmLayer()
{
	var url ="index-confirm-bid.jsp";
	var w="80%";
	var h="150px";
	var title="确认出价";
	openLayer(url,w,h,title);
}
function showClockSettingLayer()
{
	var url =SITE_PATH+"/paimaipage/site/index-clock-setting.do?from_user="+request("from_user")+"&goods_id="+request("id");
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

/**
*调整图片大小，宽度自适应屏幕宽度，长度根据缩放比例调整
*/
function autoAdapterImg(div_id)
{
	var divId ="#"+div_id;
	var img_list =$(divId).find("img");
	var div_width =$(divId).width();
	$.each(img_list,function(i,item){
		var img_w =item.width;
		var img_h =item.height;
		var ratio =div_width / img_w;
		var img_adapter_h =img_h *ratio;
		item.width =div_width;
		item.height =img_adapter_h;
	});
}