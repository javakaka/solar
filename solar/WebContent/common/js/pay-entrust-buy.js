$(function(){
	$pay_type_value =$("#pay_type_value");
	$pay_type_list =$("[name='pay_type']");
	$pay_type_list.click(function(obj){
		$this =$(this);
		var pay_type =$this.attr("data-num");
		if(pay_type == "2")
		{
			$this.removeClass("selected");
			$("#wx_pay_item").addClass("selected");
			$pay_type_value.val($("#wx_pay_item").attr("data-num"));
			showMsg('暂时只支持微信支付',2);
			return;
		}
		else if(pay_type == "3")
		{
			$this.removeClass("selected");
			$("#wx_pay_item").addClass("selected");
			$pay_type_value.val($("#wx_pay_item").attr("data-num"));
			showMsg('暂时只支持微信支付',2);
			return;
		}
		else
		{
			$pay_type_list.removeClass("selected");
			$this.addClass("selected");
			$pay_type_value.val($this.attr("data-num"));
		}
		
	});
 });
 	

function showClockSettingLayer()
{
	
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