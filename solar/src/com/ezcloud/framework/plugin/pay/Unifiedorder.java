package com.ezcloud.framework.plugin.pay;

import com.ezcloud.framework.util.FieldUtil;
import com.ezcloud.framework.util.Md5Util;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.util.XmlUtil;
import com.ezcloud.framework.vo.Row;

public class Unifiedorder {

	
	private String appid ="";		//公众账号ID	(必填)是
	private String mch_id ="";		//商户号		(必填)是	
	private String device_info ="";	//设备号		(必填)否
	private String nonce_str ="";	//随机字符串	(必填)是
	private String sign ="";		//签名		(必填)是
	private String body ="";		//商品描述		(必填)是
	private String detail ="";		//商品详情		(必填)否
	private String attach ="";		//附加数据		(必填)否
	private String out_trade_no ="";//商户订单号	(必填)是
	private String fee_type ="";	//货币类型		(必填)否
	private String total_fee ="";	//总金额		(必填)是
	private String spbill_create_ip ="";//终端IP	(必填)是
	private String time_start ="";	//交易起始时间	(必填)否
	private String time_expire ="";	//交易结束时间	(必填)否
	private String goods_tag ="";	//商品标记		(必填)否
	private String notify_url ="";	//通知地址		(必填)是
	private String trade_type ="";	//交易类型		(必填)是 取值如下：JSAPI，NATIVE，APP，WAP
	private String product_id ="";	//商品ID		(必填)否
	private String openid ="";		//用户标识		(必填)否
	public Unifiedorder() {
		super();
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getDevice_info() {
		return device_info;
	}
	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public String getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getTime_expire() {
		return time_expire;
	}
	public void setTime_expire(String time_expire) {
		this.time_expire = time_expire;
	}
	public String getGoods_tag() {
		return goods_tag;
	}
	public void setGoods_tag(String goods_tag) {
		this.goods_tag = goods_tag;
	}
	public String getNotify_url() {
		return notify_url;
	}
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String isDataValid()
	{
		String err_msg ="";
		if(StringUtils.isEmptyOrNull(appid))
		{
			err_msg +="公众账号ID[appid]是空;";
		}
		if(StringUtils.isEmptyOrNull(mch_id))
		{
			err_msg +="商户号[mch_id]是空;";
		}
		if(StringUtils.isEmptyOrNull(nonce_str))
		{
			err_msg +="随机字符串[nonce_str]是空;";
		}
		if(StringUtils.isEmptyOrNull(sign))
		{
			err_msg +="签名[sign]是空;";
		}
		if(StringUtils.isEmptyOrNull(body))
		{
			err_msg +="商品描述[body]是空;";
		}
		if(StringUtils.isEmptyOrNull(out_trade_no))
		{
			err_msg +="商户订单号[out_trade_no]是空;";
		}
		if(StringUtils.isEmptyOrNull(total_fee))
		{
			err_msg +="总金额[total_fee]是空;";
		}
		if(StringUtils.isEmptyOrNull(spbill_create_ip))
		{
			err_msg +="终端IP[spbill_create_ip]是空;";
		}
		if(StringUtils.isEmptyOrNull(notify_url))
		{
			err_msg +="通知地址[notify_url]是空;";
		}
		if(StringUtils.isEmptyOrNull(trade_type))
		{
			err_msg +="交易类型[trade_type]是空;";
		}
		return err_msg;
	}
	
	public String getXmlStr()
	{
		String xml =XmlUtil.objectToXml(this);
		xml =xml.replace("__", "_");
		return xml;
	}
	/**
	 * 计算签名
	 */
	public Row calculateSignAndXml(Unifiedorder object,String secret)
	{
		Row row =FieldUtil.getObjectNotEmptyFieldsUrlParamsStr(object,secret);
		String sign =row.getString("sign","");
		String xml =row.getString("xml","");
		String url =row.getString("url","");
//		urlPramStr =FieldUtil.appendFiledToUrlParam(urlPramStr, "key", secret);
//		sign =Md5Util.get32UppercaseMD5(urlPramStr);
		object.setSign(sign);
		return row;
	}
	
	
	
	public static void main(String[] args) {
		Unifiedorder unifiiedorder =new Unifiedorder();
		unifiiedorder.setAppid("1231");
		String xml =unifiiedorder.getXmlStr();
//		System.out.print("\n---"+xml);
		String sign1 ="appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=WKZ8ZRU8HYUUBW8QMLA6PINJX6ZV&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da";
		String sign2 ="appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=4ZWZUCS8LXXBGBQV2PGKN2W1GUFA&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da";
//		String sign ="appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=HUWQQSHGGQQXFQCMHEB52ZRKZLP5&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da";
		System.out.println(sign1.equals(sign2));
		System.out.println("sign:"+Md5Util.Md5(sign1));
		System.out.println("sign:"+Md5Util.Md5(sign2));
		String sign =Md5Util.Md5("appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=4ZWZUCS8LXXBGBQV2PGKN2W1GUFA&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da");
		System.out.println("sign11:"+sign);
		sign =Md5Util.Md5("appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=4ZWZUCS8LXXBGBQV2PGKN2W1GUFA&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da");
		System.out.println("step 3===>>"+sign);
	}
}
